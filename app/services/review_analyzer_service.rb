require "httparty"

class ReviewAnalyzerService
  include HTTParty
  # Change the IP address to localhost here:
  base_uri "http://192.168.1.65:8888"
  MODEL = ENV.fetch("UNSLOTH_MODEL", "unsloth_Qwen2.5-3B-Instruct__project-sentiment_1792925930")
  def initialize(rating = nil, review_text = nil)
    @rating = rating
    @review_text = review_text
  end

  def analyze
    response = request(<<~PROMPT)
      Analyze this customer review.
      Return exactly two lines:
      SENTIMENT: positive, negative, or mixed
      ANALYSIS: one concise explanation of the sentiment

      Rating: #{@rating}
      Review: #{@review_text}
    PROMPT

    return if response.blank?

    sentiment = response[/SENTIMENT:\s*(positive|negative|mixed)/i, 1]&.downcase
    analysis = response[/ANALYSIS:\s*(.+)/i, 1]&.strip

    { sentiment: sentiment || "mixed", analysis: analysis || response.strip }
  end

  def analyze_product(product_name, reviews)
    review_text = reviews.map.with_index do |review, index|
      "#{index + 1}. Rating: #{review.ratings}; Review: #{review.review}; Sentiment: #{review.sentiment}"
    end.join("\n")

    request(<<~PROMPT)
      Summarize the overall customer opinion of the product "#{product_name}" using all reviews below.
      Mention the main strengths, weaknesses, and the most important improvement customers want.
      Return one concise paragraph.

      #{review_text}
    PROMPT
  end

  private

  def request(prompt)
    options = {
      body: {
        model: MODEL,
        messages: [ { role: "user", content: prompt } ]
      }.to_json,
      headers: { "Content-Type" => "application/json" }
    }

    response = self.class.post("/v1/chat/completions", options)

    if response.success?
      response.dig("choices", 0, "message", "content")&.strip
    else
      Rails.logger.error("Unsloth API Error: #{response.body}")
      nil
    end
  rescue Errno::ECONNREFUSED, Net::OpenTimeout, Net::ReadTimeout => e
    Rails.logger.error("Unsloth API connection failed: #{e.class}: #{e.message}")
    nil
  end
end

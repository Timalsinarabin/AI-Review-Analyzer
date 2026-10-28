# AI Review Analyzer 🤖

AI Review Analyzer is a Ruby on Rails web application designed to analyze customer reviews using artificial intelligence. It helps users understand customer feedback by identifying sentiment, summarizing reviews, and extracting meaningful insights.

## ✨ Features

- **Sentiment Analysis** — Identify positive, negative, and neutral reviews.
- **AI-Powered Insights** — Extract meaningful information from customer feedback.
- **Review Summarization** — Generate concise summaries of lengthy reviews.
- **Keyword Extraction** — Identify frequently mentioned topics and keywords.
- **User-Friendly Interface** — Analyze reviews through a simple web interface.

## 🛠️ Tech Stack

- **Backend:** Ruby on Rails
- **Language:** Ruby
- **Database:** SQLite
- **Frontend:** ERB, HTML, CSS, JavaScript
- **AI Integration:** unsloth_Qwen2.5-3B-Instruct
- **Fine tuned:** unsloth_Qwen2.5-3B-Instruct__project-sentiment_1792925930
- **Fine tuning dataset:** synthetic generated using chat gpt around 120 rows
- **Dependency Management:** Bundler

## 📋 Prerequisites

Make sure you have the following installed:

- Ruby
- Ruby on Rails
- Bundler
- Git
- A supported database, such as PostgreSQL or SQLite
- An AI API key, if your application uses an external AI service

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/ai-review-analyzer.git
cd ai-review-analyzer
```

### 2. Install Dependencies

Install the required Ruby gems:

```bash
bundle install
```

### 3. Configure the Database

Check your `config/database.yml` file and configure the database for your environment.

Create and migrate the database:

```bash
bin/rails db:create
bin/rails db:migrate
```

If the project uses seed data, you can optionally run:

```bash
bin/rails db:seed
```

### 4. Start the Rails Server

Run the application locally:

```bash
bin/dev
```

Open your browser and visit:

```text
http://localhost:3000
```

## 🧠 How It Works

1. **Submit a Review:** The user enters or selects a customer review.
2. **Process the Text:** The application validates and prepares the review.
3. **Analyze with AI:** The review is sent to the configured AI service or NLP model.
4. **Generate Insights:** The system determines sentiment and extracts relevant information.
5. **Display Results:** The analysis is presented through the Rails application interface.

## 📊 Example

**Input Review:**
<img width="1901" height="927" alt="Screenshot 2026-10-28 173625" src="https://github.com/user-attachments/assets/3f2b3787-76cd-4804-9e4e-26f1c70d329c" />

<img width="1917" height="912" alt="Screenshot 2026-10-28 094833" src="https://github.com/user-attachments/assets/e604596c-b89a-4039-99d4-cf89eb36efd1" />

<img width="1917" height="880" alt="Screenshot 2026-10-28 094811" src="https://github.com/user-attachments/assets/7a558bb9-cf12-4eda-952b-0e52bd1b7fe9" />



**Example Analysis:**

| Attribute | Result |
|---|---|
| Overall Sentiment | Mixed |
| Positive Feedback | Good product quality and fast delivery |
| Negative Feedback | Slow customer support |
| Main Topic | Product quality and customer service |
| Suggested Improvement | Improve customer support response time |

*This is an illustrative example. Actual results depend on the AI model and application implementation.*

## 🗂️ Project Structure

A typical Ruby on Rails project may have the following structure:

```text
ai-review-analyzer/
├── app/
│   ├── controllers/      # Handle HTTP requests
│   ├── models/           # Application data and business logic
│   ├── views/            # HTML templates
│   ├── jobs/             # Background jobs, if applicable
│   └── services/         # AI analysis services, if applicable
├── config/               # Application and database configuration
├── db/
│   ├── migrate/           # Database migrations
│   └── schema.rb          # Database schema
├── spec/                 # RSpec tests, if configured
├── test/                 # Rails tests
├── Gemfile               # Ruby dependencies
├── Gemfile.lock          # Locked dependency versions
├── .gitignore
└── README.md
```


## 🔒 Security

- Store API keys and credentials securely.
- Keep `.env` files and other secret configuration files out of Git.
- Validate and sanitize user input.
- Handle AI API errors and rate limits appropriately.
- Avoid exposing sensitive customer information in logs or API requests.

## 🛣️ Future Improvements

- [ ] Add bulk review analysis.
- [ ] Display sentiment analysis using interactive charts.
- [ ] Support multiple languages.
- [ ] Detect spam and potentially fake reviews.
- [ ] Add review filtering and search.
- [ ] Export analysis reports to CSV or PDF.
- [ ] Add user authentication and review history.

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/new-feature`).
3. Commit your changes.
4. Push the branch to your fork.
5. Open a pull request.

## 📄 License

Choose a license that fits your project and add the corresponding `LICENSE` file. If you use the MIT License, include the official MIT License text.


⭐ If you find this project useful, consider giving the repository a star!


# db/seeds.rb

# Clear existing data (reviews first because they belong to products)
Review.destroy_all
Product.destroy_all

products_data = [
  {
    name: "Wireless Headphones",
    price: 79.99,
    description: "Comfortable wireless headphones with clear sound, deep bass, and long battery life."
  },
  {
    name: "Mechanical Keyboard",
    price: 89.99,
    description: "A responsive mechanical keyboard designed for gaming, programming, and everyday typing."
  },
  {
    name: "Wireless Mouse",
    price: 34.99,
    description: "An ergonomic wireless mouse with precise tracking and adjustable sensitivity."
  },
  {
    name: "Smart Watch",
    price: 129.99,
    description: "A stylish smartwatch with activity tracking, notifications, and heart rate monitoring."
  },
  {
    name: "Bluetooth Speaker",
    price: 59.99,
    description: "A portable Bluetooth speaker with rich audio and a compact waterproof design."
  },
  {
    name: "Laptop Stand",
    price: 39.99,
    description: "An adjustable laptop stand that improves posture and helps keep your desk organized."
  },
  {
    name: "USB-C Hub",
    price: 44.99,
    description: "A versatile USB-C hub with multiple ports for connecting your everyday devices."
  },
  {
    name: "Webcam HD",
    price: 69.99,
    description: "A high-definition webcam suitable for video calls, online classes, and streaming."
  }
]

# Create 8 products
products = products_data.map do |attributes|
  Product.create!(attributes)
end

reviews_data = {
  "Wireless Headphones" => [
    [ 5, "Excellent sound quality and very comfortable to wear." ],
    [ 5, "The battery lasts much longer than I expected." ],
    [ 4, "Great headphones, although the bass could be a little stronger." ],
    [ 5, "Perfect for listening to music while working." ],
    [ 3, "Sound is decent, but the fit could be improved." ],
    [ 4, "Good value for the price." ],
    [ 5, "I use these every day and absolutely love them." ]
  ],

  "Mechanical Keyboard" => [
    [ 5, "Typing feels amazing and the keys are very responsive." ],
    [ 4, "Solid build quality and a nice typing experience." ],
    [ 5, "Perfect for programming and long typing sessions." ],
    [ 3, "The keys are louder than I expected." ],
    [ 4, "Good keyboard with a comfortable layout." ],
    [ 5, "Definitely worth the money." ],
    [ 4, "Works perfectly for both gaming and office work." ]
  ],

  "Wireless Mouse" => [
    [ 5, "Very smooth tracking and comfortable to use." ],
    [ 4, "Good mouse with reliable wireless connectivity." ],
    [ 5, "The battery life is impressive." ],
    [ 3, "A little small for my hands, but it works well." ],
    [ 4, "Great for everyday computer use." ],
    [ 5, "Lightweight, responsive, and easy to set up." ]
  ],

  "Smart Watch" => [
    [ 5, "The activity tracking features are really useful." ],
    [ 4, "Looks stylish and connects easily to my phone." ],
    [ 5, "Great battery life and a bright display." ],
    [ 3, "Some features take time to figure out." ],
    [ 4, "A good smartwatch for everyday use." ],
    [ 5, "I love tracking my daily steps with this watch." ]
  ],

  "Bluetooth Speaker" => [
    [ 5, "Impressive sound for such a small speaker." ],
    [ 4, "Portable and easy to connect to my phone." ],
    [ 5, "Perfect for outdoor trips and small gatherings." ],
    [ 3, "The volume could be a little louder." ],
    [ 4, "Good sound quality and a nice compact design." ],
    [ 5, "The battery lasts a long time." ]
  ],

  "Laptop Stand" => [
    [ 5, "My desk setup is much more comfortable now." ],
    [ 4, "Sturdy stand and easy to adjust." ],
    [ 5, "Excellent quality and very useful for working." ],
    [ 3, "Works well, but takes up more desk space than expected." ],
    [ 4, "Good build quality for the price." ],
    [ 5, "Helps improve my posture while using my laptop." ]
  ],

  "USB-C Hub" => [
    [ 5, "All the ports I need in one compact device." ],
    [ 4, "Works well with my laptop and external monitor." ],
    [ 5, "Easy to use and very convenient." ],
    [ 3, "It gets a little warm during extended use." ],
    [ 4, "Good connectivity and reasonable price." ],
    [ 5, "Exactly what I needed for my workstation." ]
  ],

  "Webcam HD" => [
    [ 5, "Clear video quality for meetings and online classes." ],
    [ 4, "Easy to install and works well." ],
    [ 5, "Great picture quality in good lighting." ],
    [ 3, "Low-light performance could be better." ],
    [ 4, "A reliable webcam for everyday video calls." ],
    [ 5, "Very happy with the quality for this price." ]
  ]
}

# Create 50 reviews associated with their products
reviews_data.each do |product_name, reviews|
  product = products.find { |item| item.name == product_name }

  reviews.each do |rating, content|
    product.reviews.create!(
      ratings: rating,
      review: content
    )
  end
end

puts "Seed completed!"
puts "Products created: #{Product.count}"
puts "Reviews created: #{Review.count}"

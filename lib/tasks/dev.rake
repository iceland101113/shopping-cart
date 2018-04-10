namespace :dev do
  task fake_product: :environment do
    Product.destroy_all

    1000.times do |i|

      pro_price = rand(10000)
      Product.create!(name: FFaker::Product.product_name, 
        description: FFaker::Lorem.paragraph, price: pro_price, image: FFaker::Avatar.image)
    end

    puts "have created fake products"
    puts "now you have #{Product.count} products data"

  end

end
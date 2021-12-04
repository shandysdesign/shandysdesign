# frozen_string_literal: true

Item.create_with(
  description: 'Built with outdoor friendly cedar, this classic chair is great for anywhere you ' \
               'want to lounge outside. Can be left natural, sealed, stained, or painted. ' \
               'Available with or without beer holder. Free delivery anywhere in Colorado, other ' \
               'locations please ask.',
  price: 300,
  status: 'available'
).where(name: 'Adirondack Chair').first_or_create!

Item.create_with(
  price: 350,
  description: 'Handcrafted adirondack chair with your favorite mountain topography, name, and ' \
               'elevation with artistic pyrography. Free delivery anywhere in Colorado, other ' \
               'locations please email.',
  status: 'available'
).where(name: 'Mountain Adirondack Chair').first_or_create!

Item.create_with(
  price: 30,
  description: 'This balancing wine holder is a fun addition to any party and a great gift for ' \
               'your wine loving friends and family! Comes in a variety of colors, patterns and ' \
               'shapes, and can be customized. Free shipping in the continental US, others ' \
               'please contact for quote.',
  status: 'available'
).where(name: 'Balancing Wine Holder').first_or_create!

Item.create_with(
  price: 100,
  description: 'A handmade hardwood cutting board is a must have for any kitchen. Comes in a ' \
               'variety of sizes and patterns. Free shipping or delivery anywhere in Colorado. ' \
               'Outside of Colorado please email for shipping costs',
  status: 'available'
).where(name: 'Hardwood Cutting Board').first_or_create!

Item.create_with(
  price: 150,
  description: 'Sliding top box built with traditional joinery techniques. Made from hard maple ' \
               'and bubinga hardwoods. Boxes can be made custom with different woods and ' \
               'dimensions, email for details. Free shipping in the US.',
  status: 'available'
).where(name: 'Handmade Keepsake Box').first_or_create!

Item.create_with(
  price: 150,
  description: 'Rustic hand built serving tray. Tray shown measures 13" x 19" (22" including ' \
               'handles) x 3" and is built from African Mahogany and Hard Maple. Trays can be ' \
               'customized with different woods and dimensions.',
  status: 'available'
).where(name: 'Hardwood Serving Tray').first_or_create!

Item.create_with(
  price: 175,
  description: 'Handbuilt whiskey box made from black walnut and white oak. Can be custom sized ' \
               'for your favorite bottle. Makes a great gift for that whiskey lover!',
  status: 'available'
).where(name: 'Whiskey Box').first_or_create!

Item.all.each do |item|
  next if item.photos.present?

  file = Rails.root.join('db/seeds/photos', "#{item.name}.png")
  item.photos.attach(io: File.open(file), filename: File.basename(file))

  file = Rails.root.join('db/seeds/photos', "#{item.name}2.png")
  next unless File.exists?(file)

  item.photos.attach(io: File.open(file), filename: File.basename(file))
end

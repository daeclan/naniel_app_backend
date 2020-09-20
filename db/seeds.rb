# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create!(user_name: "bubble_stud", email: "bubble_stud@sera.com", about_me: "From ME, but live in IL.")
user1 = User.create!(user_name: "naniel_is_cool", email: "naniel_is_cool@hotmail.com", about_me: "From MA, but live in ME.")
user2 = User.create!(user_name: "senfam4life", email: "sean@senfam.com", about_me: "From MA, but live in CA.")
user3 = User.create!(user_name: "lilstud27", email: "lilstud27@yahoo.com", about_me: "From ME, but live in HL.")

Cause.create!(name: "Naniel", goal: "10,000", description: "I was diagnosed with Lyme Disease a few years back, and sadly things have gotten more complicated since then. Please help if you can.", status: true, user_id: 1)
Cause.create!(name: "Black Lives Matter", goal: "1,000,000", description: "A social movement advocating for non-violent civil disobedience in protest against incidents of police brutality and all racially motivated violence against black people.", status: true, user_id: 1)
Cause.create!(name: "Lyme Disease", goal: "5,000", description: "Lyme disease is a bacterial infection you get from the bite of an infected tick. At first, Lyme disease usually causes symptoms such as a rash, fever, headache, and fatigue. But if it is not treated early, the infection can spread to your joints, heart, and nervous system.", status: true, user_id: 1)


Product.create!(name: "Rare W.A.S.T.E Jacket", price: 1000, image_url: "https://i.etsystatic.com/20601890/r/il/3774ca/2298624554/il_1588xN.2298624554_42fr.jpg", user_id: 1, cause_id: 1)
Product.create!(name: "YHWH Statue", price: 400, image_url: "https://cdn3.volusion.com/bxqxk.xvupj/v/vspfiles/photos/RYDENM153-2.jpg?v-cache=1327064021", user_id: 1, cause_id: 2)
Product.create!(name: "Keith Haring Ornament", price: 150, image_url: "https://thumbs.worthpoint.com/zoom/images3/1/0611/15/keith-haring-1989-christmas-ornament_1_f58fc8d74a429d19bd37d27502cbc5ab.jpg", user_id: 3, cause_id: 3)
Product.create!(name: "Supreme Super Soaker", price: 75, image_url: "https://stockx.imgix.net/products/streetwear/Supreme-Super-Soaker-50-Water-Blaster-White.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&q=90&trim=color&updated_at=1561039680&w=1000", user_id: 4, cause_id: 1)
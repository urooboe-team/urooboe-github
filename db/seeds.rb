# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Character.create(name: 'Luke', movie: movies.first)

Product.create(
	genre_id: 1,
	product_name: "焼きモンブラン",
	product_description:"めっちゃ美味しい焼き栗",
	unit_price:1000,
	sale_status:"true",
	created_at:"2020-02-11 05:42:39"
	)

Product.create(
	genre_id: 1,
	product_name: "焼きモンブラン2",
	product_description:"めっちゃ美味しい伝説の焼き栗",
	unit_price:1000,
	sale_status:"true",
	)
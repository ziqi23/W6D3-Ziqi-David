# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([{ username: "Alex" }, { username: "Bob" }, { username: "Carl" }, { username: "Drake" }, { username: "Elvin" }, { username: "Frank" }, { username: "George" }])

artworks = Artwork.create([{ title: "Sunrise", image_url: "abvcxcd.com", artist_id: User.find_by(username: "Alex").id },
                            { title: "Sunset", image_url: "abawdc.com", artist_id: User.find_by(username: "Alex").id},
                            { title: "Noon", image_url: "abfwdce.com", artist_id: User.find_by(username: "Alex").id },
                            { title: "Sunrise", image_url: "abegwecf.com", artist_id: User.find_by(username: "Bob").id },
                            { title: "Oxtail", image_url: "abcsdas.com", artist_id: User.find_by(username: "Carl").id },
                            { title: "Lavender", image_url: "axcvxzbc.com", artist_id: User.find_by(username: "Drake").id},
                            { title: "Ramen", image_url: "awadbvc.com", artist_id: User.find_by(username: "Elvin").id },
                            { title: "Waves", image_url: "abghrwsgc.com", artist_id: User.find_by(username: "Frank").id },
                            { title: "Clouds", image_url: "abeasdac.com", artist_id: User.find_by(username: "George").id }])

artwork_share1 = ArtworkShare.create([{ artwork_id: Artwork.find_by(title: "Oxtail").id , viewer_id:  User.find_by(username: "Alex").id }])
artwork_share2 = ArtworkShare.create([{ artwork_id: Artwork.find_by(title: "Ramen").id, viewer_id: User.find_by(username: "Bob").id }])
artwork_share3 = ArtworkShare.create([{ artwork_id: Artwork.find_by(title: "Clouds").id, viewer_id:  User.find_by(username: "Alex").id }])
artwork_share4 = ArtworkShare.create([{ artwork_id: Artwork.find_by(title: "Clouds").id, viewer_id: User.find_by(username: "Carl").id }])
artwork_share5 = ArtworkShare.create([{ artwork_id: Artwork.find_by(title: "Noon").id, viewer_id: User.find_by(username: "Elvin").id }])
artwork_share6 = ArtworkShare.create([{ artwork_id: Artwork.find_by(title: "Sunrise").id, viewer_id: User.find_by(username: "Bob").id }])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([{ username: "Alex" }, { username: "Bob" }, { username: "Carl" }, { username: "Drake" }, { username: "Elvin" }, { username: "Frank" }, { username: "George" }])

artworks = Artwork.create([{ title: "Sunrise", image_url: "abvcxcd.com", artist_id: 1 },
                            { title: "Sunset", image_url: "abawdc.com", artist_id: 1 },
                            { title: "Noon", image_url: "abfwdce.com", artist_id: 1 },
                            { title: "Sunrise", image_url: "abegwecf.com", artist_id: 2 },
                            { title: "Oxtail", image_url: "abcsdas.com", artist_id: 3 },
                            { title: "Lavender", image_url: "axcvxzbc.com", artist_id: 4 },
                            { title: "Ramen", image_url: "awadbvc.com", artist_id: 6 },
                            { title: "Waves", image_url: "abghrwsgc.com", artist_id: 5 },
                            { title: "Clouds", image_url: "abeasdac.com", artist_id: 7 }])

artwork_share1 = ArtworkShare.create([{ artwork_id: 1, viewer_id: 3 }])
artwork_share2 = ArtworkShare.create([{ artwork_id: 2, viewer_id: 3 }])
artwork_share3 = ArtworkShare.create([{ artwork_id: 3, viewer_id: 1 }])
artwork_share4 = ArtworkShare.create([{ artwork_id: 4, viewer_id: 2 }])
artwork_share5 = ArtworkShare.create([{ artwork_id: 5, viewer_id: 6 }])
artwork_share6 = ArtworkShare.create([{ artwork_id: 7, viewer_id: 3 }])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(username: "rega1237")
user2 = User.create!(username: "johndoe")
user3 = User.create!(username: "janedoe")

stadium1 = Stadium.create!(name: "Camp Nou", country: "Spain", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium2 = Stadium.create!(name: "Allianz Arena", country: "Germany", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium3 = Stadium.create!(name: "Wembley Stadium", country: "England", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium4 = Stadium.create!(name: "San Siro", country: "Italy", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium5 = Stadium.create!(name: "Signal Iduna Park", country: "Germany", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium6 = Stadium.create!(name: "Parc des Princes", country: "France", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium7 = Stadium.create!(name: "Estadio Santiago Bernabéu", country: "Spain", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")
stadium8 = Stadium.create!(name: "Olympiastadion Berlin", country: "Germany", seats: 5, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Camp_Nou_2017.jpg/1200px-Camp_Nou_2017.jpg")

team1 = Team.create!(name: "Barcelona", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team2 = Team.create!(name: "Bayern Munich", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team3 = Team.create!(name: "Chelsea", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team4 = Team.create!(name: "AC Milan", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team5 = Team.create!(name: "Borussia Dortmund", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team6 = Team.create!(name: "Paris Saint-Germain", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team7 = Team.create!(name: "Real Madrid", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")
team8 = Team.create!(name: "Hertha Berlin", flag: "https://upload.wikimedia.org/wikipedia/en/thumb/3/3e/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png")

game1 = Game.create!(team_a: team1, team_b: team2, stadium: stadium1, date: "2023-06-01")
game2 = Game.create!(team_a: team3, team_b: team4, stadium: stadium2, date: "2023-07-01")
game3 = Game.create!(team_a: team5, team_b: team6, stadium: stadium3, date: "2023-08-01")
game5 = Game.create!(team_a: team7, team_b: team8, stadium: stadium4, date: "2023-09-01")
game6 = Game.create!(team_a: team1, team_b: team3, stadium: stadium5, date: "2023-10-01")
game7 = Game.create!(team_a: team2, team_b: team4, stadium: stadium6, date: "2023-11-01")
game8 = Game.create!(team_a: team5, team_b: team7, stadium: stadium7, date: "2023-12-01")
game9 = Game.create!(team_a: team6, team_b: team8, stadium: stadium1, date: "2023-01-01")

resevation1 = Reservation.create!(user: user1, game: game1, stadium: stadium1)
resevation2 = Reservation.create!(user: user2, game: game2, stadium: stadium2)
resevation3 = Reservation.create!(user: user3, game: game3, stadium: stadium3)
reservation4 = Reservation.create!(user: user1, game: game5, stadium: stadium4)
reservation5 = Reservation.create!(user: user1, game: game6, stadium: stadium5)
reservation6 = Reservation.create!(user: user2, game: game7, stadium: stadium6)
reservation7 = Reservation.create!(user: user3, game: game8, stadium: stadium7)
reservation8 = Reservation.create!(user: user3, game: game1, stadium: stadium1)
reservation9 = Reservation.create!(user: user1, game: game2, stadium: stadium2)
reservation10 = Reservation.create!(user: user2, game: game3, stadium: stadium3)

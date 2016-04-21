#1
scissors = Cart.create!(name:        "scissors",
                        wins_with1:  3,
                        wins_with2:  5,
                        loses_with1: 2,
                        loses_with2: 4)
#2
rock = Cart.create!(name:            "rock",
                        wins_with1:  1,
                        wins_with2:  5,
                        loses_with1: 3,
                        loses_with2: 4)
#3
paper = Cart.create!(name:       "paper",
                        wins_with1:  2,
                        wins_with2:  4,
                        loses_with1: 1,
                        loses_with2: 5)
#4
spock = Cart.create!(name:       "spock",
                        wins_with1:  1,
                        wins_with2:  2,
                        loses_with1: 3,
                        loses_with2: 5)
#5
lizard = Cart.create!(name:       "lizard",
                        wins_with1:  4,
                        wins_with2:  1,
                        loses_with1: 2,
                        loses_with2: 3)
puts "Cards generated!"

User.create!(name: "Sheldon Cooper")

puts "Default played generated"
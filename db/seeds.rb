# #1
# scissors = Cart.create!(name:        "scissors",
#                         wins_with1:  3,
#                         wins_with2:  5,
#                         loses_with1: 2,
#                         loses_with2: 4)
# #2
# rock = Cart.create!(name:            "rock",
#                         wins_with1:  1,
#                         wins_with2:  5,
#                         loses_with1: 3,
#                         loses_with2: 4)
# #3
# paper = Cart.create!(name:       "paper",
#                         wins_with1:  2,
#                         wins_with2:  4,
#                         loses_with1: 1,
#                         loses_with2: 5)
# #4
# spock = Cart.create!(name:       "spock",
#                         wins_with1:  1,
#                         wins_with2:  2,
#                         loses_with1: 3,
#                         loses_with2: 5)
# #5
# lizard = Cart.create!(name:       "lizard",
#                         wins_with1:  4,
#                         wins_with2:  1,
#                         loses_with1: 2,
#                         loses_with2: 3)
# puts "Cards generated!"

# User.create!(name: "Sheldon Cooper")

# puts "Default played generated"

 Quote.create!(content:
"Scissors cuts paper, paper covers rock, rock crushes lizard,
lizard poisons Spock, Spock smashes scissors, scissors decapitates lizard,
lizard eats paper, paper disproves Spock, Spock vaporizes rock,
and as it always has, rock crushes scissors.",
author: "Sheldon")
 Quote.create!(content: 
"I know the real reason you never made progress with that idea. You thought of it September 22nd 2007.
Two days later, Penny moved in and so much blood rushed to your genitals, your brain became a ghost town.",
author: "Sheldon")
 Quote.create!(content:
"1. I lost my virginity to my cousin, Jeanie.
2. It was my Uncle Murray's funeral, we were all back at my Aunt Barbara's house.
Our eyes locked over the pickled herring. We never meant for it to happen.
3. To this day, I can't look at pickled herring without being aroused and ashamed. Oh, cousin Jeanie.",
author: "Howard")
 Quote.create!(content:
"If it\'s \"creepy\" to use the Internet, military satellites, and robot aircraft to find a house full of gorgeous young models so I can drop in on them unexpected, then fine, I\'m \'creepy\'",
author: "Howard")
 Quote.create!(content:
"I'm a horny engineer, Leonard. I never joke about math or sex.",
author: "Howard")
 Quote.create!(content:
"Penny. We are made of particles that have existed since the moment the universe began. I like to think those atoms traveled fourteen billion years through time and space to create us, so that we could be together and make each other whole.",
author:"Leonard")
 Quote.create!(content:
"Would someone please turn off the Sheldon commentary track?",
author: "Leonard")
 Quote.create!(content:
"Amy, good luck getting these guys excited about a dinner with a theme. I gave up when no one cared about my Tom Hanks-Giving.",
author: "Raj")
 Quote.create!(content:
"Well, I'm a Hindu. My religion teaches that if we suffer in this life we are rewarded in the next. Three months at the North Pole with Sheldon and I'm reborn as a well-hung billionaire with wings.",
author: "Raj")
 Quote.create!(content:
"Cute is for bunnies. I want to be something with sex appeal. Like a labradoodle.",
author: "Raj")
 Quote.create!(content:
"Can you believe it! He watched me work for 10 minutes and than he tried to build a little piece of software that could replace me.",
author: "Raj")
puts "Quotes created!"
# Quote.create!(content:
#"",
#author: "")


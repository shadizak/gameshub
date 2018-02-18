# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "FIFA 18", category: "Sport/Football", description: "Powered by Frostbite, FIFA 18 blurs the line between the virtual and real worlds, bringing to life the players, teams and atmospheres of The World’s Game. Move with Real Player Motion Technology - an all-new animation system that creates a new level of responsiveness and player personality - to unlock dramatic moments in the world’s most immersive atmospheres. Then go on a global journey as Alex Hunter along with a star-studded cast of characters, including Cristiano Ronaldo and other European football stars.", image_url: "fifa18.jpg", price: 59.99)

Product.create(name: "Call of Duty WWII", category: "FPS/Action", description: "A breathtaking experience that redefines World War II for a new gaming generation. Land in Normandy on D-Day and battle across Europe through iconic locations in history’s most monumental war. Experience classic Call of Duty combat, the bonds of camaraderie, and the unforgiving nature of war.", image_url: "codww2.png", price: 89.99)

Product.create(name: "GTA V", category: "FPS/Adventure", description: "Launch your supercar from Stunt Ramps, skydive over the Alamo Sea and barrel roll through Air Gates on your way to the finish line - all in the same track with Transform Races, the latest evolution of racing in GTA Online.", image_url: "gtav.jpg", price: 59.99)

Product.create(name: "Battlefield 1", category: "FPS/Action", description: "In Battlefield 1, discover a world where mounted cavalries, tanks and biplanes collide, and war will never be the same. Check out new weapons, unique vehicles, a never-before-seen mode, and more.", image_url: "battlefield1.jpg", price: 49.99)

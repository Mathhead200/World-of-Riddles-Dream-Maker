

obj/item/key
	gold
		icon = 'key.dmi'

	bronze
		icon = 'key2.dmi'


obj/item/spring
	basic
		icon = 'spring.dmi'
		dist = 2


obj/item/crystal
	red
		icon = 'red_crystal.dmi'
		color = "Red"

	blue
		icon = 'blue_crystal.dmi'
		color = "Blue"


obj/teleporter
	basic
		icon = 'teleporter2.dmi'
		settings = list("Red", "Blue", "Green", "Yellow", "Purple", "Teal", "Off")

	blank
		icon = 'teleporter2.dmi'


obj/door/key
	chain
		icon = 'door.dmi'
		keyType = /obj/item/key/gold


obj/door/riddle/choice
	tutorial
		icon = 'door2.dmi'
		name = "Tutorial Door"
		question = "Welcome to World of Riddles. The object of this game is to progress by getting to the staircase at the end of each level. Now select \"Continue\" and click \"Ok\""
		choices = list("Continue", "Fight the Power")
		answers = list("Continue")

		opening()
			alert(usr, "Very good. You may now continue though.", src.name)

		locked()
			alert(usr, "You picked the wrong answer, and if this was a real door you would loes a chance. You only have three chances, after that it's Game Over!", src.name, "Ok, I'v learned my leason.")
			return 0


obj/door/riddle/freeAnswer
	tutorial
		icon = 'door2.dmi'
		name = "Tutorial Door"
		question = "You will encounter many Riddle Doors, like these two from here on out. Just remember to think carefully and have fun. To continue, type in the answer to 2 + 2. For free answer doors like these it's best to answer with numbers or lowercase letters where appropriate"
		answers = list("4", "four", "Four", "FOUR")

		opening()
			usr << "Good Luck!"




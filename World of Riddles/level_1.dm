

obj/door/riddle/choice
	level1
		icon = 'door2.dmi'

		prime
			question = "Which of these is a prime number?"
			answers = list("2")
			choices = list("2","4", "6", "8", "9")


obj/door/riddle/freeAnswer
	level1
		icon = 'door2.dmi'


		note
			question = "On this floor there are 8 notes. On each note is a number. Put those notes in alphabetical order and enter (just) the numbers seperated by one space each (i.e. 1 2 3 4 5 6 7 8)."
			answers = list("93 62 9 54 33 87 20 102")

		face
			question = "What rhymes with 'Head'?.\" Your clue is: 62 33 54."
			answers = list("bed", "B E D", "B E D", "b e d")

		letterE
			question = "I'm the begging of eternity, the end of time and space. I'm the beginning of every end, and the end of every place. What am I?"
			answers = list("e", "E", "letter e", "the letter e", "letter E", "the letter E")

		Backwards
			question = "eht rewsna ot siht rood si thgir"
			answers = list("right" , "Right" , "the answer is right" , "The answer is Right")


obj/item/note
	mystery
		name = "Mystery Note"

		a
			icon = 'note_a.dmi'
			message = "A.93"
		b
			icon = 'note_b.dmi'
			message = "B.62"
		c
			icon = 'note_c.dmi'
			message = "C.9"
		d
			icon = 'note_d.dmi'
			message = "D.54"
		e
			icon = 'note_e.dmi'
			message = "E.33"
		f
			icon = 'note_f.dmi'
			message = "F.87"
		g
			icon = 'note_g.dmi'
			message = "G.20"
		h
			icon = 'note_h.dmi'
			message = "H.102"


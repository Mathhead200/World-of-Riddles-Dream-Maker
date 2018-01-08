////////////////////////////////////////////////////////////////////////////////
//This is a game called "Puzzlez" created by Christopher D'Angelo on 12-18-07.//
////////////////////////////////////////////////////////////////////////////////
//Last edited on 1-31-08//
//////////////////////////

area
	Entered()
		usr<<sound('Temple.mid',1,0,1,50)

mob
	icon='Player.dmi'
	Login()
		icon_state=gender
		usr.Move(locate(4,2,1))
		usr<<""
		usr<<"<b>LEVEL 1</b>"
		usr<<"Code: 0715192022"
		while(1)
			sleep(10)
			if(usr.Lives<=0)
				del(usr)
		..()
	var
		Keys=0
		Lives=3
	verb
		Check_Stats()
			usr<<""
			if(usr.Keys==1)
				usr<<"1 Key"
			else
				usr<<"[usr.Keys] Keys"
			if(usr.Lives==1)
				usr<<"1 Life"
			else
				usr<<"[usr.Lives] Lives"
		Codes(arg as text)
			if(arg=="0715192022")
				usr.Move(locate(4,2,1))
			if(arg=="200904211606")
				usr.Move(locate(32,32,2))
			if(arg=="2210151906")
				usr.Move(locate(9,28,3))
			if(arg=="0721192210")
				usr.Move(locate(30,32,4))
			if(arg=="0815230914091315230920")
				usr.Lives*=999999
obj
	Click()
		if(density==1)
			usr<<""
			usr<<"You can't reach there!"
		else
			walk_to(usr,src)
	proc
		Kill()
			if(usr.Lives<=0)
				usr<<""
				usr<<"<b>YOU DIED</b>"
				del(src)
	Key
		icon = 'Key.Dmi'
		verb
			Pick_Up()
				set src in view(0)
				usr.Keys+=1
				usr<<""
				usr << "You picked up a key!"
				del(src)
	Stick
		icon = 'stick.Dmi'
		verb
			Pick_Up()
				set src in view(0)
				usr.Keys+=1
				usr<<""
				usr << "You picked up a stick!"
				del(src)
	Jugwater
		icon = 'jugwater.Dmi'
		verb
			Pick_Up()
				set src in view(0)
				usr.Keys+=1
				usr<<""
				usr << "You picked up a jug full of water!"
				del(src)
	Book
		icon='Book.dmi'
		verb
			Pick_Up()
				set src in view(0)
				switch(alert("It appers to be a book. What would you like to do?",,"Read It","Throw It Agenst The Wall","Set It Back Down"))
					if("Read It")
						usr<<""
						usr<<"You examine it and it says..."
						usr<<"<b><u>In 1957, there was a ship called the Andor that was though to be the best of its time.</u></b>"
						usr<<"<b><u>That year it was scedualed to go out on it's madin vouage.</u></b>"
						usr<<"<b><u>During this vouage it got caught in a storm a capsised.</u></b>"
						usr<<"<b><u>Only one person survived to tell the tale.</u></b>"
						usr<<"You set the book back on the ground"
					if("Throw It Agenst The Wall")
						usr<<""
						usr<<"You deside that this book is useless and toss it at the wall."
						usr<<"The book falls apart and becomes imposable to read."
						del(src)
					if("Set It Back Down")
						usr<<""
						usr<<"You set the book back on the ground"
	Sign
		icon='sign.dmi'
		verb
			Read_Sign()
				set src in view(1)
				usr<<""
				usr<<"You pick to read the sign,it says..."
				usr<<"Just pic one space to fill,they all lead to the same place."
	Note
		icon='Note.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>A.93</u></b>"
	Note2
		icon='Note2.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>B.62</u></b>"
	Note3
		icon='Note3.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>C.9</u></b>"
	Note4
		icon='Note4.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>D.54</u></b>"
	Note5
		icon='Note5.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>E.33</u></b>"
	Note6
		icon='Note6.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>F.87</u></b>"
	Note7
		icon='Note7.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>G.20</u></b>"
	Note8
		icon='Note8.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"This note seems incomplete."
				usr<<"It might be part of a larger message."
				usr<<"The note says..."
				usr<<"<b><u>H.102</u></b>"
	Note9
		icon='Note.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"<b>This note appers to be part of a code. The note says...</b>"
				usr<<"<b><u>A.6</u></b>"
	Note10
		icon='Note2.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"<b>This note appers to be part of a code. The note says...</b>"
				usr<<"<b><u>B.11</u></b>"
	Note11
		icon='Note3.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"<b>This note appers to be part of a code. The note says...</b>"
				usr<<"<b><u>C.20</u></b>"
	Note12
		icon='Note4.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"<b>This note appers to be part of a code. The note says...</b>"
				usr<<"<b><u>D.37</u></b>"
	Note13
		icon='Note5.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"<b>This note appers to be part of a code. The note says...</b>"
				usr<<"<b><u>E.70</u></b>"
	Note14
		icon='Note14.dmi'
		verb
			Read_Note()
				set src in view(0)
				usr<<""
				usr<<"<b>This note appers to be some sort of a code. The note says...</b>"
				usr<<"<b><u>% = 7</u></b>"
				usr<<"<b><u>$ = 9</u></b>"
				usr<<"<b><u>@ = t</u></b>"
				usr<<"<b><u>L = h</u></b>"
				usr<<"<b><u>C = e</u></b>"
				usr<<"<b><u>V = i</u></b>"
				usr<<"<b><u>U = s</u></b>"
				usr<<"<b><u>* = a</u></b>"
				usr<<"<b><u># = n</u></b>"
				usr<<"<b><u>X = w</u></b>"
				usr<<"<b><u>P = r</u></b>"
	Door
		icon = 'Door.dmi'
		density = 1
		opacity = 1
		verb
			Open()
				set src in view(1)
				if(usr.Keys == 0)
					usr<<""
					usr<<"You examine the door and relise it has a small key hole in it!"
				else
					switch(alert("Do you want to use one of your keys?",,"Yes","No"))
						if("Yes")
							usr<<""
							usr<<"The door clicks open and your key disappers!"
							usr.Keys-=1
							usr<<sound('Correct.wav',0,0,2,100)
							del(src)
						if("No")
							usr<<""
							usr<<"You back away from the door slowly!"
	Door2
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"This is a tutorial door."
				usr<<"To get though these doors you must answer a riddle corectly."
				usr<<"For this door, the riddle is <b>15+10=x what is x?</b>"
				usr<<"Notic that the riddle is bolded."
				usr<<"Remember to put only the answer in the answer box."
				usr<<"The answer box will apper when you choose the verb Answer Riddle."
				usr<<"What I meen is that if the riddle is <b>What is 2+2</b>?"
				usr<<"You would put <b>4</b> in the answer box. THATS IT!"
				usr<<"Good luck, and try to get to the stair case in this level."
				usr<<"Also one more thing. Don't answer too many questions wrong."
				usr<<"You have 3 lives and you gane one each time you complete a level,"
				usr<<"but every time you get a wrong answer you loes a life."
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="25")
					usr<<""
					usr<<"Correct! Good Job!"
					usr<<"You will have to figure the rest out on your own."
					usr<<"I wish you the best of luck!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="25")
					usr<<""
					usr<<"Incorrect! Watch out!"
					usr<<"Because this is a practice door I will not hurt you,"
					usr<<"but the other doors will not be so nice!"
	Door2a
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>if 96=6(x+y) and 2y=x-1</b>"
				usr<<"<b>Then what does xy equal</b>?"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="55")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="55")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()

	Door2b
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>How many stars are on the ground in this level (befor this door)?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="16")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="16")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()

	Door2c
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>If terisa has $2.41,and she goes to CVS to buy</b>"
				usr<<"<b>a galon of orange juice that costs $1,73,</b>"
				usr<<"<b>how much money does she have left?</b>"
				usr<<"<b>please use $#.## format in your answer.</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="$0.68")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="0.68")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()

	Door2d
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>What year did the Andor sink in?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="1957")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="1957")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2e
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>If Joe went to law shcool for 4 years, and had 1 class a day only on weekdays.</b>"
				usr<<"<b>Plus he has a 2 month break for Christmas each year (8 weeks starting on a Monday).</b>"
				usr<<"<b>How many law class did Joe attend (excluding leap years and assuming that his first class was on a Monday)?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="884" || arg=="883")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="884" && arg!="883")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2f
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>On this floor there are 8 notes. On each note is a number.</b>"
				usr<<"<b>Put the notes in order and wright those numbers in order seperated by one space each (# # # # # # # #).</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="93 62 9 54 33 87 20 102")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="93 62 9 54 33 87 20 102")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2g
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>How many key doors are there on this level (you have seen them all)?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="5")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="5")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2h
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>Look at the word that is the color purple and the answer is the number beside it?</b>"
				usr<<"<b><font color=#ff0000>1.Blue</font></b>"
				usr<<"<b><font color=#00ff00>2.Orange</font></b>"
				usr<<"<b><font color=#0000ff>3.Purple</font></b>"
				usr<<"<b><font color=#ff8000>4.Yellow</font></b>"
				usr<<"<b><font color=#ff00ff>5.Green</font></b>"
				usr<<"<b><font color=#ffff00>6.Red</font></b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="5")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="5")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2i
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>What is the next number in this sequence?</b>"
				usr<<"<b>A,B,C,D,E,_</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="135")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="135")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2j
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>23+y+(b*d)=117</b>"
				usr<<"<b>b=5*9</b>"
				usr<<"<b>What is Y?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="45")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="45")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2k
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>What does this mean?</b>"
				usr<<"<b>@LC *#UXCP VU %$</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="79")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				if(arg!="79")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2l
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>How many stars are on the ground in this level?</b>"
				usr<<"<b>You have seen them all.</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="25")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="25")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2m
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>97*39+X=4590</b>"
				usr<<"<b>What is X?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="807")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="807")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Door2n
		icon='Door2.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>(45% of 400)*X=19260</b>"
				usr<<"<b></b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="107")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="107")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Web
		icon = 'web.dmi'
		density = 1
		opacity = 1
		verb
			Open()
				set src in view(1)
				if(usr.Keys == 0)
					usr<<""
					usr<<"You examine the web and relise it is to strong to go though,but if you had something to destroy it with!"
				else
					switch(alert("Do you want to use one of your sticks?",,"Yes","No"))
						if("Yes")
							usr<<""
							usr<<"You twind the web and your stick breaks!"
							usr.Keys-=1
							usr<<sound('Correct.wav',0,0,2,100)
							del(src)
						if("No")
							usr<<""
							usr<<"You back away from the web slowly!"
	Vine
		icon='vine.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>8^5+452</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="262596")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="262596")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Vine2
		icon='vine.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>What comes next in this sequence?</b>"
				usr<<"<b>z4,x6,v8,t10,r12,_</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="p14")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="")
					usr.Lives-=1
					usr<<"p14"
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Vine2a
		icon='vine.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>eht rewsna ot siht elddir si...enB eht gnik.</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="Ben the king")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="Ben the king")
					usr.Lives-=1
					usr<<"andis the king"
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Vine2b
		icon='vine.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>59*6+985/4*4-563+563=?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="1339")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="1339")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Vine2c
		icon='vine.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>What kind of room has no windows or doors?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="a mushroom")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="a mushroom")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	sky
		icon = 'sky.dmi'
		density = 1
		opacity = 1
		verb
			fill()
				set src in view(1)
				if(usr.Keys == 0)
					usr<<""
					usr<<"If only you could fill it up"
					switch(alert("Do you want to use one of your Jugs of Water?",,"Yes","No"))
						if("Yes")
							usr<<""
							usr<<"you use you water,it condences into a cloud!"
							usr.Keys-=1
							usr<<sound('Correct.wav',0,0,2,100)
							del(src)
						if("No")
							usr<<""
							usr<<"You back away from the edge slowly!"

	thunder
		icon='thunder.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>What kind of cloud is the highest in our atmospere?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="sirus")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="sirus")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	thunder2
		icon='thunder.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>453*9+7.9-63.812=?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="4021.088")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="4021.088")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	thunder2a
		icon='thunder.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b>How many notes were on the 1st level?</b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="8")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="8")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
	Lava
		icon='lava.dmi'
		density=1
		opacity=1
		verb
			fill()
				set src in view(1)
				if(usr.Keys == 0)
					usr<<""
					usr<<"If only you could fill it up"
					switch(alert("Do you want to use one of your Jugs of Water?",,"Yes","No"))
						if("Yes")
							usr<<""
							usr<<"you use you water,it hardens into part of the ground!"
							usr.Keys-=1
							usr<<sound('Correct.wav',0,0,2,100)
							del(src)
						if("No")
							usr<<""
							usr<<"You back away from the lavapit slowly!"
	crackedwall4
		icon='crackedwall4.dmi'
		density=1
		opacity=1
		verb
			Hear_Riddle()
				set src in view(1)
				usr<<""
				usr<<"<b></b>"
			Answer_Riddle(arg as text)
				set src in view(1)
				if(arg=="")
					usr<<""
					usr<<"Correct!"
					usr<<sound('Correct.wav',0,0,2,100)
					del(src)
				else if(arg!="")
					usr.Lives-=1
					usr<<""
					usr<<"Incorrect!"
					usr<<"You lose a life."
					Kill()
turf
	icon='StoneFloor.dmi'
	Click()
		if(density==1)
			usr<<""
			usr<<"You can't reach there!"
		else
			walk_to(usr,src)
	Teleporter
		icon='teleporter.dmi'
		Entered()
			alert("This thing your standing on is called a teleporter. Unlike the things you have incountered so far, this activates the instant you stand on it. Becareful going though them though. You never know where you will end up, or more importantly if you can get back. So think befor you use one.")
			usr.Move(locate(28,34,4))
	Teleporter2
		icon='teleporter.dmi'
		Entered()
			usr.Move(locate(1,1,4))
	StoneFloor
		icon='StoneFloor.dmi'
	Wall
		icon='Wall.dmi'
		density=1
		opacity=1
	Stairs
		icon='Stairs.dmi'
		verb
			Go_Down()
				set src in view(0)
				usr.Move(locate(32,32,2))
				usr.Lives+=1
				usr<<""
				usr<<"<b>LEVEL 2</b>"
				usr<<"Code: 200904211606"
				usr<<"You gain 1 life. you now have [usr.Lives] lives."
	Stairs2
		icon='Stairs.dmi'
	Stairs3
		icon='Stairs.dmi'
		verb
			Go_Down()
				set src in view(0)
				usr.Move(locate(9,28,3))
				usr.Lives+=1
				usr<<""
				usr<<"<b>LEVEL 3</b>"
				usr<<"Codes: 2210151906"
				usr<<"You gain 1 life. you now have [usr.Lives] lives."
	Stairs4
		icon='Stairs.dmi'
		verb
			Go_Down()
				set src in view(0)
				usr.Move(locate(30,32,4))
				usr.Lives+=1
				usr<<""
				usr<<"<b>LEVEL 4</b>"
				usr<<"Codes: 0721192210"
				usr<<"You gain 1 life. you now have [usr.Lives] lives."
	star
		icon='star.dmi'
	tree
		icon='tree.dmi'
		density=1
		opacity=1
	grass
		icon='grass.dmi'
	wood
		icon='wood.dmi'
	wall2
		icon='wall2.dmi'
		density=1
		opacity=1
	cloud
		icon='cloud.dmi'
	wall3
		icon='wall3.dmi'
		density=1
		opacity=1
	LavaGround
		icon='lavaground.dmi'
	wall4
		icon='wall4.dmi'
		density=1
		opacity=1

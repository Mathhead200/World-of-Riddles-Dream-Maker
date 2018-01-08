

var/const
	REBOOT_TMP = "rsc/reboot.tmp"

proc
	isNorth(dir)
		return dir == NORTH || dir == NORTHEAST || dir == NORTHWEST
	isSouth(dir)
		return dir == SOUTH || dir == SOUTHEAST || dir == SOUTHWEST
	isEast(dir)
		return dir == EAST || dir == NORTHEAST || dir == SOUTHEAST
	isWest(dir)
		return dir == WEST || dir == NORTHWEST || dir == SOUTHWEST


world
	view = "18x18"


client
	lazy_eye = "8x8"

	proc
		setEye()
			var
				bigX = mob.x > 18 || mob.x == 18 && isEast(mob.dir)
				bigY = mob.y > 18 || mob.y == 18 && isNorth(mob.dir)
			eye = locate( 10 + (bigX ? 17 : 0), 10 + (bigY ? 17 : 0), mob.z )


atom
	Click()
		usr.dir = get_dir(usr, src)
		walk_to(usr, src, (src.hasDense() ? 1 : 0), 2)
		return ..()

	New()
		. = ..()
		resetPixels()

	proc
		resetPixels()
			src.pixel_x = initial(src.pixel_x)
			src.pixel_y = initial(src.pixel_y)

		hasDense()
			if(src.density)
				return 1
			for( var/i = 1, i <= src.contents.len, i++ )
				var/atom/a = src.contents[i]
				if(a.density) return 1
			return 0


mob
	icon = 'me.dmi'

	Login()
		. = ..()
		usr.Move( locate(4, 2, 1) )
		usr.dir = SOUTH
		var/tmpName = file2text(REBOOT_TMP)
		usr.name = tmpName ? tmpName : input(usr, "Welcome to World of Riddles. What is you name?", "World of Riddles", usr.key) as null|text
		if(usr.name != null)
			Read( usr.getSaveFile() )
			if( usr.isNewPlayer == 1 )
				usr << "Hello [usr.name]. Welcome to World of Riddles!"
				usr.isNewPlayer = 0
			else
				usr << "Welcome back [usr.name]."
				usr.z = usr.saveZ
		fdel(REBOOT_TMP)
		usr.startLevel()
		usr.showStats = 1

	Stat()
		if(showStats)
			statpanel("General")
			stat("Level", "[usr.z] / [usr.level]")
			stat("Chances Left", usr.chances)

			statpanel("Inventory")
			stat(null, usr.contents)

	Move(newLoc, dir)
		if( src.icon_state == "jumping" || src.icon_state == "teleporting" )
			return 0
		if( dir && src.dir != dir )
			src.dir = dir
			. = 0
		else
			. = ..(newLoc, dir)
		client.setEye()

	Read(savefile/F)
		if(F == null)
			return null
		return ..(F)

	Write(savefile/F)
		if(F == null)
			return null
		return ..(F)

	DblClick()
		for( var/atom/a in oview(0, src) )
			a.DblClick()
		return ..()

	var
		showStats = 0
		isNewPlayer = 1

		chances = 3
		level = 1

		saveZ = 1

	proc
		fail()
			if( src.z >= src.level )
				src.chances--
				if( src.chances <= 0 )
					src.showStats = 0
					src.isNewPlayer = 1
					src.chances = 3
					src.level = 1
					Write( src.getSaveFile() )
					switch( alert(src, "You have lost all your lives. Sorry, but it's... Game Over!", "Game Over", "Start Over", "Quit") )
						if("Start Over")
							text2file("[src.name]\...", REBOOT_TMP)
							world.Reboot(0)
						else if("Quit")
							del src

		startLevel()
			for(var/i in src.contents)
				if( istype(i, /obj/item) )
					src.contents.Remove(i)
			var/list/l[25]
			l[1] = locate(4, 2, 1)
			l[2] = locate(32, 32, 2)
			l[3] = locate(2 ,2, 3)
			l[4] = null
			l[5] = null
			l[6] = null
			l[7] = null
			l[8] = null
			l[9] = null
			l[10] = null
			l[11] = null
			l[12] = null
			l[13] = null
			l[14] = null
			l[15] = null
			l[16] = null
			l[17] = null
			l[18] = null
			l[19] = null
			l[20] = null
			l[21] = null
			l[22] = null
			l[23] = null
			l[24] = null
			l[25] = null
			src.Move( l[src.z] )
			src.dir = NORTH
			Write( src.getSaveFile() )

		getSaveFile()
			if( src.name == null )
				return null
			return new /savefile("saves/[src.ckey]/[ckey(src.name)].sav")

		setZ(val)
			src.z = val
			src.saveZ = val

	verb
		changeLevel()
			set name = "Change Level"
			var/lv = input(usr, "Warning: Changing levels will save and reset the game. Which level would you like to switch to?", "Change Level", usr.level) as null|num
			if( lv && lv >= 1 && lv <= usr.level )
				usr.setZ(lv)
				text2file("[src.name]\...", REBOOT_TMP)
				Write( src.getSaveFile() )
				world.Reboot(0)


obj
	item
		DblClick()
			if( src in oview(0) )
				get()
			else if( src in usr.contents )
				use()
			return ..()

		proc
			use()

		verb
			get()
				set name = "Grab"
				set src in oview(0)
				src.Move(usr)

		key
			name = "Key"

			use()
				unlock()

			verb
				unlock()
					set name = "Use"
					var/list/doors = list()
					for( var/obj/door/key/d in oview(1) )
						doors.Add(d)
					if( doors.len == 0 )
						usr << "There is no door to use the [src.name] on."
					else if( doors.len > 1)
						usr << "Pick which door you want to open."
					else
						var/obj/door/key/d = doors[1]
						d.open()


		note
			name = "Note"

			use()
				read()

			var
				message

			verb
				read()
					set name = "Read"
					usr << "[src.name] reads [src.message]"


		spring
			name = "Spring"

			use()
				jump()

			var
				dist = 2

			verb
				jump()
					set name = "Jump"
					set src in view(0)
					if( src in usr.contents )
						src.Move(usr.loc)
					usr.icon_state = "jumping"
					sleep(1)
					var/D = usr.dir
					for( var/i = 0, i < dist, i++ )
						var/mob/newLoc = locate( usr.x + (isEast(D) ? 1 : isWest(D) ? -1 : 0), usr.y + (isNorth(D) ? 1 : isSouth(D) ? -1 : 0), usr.z )
						if( !newLoc.hasDense() )
							for( var/j = 0, j < 3, j++ )
								usr.pixel_x = isEast(D) ? 12 : isWest(D) ? -12 : 0
								usr.pixel_y = isNorth(D) ? 12 : isSouth(D) ? -12 : 0
								sleep(1)
							usr.resetPixels()
							usr.loc = newLoc
					flick("fall_from_jump", usr)
					usr.icon_state = null
					walk(usr, 0) //fixes bug of usr walking back to spring after jump (I don't understand why the bug exists though)


		crystal
			name = "Crystal"

			use()
				program()

			var
				myColor

			verb
				program()
					set name = "Program"
					var/i = 0
					for( var/obj/teleporter/t in oview(0) )
						if( src.myColor in t.settings )
							usr << "Error: [t.name] is already programmed for compatibility with other [src.myColor] teleporters."
						else
							t.settings.Add(src.myColor)
							usr << "Confirmation: [t.name] is now programmed for compatibility with [src.myColor] teleporters."
						i++
					if(!i)
						usr << "There is no teleporter to program."


	door
		density = 1
		opacity = 1

		DblClick()
			if( src in view(1) )
				open()
			return ..()

		proc
			opening()
			locked()

		verb
			open()
				set name = "Open"
				set src in view(1)


		key
			name = "Key Door"

			locked()
				usr << "You have no keys."

			open() //verb
				for( var/i in usr.contents )
					if( istype(i, src.keyType) )
						usr.contents.Remove(i)
						usr << sound('correct.wav', 0, 0, 0, 100)
						opening()
						del i
						del src
				locked()

			var
				keyType = /obj/item/key


		riddle
			name = "Riddle Door"

			opening(ans)
				usr << "Correct!"
			locked(ans)
				usr << "Incorrect."
				return 1

			var
				question
				list/answers = list()

			choice
				var
					list/choices = list()

				open() //verb
					set name = "Open"
					set src in view(1)
					var answer = input(usr, src.question, src.name) as null|anything in choices
					if( answer in src.answers )
						usr << sound('correct.wav', 0, 0, 0, 100)
						src.opening(answer)
						del src
					else if( answer != null && src.locked(answer) )
						usr.fail()


			freeAnswer
				open() //verb
					set name = "Open"
					set src in view(1)
					var answer = input(usr, src.question, src.name) as null|text
					if( answer in src.answers )
						usr << sound('correct.wav', 0, 0, 0, 100)
						opening()
						del src
					else if( answer != null && src.locked() )
						usr.fail()


	teleporter
		name = "Teleporter"
		icon_state = "Off"

		New()
			. = ..()
			if( !(src.icon_state in src.settings) )
				src.settings.Add( src.icon_state )

		DblClick()
			if( src in oview(0) )
				teleport()
			return ..()

		var
			list/settings = list()
			dist = null //full view

		verb
			teleport()
				set name = "Teleport"
				set src in oview(0)
				if( src.icon_state == "Off" )
					usr << "The [src.name] is off-line."
					return null
				var/list/ports = list()
				for( var/obj/teleporter/a in oview(dist, src) )
					if( a.icon_state == src.icon_state )
						ports += a
				if( ports.len == 0 )
					usr << "Error: There are no other [src.icon_state] [src.name]s in range."
				else if( ports.len > 1 )
					usr << "Conflict: there is more then one [src.icon_state] [src.name] in range."
				else
					var/obj/teleporter/dest = ports[1]
					usr.dir = SOUTH
					usr.icon_state = "teleporting"
					flick("dematerialize", usr)
					sleep(4)
					missile(usr, usr, dest)
					sleep( get_dist(usr, dest) )
					usr.loc = dest.loc
					flick("materialize", usr)
					usr.icon_state = null
					walk(usr, 0) //again fixes a bug... WTF?

			changeState()
				set name = "Activate"
				set src in oview(0)
				if( src.settings.len <= 1 )
					usr << "Error: No [!("Off" in src.settings) ? "other " : ""]colors have been programmed."
				else
					var/currentChoice = src.icon_state != null ? src.icon_state : "Off"
					var/choice = input( usr, "Which setting would you like to activate this [src.name] on?", src.name, currentChoice ) as null|anything in src.settings
					if( choice == null )
						return null
					src.icon_state = choice

			program()
				set name = "Program"
				set src in oview(0)
				var/i = 0
				for( var/obj/item/crystal/c in usr.contents )
					c.program()
					i++
				if(!i)
					usr << "You have nothing to program the teleporter with."


turf
	floor


	wall
		density = 1
		opacity = 1


	barrier
		density = 1


	stair
		icon = 'stairs.dmi'
		name = "Stairs"

		DblClick()
			if( src in oview(0) )
				advance()
			return ..()

		verb
			advance()
				set name = "Advance"
				set src in oview(0)
				if( usr.z >= usr.level )
					usr.level++
					usr.chances++
				usr.z++
				usr.startLevel()


	hole
		name = "Hole"

		var
			warning = "Whoa! I almost fell in that Hole."

		Entered(atom/movable/m, atom/oldLoc)
			if( m.icon_state != "jumping" )
				walk(usr, 0)
				m.loc = oldLoc
				var/d = get_dir(m, src)
				m.pixel_x = isEast(d) ? 16 : isWest(d) ? -16 : 0
				m.pixel_y = isNorth(d) ? 16 : isSouth(d) ? -16 : 0
				spawn(2) m.resetPixels()
				m << src.warning

		Click()
			walk_to(usr, src, 1, 2)
			Entered(usr, usr.loc)


area
	Entered(atom/movable/m)
		m << sound('temple.mid', 1, 0, 0, 100)


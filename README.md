# Computer

This is a minimalistic natural language processor. It takes Star Trek themed queries as verbal input and responds. 
It's... pre-programmed with rank, species, job, and location of many of the <a href = "http://en.wikipedia.org/wiki/List_of_Star_Trek_characters#Main_cast_and_major_characters_of_Star_Trek:_The_Next_Generation_.28TNG.29_and_Movies">TNG crew </a> (yeah okay i'm lame, i'm aware). So you could say "Computer, where is Captain Picard?" and it will respond with his pre-programmed location, etc. 

Other ship qualities can be modified in real time. You can say "Computer, modify our destination to Kronos." and the next time you ask for the ship's location it will be Kronos (Not too realistic, but I wanted to make it a bit more dynamic).


HERES THE GRAMMAR: 

Computer — This word now must come first (The exception is the captain’s log command.)

Here is a list of types of questions/queries that are acceptable:

	Computer, what is our current location?
	Computer, where is the Starship Enterprise?
	Computer, what is the destination?
	Computer, open captain’s log.
	Captain’s log, Star date <#>…
	Computer, is crewman <lname> on the ship?
	Computer, where is crewman <lname>?
	Computer, what is the mission of the Starship Enterprise?
	Computer, modify authorization for Crewman <lname> to <#>.
	Computer, initiate auto destruct sequence authorization <#>. 

If statement based on second word: 

	what — location, destination, mission, date 
	where, locate, is — starship, crewman, 
	open — captain’s log
	modify, change, update — crewman (authorization), mission, destination
	initiate — destruct 

Case statement based on second word: 

	verb	     	=   	open, is, modify, initiate, locate, change, update
	pronoun    	=   	what
	adverb      	=   	where
	identifier    	=    	location, destination, mission, log, <crew member>, destruct
	crew mem.       =	Captain, Commander, Crewman, Lieutenant, Ensign, Admiral, Lieut. 					Capt. Cmdr. 


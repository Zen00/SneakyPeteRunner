/***********************************************\
				
				Sneaky Pete Runner
		(aka: The Seventh Motorcycle Upgrade)
	
				Written by Zen00
					v. 1.0.0
\***********************************************/


script "Sneaky Pete Runner";
since r17020;


/***********************************************\

					OPTIONS

\***********************************************/


//Remove the comment lines if you want to let me know you're using this script, so I know people are interested and keep writing
//notify Zen00;

boolean pete_breakstone = true;

/***********************************************\

					SCRIPT
					
			Do not edit past this point
		unless you know what you're doing
		(all warranties void if edited)

\***********************************************/


string versionNumber = "1.0.0";

void popCollar()
{
	if((item_amount($item[Sneaky Pete's leather jacket]) > 0) || (have_equipped($item[Sneaky Pete's leather jacket])))
		visit_url("inventory.php?action=popcollar");
}

void unpopCollar()
{
	if((item_amount($item[Sneaky Pete's leather jacket (collar popped)]) > 0) || (have_equipped($item[Sneaky Pete's leather jacket (collar popped)])))
		visit_url("inventory.php?action=popcollar");
}

void breakStone()
{
	if(!hippy_stone_broken())
		visit_url("campground.php?smashstone=yep&pwd&confirm=true&submit", true);
}

void sellGems()
{
	cli_execute("refresh inventory");
	autosell(item_amount($item[hamethyst], $item[hamethyst]);
	autosell(item_amount($item[baconstone], $item[baconstone]);
	autosell(item_amount($item[porquoise], $item[porquoise]);
}

void getSkills()
{

}

void upgradeCycle()
{

}

void grabBounties()
{
	visit_url("bounty.php?pwd&action=takelow");
	visit_url("bounty.php?pwd&action=takehigh");
	visit_url("bounty.php?pwd&action=takespecial");	
}

void grabVacationQuests()
{
	
}

int handleBarrelFullOfBarrels()
{
	if(!get_property("barrelShrineUnlocked").to_boolean())
	{
		print("You don't have the Barrel God's help, skipping this...", "red");
		return;
	}

	string page = visit_url("barrel.php");
	int smashed = 0;

	matcher mimic_matcher = create_matcher("<div class=\"ex\">((?:<div class=\"mimic\">!</div>)|)<a class=\"spot\" href=\"choice.php[?]whichchoice=1099[&]pwd=(?:.*?)[&]option=1[&]slot=(\\d\\d)\"><img title=\"(.*?)\"", page);
	while(mimic_matcher.find())
	{
		string mimic = mimic_matcher.group(1);
		string slotID = mimic_matcher.group(2);
		string label = mimic_matcher.group(3);

		if(mimic != "")
		{
			print("Found mimic in slot: " + slotID, "red");
		}
		else if(label == "A barrel")
		{
			visit_url("choice.php?whichchoice=1099&pwd&option=1&slot=" + slotID);
			smashed = smashed + 1;
		}
	}
	return (smashed > 0);
}

void initializeDay()
{
	if((my_dayCount() == 1) && !get_property("pete_checkpointInitDay1").to_boolean())
	{
		cli_execute("ccs null");
		cli_execute("mood apathetic");
		grabBounties();
		grabVacationQuests();
		use(1, $item[astral six-pack]);
		visit_url("clan_viplounge.php?preaction=buyfloundryitem&whichitem=9004");
		visit_url("inv_use.php?pwd=&which=2&whichitem=9004");
		cli_execute("garden pick");
		cli_execute("make skeleton skis");
		cli_execute("barrelprayer protection");
		cli_execute("cheat stat moxie");
		cli_execute("cheat mine");
		cli_execute("cheat tower");
		if(pete_breakstone)
			breakStone();
		popCollar();
		visit_url("place.php?whichplace=town_right&action=townright_ltt");
		visit_url("tutorial.php");
		use(1, $item[letter from King Ralph XI]);
		use(1, $item[pork elf goodies sack]);
		sellGems();
		cli_execute("hermit * clover");
		cli_execute("make bitchin");
		cli_execute("/terminal educate digitize.edu");
		cli_execute("/terminal educate extract.edu");
		cli_execute("/terminal enhance substats.enh");
		cli_execute("/terminal enhance init.enh");
		cli_execute("/terminal enquiry monsters.enq	");
		handleBarrelFullOfBarrels();
		getSkills();
		upgradeCycle();
		maximize("exp", 0, 0, false);
		set_property("pete_checkpointInitDay1", true);
	}
	else if(my_dayCount() == 2)
	{
		
		set_property("pete_checkpointInitDay2", true);
	}
}

//If you don't have skeletons, only allow 70 ML for events
//Use hair spray (30) and rev engine buff (50) and Live fast (50), after skilling up and gearing up use 1 free rest for hp/mp, use a skeleton buddy
//Now should have around 95 moxie, depending on RNG
//fight writing desk, digitize it, pick pocket, no more than 80 ML, pop wheelie and attack with weapon
//Get slicked back doo for the ele resist
//Check low on the telescope for what element is needed for NS tower, prepare and collect 1 DNA potion sometime along the way, demon for hot, hobo for stench, plant for cold, undead for spooky, slime for sleeze
//Fight up to 5 times in the forest, cast brood and adventure until you get the +stat buff from the weiner dog, extra DNA from a dude, hybridize
//Once you have 120 Moxie, use biker swagger if you have -50 audience
//If 3 clovers use one for biscuits at the bat hole, otherwise fight in the entry hole until you get a biscuit and scream bats to open the bean bats, don't forget check hair, get a bean and finish up bat cave, use peel outs for the beefy guards or places when you don't have max ML in play (while getting audience)
//On your third writing desk re-digitize it
//Once you reach level 6 use 2 uses of jump shark
//Once boss bat is dead, do X-32 free combats to finish getting -50 audience if needed, set to moxie
//Once audience is -50, use Incite Riot, then use the firebomb crate, go as far as you can into the 10 free x-32 combats without being killed, don't go further than 80 ML or you won't be able to kill it, you'll need 200 moxie to finish all 10 FCs, needing to use Pop Wheelie for deleveling from FC7 on.
//Do barf mountain till you get 2 garbage bags from elementals (pick pocket) or 1 bag and 1 fun fund from love bugs
//Once you have 60 source essence you don't need to extract anymore
//Have used 2 hacked gibsons, save a third for rollover
//Once boss bat is dead, maximize -combat with every option you have, including ash if you've
//Use CSA kit for pvp fights, or regen if you don't break stone
//Keep 80 ML for doing witchess pieces or you might be killed
//Kill one pawn, you should use the prawn once you hit level 7, 3 bishops, save a witchess rook for later
//Also extrude 2 hacked gibson at this point (testing if I should get a cookie or a third gibson), drink one now, save one for night cap
//Maximize NCs and init, do the modern zmobies and plant for init, also maximize ML at this point, flip SPLJ, should be at 140 ML, peel out as needed, Alcove
//Consume your molotov sodas
//Don't fight the zone bosses, just get to them
//Plant ML in the Cranny
//Now that the NC areas are done, start doing other NC areas, forest, tavern (drink a sockdollager first), save turns of -combat by peeling out in forest and tavern if not a rat king
//Next do the demons quest, should still have -27% combat
//Swap to turbo/compress for skills once you digitize the second writing desk
//Kill mobs until you get 3 wings
//Finish demons, then get pirate outfit, only use brood at this point, save the next two ashes for later
//Equip outfit, get dictionary/pirate insults
//Do insults, peel out after getting cocktail napkin if you have any left, keep up NC until you get the pirate map, don't do the map until you got 6 insults
//unpop jacket and use greek fire, re-popping jacket if buff runs out
//mp,hp,item% for skeletons
//stuff happened that I didn't record because of lack of time
//do goats banishing all except dairy, do mine with clover, do ninjas with +combat from muffler and a hot dog, spare +combat should carry over to airship first 10 turns, after which come back and finish off the peak
//do airship, plant moxie hp/mp, +combat first 10 adventures, -25% combat afterwards, banish encounters/mech, encounters being priority if explosions is on cooldown, jukebox healer for amulet and other guy for mohawk wig, make friends with whichever doesn't drop, healer priorty
//Basement floor, using whatever you got dropped, if nothing dropped, then do airhsip until something drops, dropping ML so you can mug if needed for making friends, use the last jump shark to reset audience afterwards, also don't forget to duplicate to gurantee the amulet drop
//do ground floor
//do top floor with mohawk wig if you got it, maximizing -combat with your last pile of ashes, get the space ship
//drink lucky lindy for semi-rare
//go do top floor of spookyraven with remaining +NC
//go to hole in sky, get a dna sample and make 2 tonics from it for meat drop
//whitelist to pvp fight clan if stone is borken
//Flip chateau fan to skylight, flip jacket to +adv, equip wedding ring
//day 2


boolean L4_batCave()
{
	if(get_property("pete_bat") == "finished")
	{
		return false;
	}
	if(my_level() < 4)
	{
		return false;
	}

	print("In the bat hole!", "blue");
	if(considerGrimstoneGolem(true))
	{
		handleBjornify($familiar[Grimstone Golem]);
	}
	buffMaintain($effect[Fishy Whiskers], 0, 1, 1);

	int batStatus = internalQuestStatus("questL04Bat");
	if((item_amount($item[sonar-in-a-biscuit]) > 0) && (batStatus < 3))
	{
		use(1, $item[sonar-in-a-biscuit]);
		return true;
	}

	if(batStatus >= 4)
	{
		if((item_amount($item[enchanted bean]) == 0) && !get_property("cc_bean").to_boolean())
		{
			ccAdv(1, $location[The Beanbat Chamber]);
			return true;
		}
		set_property("cc_bat", "finished");
		council();
		return true;
	}
	if(batStatus >= 3)
	{
		ccAdv(1, $location[The Boss Bat\'s Lair]);
		return true;
	}
	if(batStatus >= 2)
	{
		if((item_amount($item[Enchanted Bean]) == 0) && !get_property("cc_bean").to_boolean())
		{
			ccAdv(1, $location[The Beanbat Chamber]);
			return true;
		}
		ccAdv(1, $location[The Batrat and Ratbat Burrow]);
		return true;
	}
	if(batStatus >= 1)
	{
		ccAdv(1, $location[The Batrat and Ratbat Burrow]);
		return true;
	}

	buffMaintain($effect[Hide of Sobek], 10, 1, 1);
	buffMaintain($effect[Astral Shell], 10, 1, 1);
	buffMaintain($effect[Elemental Saucesphere], 10, 1, 1);
	if(elemental_resist($element[stench]) < 1)
	{
		if(possessEquipment($item[Knob Goblin Harem Veil]))
		{
			equip($item[Knob Goblin Harem Veil]);
		}
		else
		{
			return false;
		}
	}

	if((my_class() == $class[Ed]) && (item_amount($item[Disassembled Clover]) > 0) && (batStatus <= 1))
	{
		backupSetting("cloverProtectActive", false);
		use(1, $item[Disassembled Clover]);
		if(ccAdvBypass(31, $location[Guano Junction]))
		{
			print("Wandering monster interrupt at Guano Junction", "red");
			restoreSetting("cloverProtectActive");
			return true;
		}
		use(item_amount($item[ten-leaf clover]), $item[ten-leaf clover]);
		restoreSetting("cloverProtectActive");
		return true;
	}
	ccAdv(1, $location[Guano Junction]);
	return true;
}





void main()
{
	if ((my_class() != $class[Pete]))
	{
		abort("You're not cool enough to use this script, try again in another life! (aka: You're not in the Avatar of Sneaky Pete path)");
	}
	
	//Print some probably unnecessary info
	print("Hello " + my_name() + ", it's adventure time!");
	print("This is version: " + versionNumber + " of Sneaky Sneaky Pete");
	print("Your day count: Day " + my_daycount() + " of your current ascension.");
	print("Your turn count: " + my_turncount() + " turns played.");
	print("Current adventures left: " + my_adventures());
	
	//Lets initialize some settings and prep you for the run, grab breakfast, do toot, that kind of stuff that doesn't require adventuring
	initializeSettings();
	initializeDay(my_daycount());
	
	//Check for any previously finished quests if you started using this script mid-way through a run, please don't :(
	questOverride();
	
	//Begin adventuring
	while((my_adventures() > 1) && (my_inebriety() <= inebriety_limit()) && doTasks())
	{
	}
	
	//Day wrapup
	doBedtime();
	print("Done adventuring for today. Time to chillax!");
}



































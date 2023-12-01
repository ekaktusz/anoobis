extends Control

var anubis_dialogs:Array[DialogData] = [
 	DialogData.new("Greetings youngling. You were a perfectly balanced soul in your life with as many good as evil traits. So I think you would be a perfect intern for me. Help me with this papyruswork and I might make you a proper god. Send these poor souls to Heaven or Hell. Consider their PRO and CON traits and decide as you wish. You will see on the scale if your judgments are right or wrong.", 1),
 	DialogData.new("Nice job new guy, I promote you to junior intern! Our job requires a lot of balance though. It's not enough to send everyone to the realm of their dominant traits. You need to put souls to Hell that belong to Heaven or vice versa in order not to make that Ammut or Bast overpowered. You think it's unfair? So is life, why did you think the underworld would work differently?", 2),
	DialogData.new("The balance is still kept, you deserve the role of medior intern! Whenever you visit a realm in your break, the Gods will offer you hell and heaven quests from now on, to help you balance even more. But be careful, they are just looking for their own advantage.", 3),
	DialogData.new("Nice job, my new senior intern! I hope you won't betray the balance for those pesky lesser Gods though. They might offer you their riches, but your job is your duty. Keep the balance!", 4),
	DialogData.new("Alright, you proved me enough, your judgment is right. I promote you to... senior intern specialist! Great rank. It comes with the Eye of Horus, that's a big plus. From now on you see the value of the traits of these wretched souls. Make your judgments worth.", 5),
	DialogData.new("Well done for keeping the balance so far. You are promoted! Welcome to the team, senior intern manager. Keep up the good work! Don't get tempted by lesser gods.", 6),
	DialogData.new("You are on fire! You keep the balance like a true assistant to the regional god. I shall grant you the role of intern director! Now our true work begins! There might be greater imbalances between good and bad souls from now on.", 7),
	DialogData.new("Nice work. You know, you remind me of myself: a minor god full of ambition, but never pushing their luck too far, until one day... I won't spoil the game for you. Everything in its time. Remember: patience is a virtue. But patience doesn't pay your bills, you say? Well, how about the role of chief operating intern? Congratulations, you are promoted!", 8),
	DialogData.new("Wonderful! I am quite pleased with you Anoobis. Don't get tricked now into any funny business, chief executive intern. Keep on going! This might just be the last level.", 9),
  	DialogData.new("You have stood the test, proved yourself a true balanced soul. Congratulations, you are now a junior god of the dead! Sort 100 souls/day from now on.", 10)]

var anubis_score_dialogs_hell : Array = [
	{"text" : "Hell is much too weak, Anoobis. You don't want to know what would become of it when it's residents wouldn't cheat their taxes and respect the law. Where would I go to party then? You must send a lot more wicked souls there. Anyways...","score_from":-10, "score_to":-1 },
	{"text" : "Hell is too weak, Anoobis. I heard many residents you sent there are volunteering to suffer in the breaking weels now. That's not the intended way! You must send more wicked souls there. Anyways...","score_from":-25, "score_to":-11 },
	{"text" : "Hell is too strong, Anoobis. I can hear the laughter of their tasteless, unethical jokes up here all day long! You must send less wicked souls there. Anyways...","score_from":-89, "score_to":-75 },
	{"text" : "Hell is much too strong, Anoobis. I think we might reach the capacity of Ammut's cauldron and stomach very soon. You must not send any more wicked souls there for a while. Anyways...","score_from":-99, "score_to":-90 }
]

var anubis_score_dialogs_heaven : Array = [
	{"text" :"Heaven is much too weak, Anoobis. They will elect that utmost terrible mortal as their leader you sent there if you keep on this track. You must send a lot more good souls there. Anyways..." ,"score_from":1, "score_to":10 },
	{"text" :"Heaven is too weak, Anoobis. All the fraud, lies and evil you set on them.. You must send more good souls there. Anyways..." ,"score_from":11, "score_to":25 },
	{"text" : "Heaven is too strong, Anoobis. Noone wants to hear them brag how life should be lived. You must send less good souls there. Anyways...","score_from":75, "score_to":89 },
	{"text" : "Heaven is much too strong, Anoobis. Bastet got her fangs in you, isn't she? You must not send any more good souls there for a while. Anyways...","score_from":90, "score_to":99 }
]

var croc_bro_dialogs:Array[DialogData] = [
	DialogData.new("Ah, is it lunchtime already? Just kidding. Welcome to Hell, neutral soul, you must be Anubis's new intern. Anoobis, is it? On the right, you see the power of my realm above the soup I'm cooking. I only eat the souls of the wicked. Make sure to send me the right souls or else you'll be demoted to my lunch.", 1),
	DialogData.new("Anoobis, my man! Ready to stir some trouble? A dash of unpredictability, a sprinkle of pandemonium. It's like a grand feast for the senses!", 2),
	DialogData.new("(Chuckling) Well, well, look who decided to drop by the feeding grounds. Anoobis, my partner in crime and dine. What brings you here?", 3),
	DialogData.new("You know, it's like my stomach staged a rebellion, but I've negotiated a truce. Back to the hunger, my friend, back to the endless quest for flavor!", 4),
	DialogData.new("Anoobis, my man, why stick to the same old routine? Judgment, punishment – it's getting monotonous. Let's add a little spice to the underworld, shall we?", 5),
	DialogData.new("I can see it in your eyes – you're tempted. Admit it, Anoobis. Deep down, you crave a bit of excitement too. Just imagine the yummy souls we could digest.", 6),
	DialogData.new("I asked a soul why it was avoiding me. You know what it said? 'I heard you have a biting sense of humor!'", 7),
	DialogData.new("Anoobis! What brings you to my stomping grounds, huh? Got some tasty news for me?", 8),
	DialogData.new("So, Anoobis, what's next on the agenda? More judgment, more souls, or maybe a snack that won't leave me regretting my life choices? Let's keep this underworld circus rolling!", 9),
	DialogData.new("I ate an optimist once. But I couldn't keep him down! (Laughs uproariously) Get it? Down? Like in my stomach? I'm on fire today!", 10)
]

var croc_bro_score_dialogs_heaven : Array = [
	{"text" : "Muhahaha! That's right! Looks like we'll dine in Heaven! Wonder what happens when we take over? Prepare your belly, our allies will open their gates soon. " ,"score_from":1, "score_to":10 },
	{"text" : "He-he-he, heaven's gettin' thinner and thinner. I like it. " ,"score_from":11, "score_to":25 },
	{"text" : "Dude, I am h-u-n-g-r-y! Hungry for something other than wicked souls! Heaven gets all the good stuff! ","score_from":75, "score_to":89 },
	{"text" : "Damn, heaven's gettin' a little heavy on the good guys, man. Leave some of them for me too, all right? ","score_from":90, "score_to":99 }
]

var croc_bro_score_dialogs_hell : Array = [
	{"text" : "(Loud stomach growl) Can't you feel it, Anoobis? The hunger in my gut, gnawing at me day in and day out. I need excitement, chaos, anything to fill this void.","score_from":-10, "score_to":-1 },
	{"text" : "Anoobis! You... you gotta understand, man. I'm starving down here, and these souls are like flavorless snacks. I need something more, something with a kick!","score_from":-25, "score_to":-11 },
	{"text" : "Anoobis, my stomach... it's killing me, man. I went a bit overboard with those souls. Too much, too fast.", "score_from":-89, "score_to":-75 },
	{"text" : "((Burping uncontrollably) Ugh, I thought I could handle it, you know? A feast to end all feasts. But now, it feels like the underworld itself is churning in my gut.","score_from":-99, "score_to":-90 }
]

var cat_godess_dialogs: Array[DialogData] = [
	DialogData.new("Welcome to Heaven, love: Come sit next to me on one of these fluffy clouds. I don’t have a library card, but do you mind if I check you out? On the right, that stairway leads to eternity. Send us some good folks, will you?", 1),
	DialogData.new("Oh my, if it isn't my intern-boy! Did you bring some juicy souls for mommy? Let me tie your shoes, ‘cause I don’t want you falling for anyone else.", 2),
	DialogData.new("Let’s flip a coin. Head, and I’m yours. Tails, you’re mine. Say, darling, would you run some errands for me? I'd give you some Heaven points in return... Or even something else you desire.", 3),
	DialogData.new("Want a fig? No? How about a date? It gets pretty lonely here without you. You could send mommy some more souls to play with.", 4),
	DialogData.new("Your eyes are like IKEA… I get lost in them. Send me more souls; I don't wanna lose to Hell.", 5),
	DialogData.new("I'd never play hide and seek with you because someone like you is impossible to find.", 6),
	DialogData.new("Is your name Wi-Fi because I’m really feeling a connection. Send me some souls at seksicat@hevin.org.", 7),
	DialogData.new("My mom told me to follow my dreams. Can I have your Instagram?", 8),
	DialogData.new("Aren't you tired? From running through my mind all day? Come lay on my lap. Or should I lay on yours? Meow... How was your day?", 9),
	DialogData.new("Guess what I’m wearing? The smile you gave me. And underneath... Nothing.", 10)
]

var cat_goddess_score_dialogs_heaven : Array = [
	{"text" :"Are you a charger? Because I'm dying without you. Seriously, please help, cause we are about to collapse. I don't want to loose this between us for some demons." ,"score_from":1, "score_to":10 },
	{"text" :"If you let me borrow a kiss, I promise I'll give it right back. Also, you could borrow us some souls, we are not really overflowing at the moment..." ,"score_from":11, "score_to":25 },
	{"text" : "Are you a loan? Because you've got my interest. We are about to conquer everything, baby. Mommy's proud of you.","score_from":75, "score_to":89 },
	{"text" : "If I could rearrange the alphabet, I would put 'U' and 'I' together. We will win this race! I mean like reaaaally soon. Be ready.","score_from":90, "score_to":99 }
]
	
var cat_goddess_score_dialogs_hell : Array = [
	{"text" : "Are you a parking ticket? You've got fine written all over you. Hell seems a little weak on meat, baby. We don't wanna win just yet.","score_from":-10, "score_to":-1 },
	{"text" : "Well, here I am! What were your other two wishes? Well, probably making the croc starve is one of them...","score_from":-25, "score_to":-11 },
	{"text" : "On a scale of 1 to 10, you're a 9 and I'm the 1 you need. I also need you to weaken Hell... Like a hella lot.", "score_from":-89, "score_to":-75 },
	{"text" : "If you were a potato, you’d be a sweet potato. Can you please fix the Hell situation? Mommy's a little worried...","score_from":-99, "score_to":-90 }
]


func anubis_speak(level: int) -> String:
	if (level != 10):
		return anubis_dialogs.filter(func(dialog): return dialog.level == level+1)[0].text
	else:
		return anubis_dialogs.filter(func(dialog): return dialog.level == level)[0].text

func croc_speak(level: int) -> String:
	return croc_bro_dialogs.filter(func(dialog): return dialog.level == level)[0].text
	
func goddess_speak(level: int) -> String:
	return cat_godess_dialogs.filter(func(dialog): return dialog.level == level)[0].text
	
func goddess_speak_score_hell():
	var score = GlobalGameData.hell_score
	if (score <= -1 && score >= -10):
		return cat_goddess_score_dialogs_hell[0].text
	elif (score <= -11 && score >= -25):
		return cat_goddess_score_dialogs_hell[1].text
	elif (score <= -75 && score >= -89):
		return cat_goddess_score_dialogs_hell[2].text
	elif (score <= -90 && score >= -99):
		return cat_goddess_score_dialogs_hell[3].text
	return null
	
func goddess_speak_score_heaven():
	var score = GlobalGameData.heaven_score
	if (score >= 1 && score <= 10 ):
		return cat_goddess_score_dialogs_heaven[0].text
	elif (score >= 11 && score <= 25):
		return cat_goddess_score_dialogs_heaven[1].text
	elif (score >= 75 && score <= 89):
		return cat_goddess_score_dialogs_heaven[2].text
	elif (score >= 90 && score <= 99):
		return cat_goddess_score_dialogs_heaven[3].text
	return null
	
func anubis_speak_score_hell():
	var score = GlobalGameData.hell_score
	print ("hell_score", score)
	if (score <= -1 && score >= -10):
		return anubis_score_dialogs_hell[0].text
	elif (score <= -11 && score >= -25):
		return anubis_score_dialogs_hell[1].text
	elif (score <= -75 && score >= -89):
		return anubis_score_dialogs_hell[2].text
	elif (score <= -90 && score >= -99):
		return anubis_score_dialogs_hell[3].text
	
func anubis_speak_score_heaven():
	var score = GlobalGameData.heaven_score
	print ("heaven_score", score)
	if (score >= 1 && score <= 10 ):
		return anubis_score_dialogs_heaven[0].text
	elif (score >= 11 && score <= 25):
		return anubis_score_dialogs_heaven[1].text
	elif (score >= 75 && score <= 89):
		return anubis_score_dialogs_heaven[2].text
	elif (score >= 90 && score <= 99):
		return anubis_score_dialogs_heaven[3].text

func croc_speak_score_hell():
	var score = GlobalGameData.hell_score
	print ("hell_score", score)
	if (score <= -1 && score >= -10):
		return croc_bro_score_dialogs_hell[0].text
	elif (score <= -11 && score >= -25):
		return croc_bro_score_dialogs_hell[1].text
	elif (score <= -75 && score >= -89):
		return croc_bro_score_dialogs_hell[2].text
	elif (score <= -90 && score >= -99):
		return croc_bro_score_dialogs_hell[3].text
	
func croc_speak_score_heaven():
	var score = GlobalGameData.heaven_score
	print ("heaven_score", score)
	if (score >= 1 && score <= 10 ):
		return croc_bro_score_dialogs_heaven[0].text
	elif (score >= 11 && score <= 25):
		return croc_bro_score_dialogs_heaven[1].text
	elif (score >= 75 && score <= 89):
		return croc_bro_score_dialogs_heaven[2].text
	elif (score >= 90 && score <= 99):
		return croc_bro_score_dialogs_heaven[3].text

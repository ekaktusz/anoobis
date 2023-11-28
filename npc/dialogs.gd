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

var croc_bro_dialogs:Array[DialogData] = [
	DialogData.new("Ah, is it lunchtime already? Just kidding. Welcome to Hell, neutral soul, you must be Anubis's new intern. Anoobis, is it? On the left, you see the power of my realm above the soup I'm cooking. I only eat the souls of the wicked. Make sure to send me the right souls or else you'll be demoted to my lunch.", 1),
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

func anubis_speak(level: int) -> String:
	return anubis_dialogs.filter(func(dialog): return dialog.level == level+1)[0].text

func croc_speak(level: int) -> String:
	return croc_bro_dialogs.filter(func(dialog): return dialog.level == level+1)[0].text
	
func cat_speak(level: int) -> String:
	return cat_godess_dialogs.filter(func(dialog): return dialog.level == level+1)[0].text
	

library crank_it_up.lib.app;

import 'package:flutter/material.dart';

int maxRanks = 1;
List<bool> ranks = List<bool>.filled(maxRanks, false);
List<Color> rankColors = [const Color.fromARGB(255, 255, 223, 0), const Color.fromARGB(255, 196, 202, 206), const Color.fromARGB(255, 205, 127, 50)];

List<Pack> packs = [
  Pack(
    id: 0,
    name: "BASE",
    img: "base",
    scenarios: const [
      'What is the song you wish you made?',
      'You have to milk 100 cows, what song do you put on?',
      'You have to program a mobile application; what do you play to focus?',
      'You are fighting the biggest dump of your life (shirt off, socks on), what do you play?',
      'You are in a car with your pregnant wife in the trunk driving off a bridge; what is the song you are singing?',
      'You are on the way to a school trip, what are you jamming to?',
      'You can show your young self one song; what do you let them know?',
      'You are dancing at a middle school prom; what is the DJ playing?',
      'You are on a road trip with your parents when you were young; what are they playing?',
      'You walk into a house party in 2007, what is on?',
      'You are mining for gold; what is your mate playing?',
      'You wait in line for a hotdog stand; what is the guy in front of you playing?',
      'You are on hold for tech support; what are they playing for you?',
      'You are rolling around in whipped cream; what did you put on?',
      "According to all known laws of aviation, there is no way a bee should be able to fly.Its wings are too small to get its fat little body off the ground.The bee, of course, flies anyway because bees don't care what humans think is impossible.Yellow, black. Yellow, black. Yellow, black. Yellow, black.Ooh, black and yellow!Let's shake it up a little.Barry! Breakfast is ready!Coming!Hang on a second.Hello?Barry?Adam?Can you believe this is happening?I can't.I'll pick you up.Looking sharp.Use the stairs, Your father paid good money for those.Sorry. I'm excited.Here's the graduate.We're very proud of you, son.A perfect report card, all B's.Very proud.Ma! I got a thing going here.You got lint on your fuzz.Ow! That's me!Wave to us! We'll be in row 118,000.Bye!Barry, I told you, stop flying in the house!Hey, Adam.Hey, Barry.Is that fuzz gel?A little. Special day, graduation.Never thought I'd make it.Three days grade school, three days high school.Those were awkward.Three days college. I'm glad I took a day and hitchhiked around The Hive.You did come back different.Hi, Barry. Artie, growing a mustache? Looks good.Hear about Frankie?Yeah.You going to the funeral?No, I'm not going.Everybody knows, sting someone, you die.Don't waste it on a squirrel.Such a hothead.I guess he could have just gotten out of the way.I love this incorporating an amusement park into our day.That's why we don't need vacations.Boy, quite a bit of pomp under the circumstances.Well, Adam, today we are men.We are!Bee-men.Amen!Hallelujah!Students, faculty, distinguished bees,please welcome Dean Buzzwell.Welcome, New Hive City graduating class of 9:15.That concludes our ceremonies And begins your career at Honex Industries!Will we pick our job today?I heard it's just orientation.Heads up! Here we go.Keep your hands and antennas inside the tram at all times.Wonder what it'll be like?A little scary.Welcome to Honex, a division of Honesco and a part of the Hexagon Group.This is it!Wow.Wow.We know that you, as a bee, have worked your whole life to get to the point where you can work for your whole life.Honey begins when our valiant Pollen Jocks bring the nectar to The Hive.Our top-secret formula is automatically color-corrected, scent-adjusted and bubble-contoured into this soothing sweet syrup with its distinctive golden glow you know as... Honey!That girl was hot.She's my cousin!She is?Yes, we're all cousins.Right. You're right.At Honex, we constantly strive to improve every aspect of bee existence.These bees are stress-testing a new helmet technology.What do you think he makes?Not enough.Here we have our latest advancement, the Krelman.What does that do?Catches that little strand of honey that hangs after you pour it.Saves us millions.Can anyone work on the Krelman?Of course. Most bee jobs are small ones.But bees know that every small job, if it's done well, means a lot.But choose carefully because you'll stay in the job you pick for the rest of your life.The same job the rest of your life? I didn't know that.What's the difference?You'll be happy to know that bees, as a species, haven't had one day off in 27 million years.So you'll just work us to death?We'll sure try.Wow! That blew my mind!\"What's the difference?\"How can you say that?One job forever?That's an insane choice to have to make.I'm relieved. Now we only have to make one decision in life.But, Adam, how could they never have told us that?Why would you question anything? We're bees.We're the most perfectly functioning society on Earth.You ever think maybe things work a little too well here?Like what? Give me one example.I don't know. But you know what I'm talking about.Please clear the gate. Royal Nectar Force on approach.Wait a second. Check it out.Hey, those are Pollen Jocks!Wow.I've never seen them this close.They know what it's like outside The Hive.Yeah, but some don't come back.Hey, Jocks!Hi, Jocks!You guys did great!You're monsters!You're sky freaks! I love it! I love it!I wonder where they were.I don't know.Their day's not planned.Outside The Hive, flying who knows where, doing who knows what.You can't just decide to be a Pollen Jock. You have to be bred for that.Right.Look. That's more pollen than you and I will see in a lifetime.It's just a status symbol.Bees make too much of it.Perhaps. Unless you're wearing it and the ladies see you wearing it.Those ladies?Aren't they our cousins too?Distant. Distant.Look at these two.Couple of Hive Harrys.Let's have fun with them.It must be dangerous being a Pollen Jock.Yeah. Once a bear pinned me against a mushroom!He had a paw on my throat, and with the other, he was slapping me!Oh, my!I never thought I'd knock him out.What were you doing during this?Trying to alert the authorities.I can autograph that.A little gusty out there today, wasn't it, comrades?Yeah. Gusty.We're hitting a sunflower patch six miles from here tomorrow.Six miles, huh?Barry!A puddle jump for us, but maybe you're not up for it.Maybe I am.You are not!We're going 0900 at J-Gate.What do you think, buzzy-boy?Are you bee enough?I might be. It all depends on what 0900 means.Hey, Honex!Dad, you surprised me.You decide what you're interested in?Well, there's a lot of choices.But you only get one.Do you ever get bored doing the same job every day?Son, let me tell you about stirring.You grab that stick, and you just move it around, and you stir it around.You get yourself into a rhythm.It's a beautiful thing.You know, Dad, the more I think about it,maybe the honey field just isn't right for me.You were thinking of what, making balloon animals?That's a bad job for a guy with a stinger.Janet, your son's not sure he wants to go into honey!Barry, you are so funny sometimes.I'm not trying to be funny.You're not funny! You're going into honey. Our son, the stirrer!You're gonna be a stirrer?No one's listening to me!Wait till you see the sticks I have.I could say anything right now.I'm gonna get an ant tattoo!Let's open some honey and celebrate!Maybe I'll pierce my thorax. Shave my antennae. Shack up with a grasshopper. Get a gold tooth and call everybody \"dawg\"!I'm so proud.We're starting work today!Today's the day.Come on! All the good jobs will be gone.Yeah, right.Pollen counting, stunt bee, pouring, stirrer, front desk, hair removal...Is it still available?Hang on. Two left!One of them's yours! Congratulations!Step to the side.What'd you get?Picking crud out. Stellar!Wow!Couple of newbies?Yes, sir! Our first day! We are ready!Make your choice.You want to go first?No, you go.Oh, my. What's available?Restroom attendant's open, not for the reason you think.Any chance of getting the Krelman?Sure, you're on.I'm sorry, the Krelman just closed out.Wax monkey's always open.The Krelman opened up again.What happened?A bee died. Makes an opening. See? He's dead. Another dead one.Deady. Deadified. Two more dead.Dead from the neck up. Dead from the neck down. That's life!Oh, this is so hard!Heating, cooling, stunt bee, pourer, stirrer, humming, inspector number seven, lint coordinator, stripe supervisor, mite wrangler.Barry, what do you think I should... Barry?Barry!All right, we've got the sunflower patch in quadrant nine...What happened to you?Where are you?I'm going out.Out? Out where?Out there.Oh, no!I have to, before I go to work for the rest of my life.You're gonna die! You're crazy! Hello?Another call coming in.If anyone's feeling brave, there's a Korean deli on 83rd that gets their roses today.Hey, guys.Look at that.Isn't that the kid we saw yesterday?Hold it, son, flight deck's restricted.It's OK, Lou. We're gonna take him up.Really? Feeling lucky, are you?Sign here, here. Just initial that.Thank you.OK.You got a rain advisory today, and as you all know, bees cannot fly in rain.So be careful. As always, watch your brooms, hockey sticks, dogs, birds, bears and bats.Also, I got a couple of reports of root beer being poured on us.Murphy's in a home because of it, babbling like a cicada!That's awful.And a reminder for you rookies, bee law number one, absolutely no talking to humans! All right, launch positions!Buzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz! Buzz, buzz, buzz, buzz!Black and yellow!Hello!You ready for this, hot shot?Yeah. Yeah, bring it on.Wind, check.Antennae, check.Nectar pack, check.Wings, check.Stinger, check.Scared out of my shorts, check.OK, ladies,let's move it out!Pound those petunias, you striped stem-suckers!All of you, drain those flowers!Wow! I'm out!I can't believe I'm out!So blue.I feel so fast and free!Box kite!Wow!Flowers!This is Blue Leader, We have roses visual.Bring it around 30 degrees and hold.Roses!30 degrees, roger. Bringing it around.Stand to the side, kid.It's got a bit of a kick.That is one nectar collector!Ever see pollination up close?No, sir.I pick up some pollen here, sprinkle it over here. Maybe a dash over there, a pinch on that one.See that? It's a little bit of magic.That's amazing. Why do we do that?That's pollen power. More pollen, more flowers, more nectar, more honey for us.Cool.I'm picking up a lot of bright yellow, Could be daisies, Don't we need those?Copy that visual.Wait. One of these flowers seems to be on the move.Say again? You're reporting a moving flower?Affirmative.That was on the line!This is the coolest. What is it?I don't know, but I'm loving this color.It smells good.Not like a flower, but I like it.Yeah, fuzzy.Chemical-y.Careful, guys. It's a little grabby.My sweet lord of bees!Candy-brain, get off there!Problem!Guys!This could be bad.Affirmative.Very close.Gonna hurt.Mama's little boy.You are way out of position, rookie!Coming in at you like a missile!Help me!I don't think these are flowers.Should we tell him?I think he knows.What is this?!Match point!You can start packing up, honey, because you're about to eat it!Yowser!Gross.There's a bee in the car!Do something!I'm driving!Hi, bee.He's back here!He's going to sting me!Nobody move. If you don't move, he won't sting you. Freeze!He blinked!Spray him, Granny!",
      'Red pandas are now the dominant species on earth.',
      'The guinea pigs have risen!'
          'You are sitting on the toitlet, but something feels... off.',
    ],
  ),
  Pack(
    id: 1,
    name: "18+",
    img: "18+",
    scenarios: const [
      'You walk into the black room of a gay bar.',
      'You walk onto a porn set; what is playing in the background of the recording?',
      'You are playing soggy biscuit.',
      'You accidentally enter a gay furry orgy.',
      'You catch your parents having sex, what did they put on?',
      'Your lover is seducing you; what did they put on?',
      'What is the background song of your porn movie?',
      'What song is the perfect rhythm for thrusting?',
      'What is the song you do a strip tease to?',
      'You are getting sloppy head.',
      'What song describes the best head you have ever gotten?',
      'You are taking off the shirt of your partner; what lyrics describe your thoughts?',
      'You are pole-dancing for the first time in a strip club.',
      'You just became the first bitch in a strip club.',
      'You are having hard, animalistic sex.',
      'You are whipping out the whip!',
      'Mario just did your plumbing, now it is your turn to lay some pipe.'
    ],
  ),
  Pack(
    id: 2,
    name: "CHILL",
    img: "chill",
    scenarios: const [
      'You are chilling in a bath with candles and rose petals.',
      'If you are flying like a bird, what would you listen to?',
      'You are vibing in the womb; what is your mom listening to?',
      'You woke up from your nap in the grass.',
      'You are getting a massage; what do you play to hint at a happy ending?',
      'What are you banging while taking a hot shower?',
      'You are sitting on a balcony while it is raining.',
      'You are roasting marshmallows around a campfire; what do you play to sing along?',
      'Someone cooked you your favourite comfort food.',
      'You are relaxing after a big dump; what do you play to de-stress?',
      'You are having a cold drink in hot summer; what song do you play in your head while chugging it?',
      'You wake up in the middle of the night and see you can sleep five more hours.',
      'You are enjoying a hot chocolate in the snow.',
      'You are floating on an air mattress in the Caribbean.',
      'You lie in a Hammock with a cocktail and a book; what song are the birds singing in the background?',
      'You wake up after a party, not hungover; with which song do you celebrate your morning?',
      'You check your phone and see that someone just took over your morning shift.',
      'You wake up, and someone made you breakfast in bed.',
      'You are chilling in a sauna and become dehydrated; what melody do you hear in your delirious state?',
      'You are in a food coma; what song is your stomach rumbling?',
      'You fell asleep while watching tv; what jingle do you want to wake up to?',
    ],
  ),
  Pack(
    id: 3,
    name: "PARTY",
    img: "party",
    scenarios: const [
      'You just got roofied; with what song do you at least enjoy your time?',
      'You need to chug a beer as fast as possible; what is your hype song?',
      'You mistook a raccoon for a cat.',
      'The cops come to check on your party; what do you play to make it not suspicious?',
      'Your parents come home early; what do you put on to make everyone go home quickly?',
      'You have your final beer on marathon Monday.',
      'You focus to sink the final cup.',
      'You just won a game of beer pong.',
      'What do you play to distract other players during a drinking game?',
      'Your mate fell asleep at a party; how do you wake him up?',
      'You are walking home crossfaded; what do you chant together?',
      'You are staring at yourself in the mirror at a party, and you realise you are wasted.',
      'The DJ just passed out; what do you put on to keep the party going?',
      'You are pregaming, and you can play one final song.',
      'The party just ran out of beer; what is the beer delivery driver playing to start the party again?',
      'You are puking your guts out in the toilet; what song do you put on to get everything out?',
      'You span the bottle on your crush.',
      'You just set a new limbo record; what was the song that made you able to do it?',
      'What do you play while cleaning someone else’s puke at a party?',
      'You are running around naked with a dildo on your forehead.',
    ],
  ),
  Pack(
    id: 4,
    name: "DRUGS",
    img: "drugs",
    scenarios: const [
      'You are about to take XTC on a festival for the first time.',
      'You are going hard on a festival, what is the worst song to come on?',
      'You feel like you are about to go into a bad LSD trip.',
      'You are tripping on top of the Eiffel Tower.',
      'You sit on top of the Egyptian pyramids in the desert, tripping on LSD.',
      'You are smuggling drugs on the border of Mexico.',
      'On a DMT trip, what do other entities play for you?',
      'You are on your way to rehab, about to take your last hit.',
      'You are trip sitting your friend for the first time, what do you play for them?',
      'You just drank a bottle of vodka by yourself.',
      'You are doing psychedelics in the forest.',
      'You are tripping in a theme park.',
      'What is your anthem when you are peaking?',
      'What is playing at an underground rave party?',
      'You are coming up in the bathroom.',
      'You go outside for a smoke break.',
      'You finally managed to pee at a festival.',
      'You are checking your rave outfit in the mirror.',
      'What do you play to keep you going while you are crossfaded?',
      'You are tripping and can see sound waves.',
      'You can feel extra vibrations; what do you play to test it?',
    ],
  ),
  Pack(
    id: 5,
    name: "MEDIA",
    img: "pop-culture",
    scenarios: const [
      'Which song would you make the opening of the anime about your life?',
      'You are in an epic car chase.',
      'You are drawing the Mona Lisa.',
      'Your evil nemesis turns around in a chair, slowly, with a cat on their lap; what are they playing for you?',
      'You are watching one of those fake game ads; what is their background music?',
      'A car commercial is on; what is playing in the background?',
      'You are before the final fight in Harry Potter.',
      'You read a great book; what do you play in the background?',
      'You are in an empty cinema, what do you put on the speakers?',
      'You are testing your new bass-boosted surround sound system.',
      'You are a princess in a Disney movie; what song do you sing to the birds?',
      'Dora is taking you exploring.',
      'Spongebob failed his driver’s exam again; what do you play to cheer him up?',
      'What would the pokémon theme song be if you had to decide?',
      'What is your go-to TikTok song?',
      'What song do you keep getting on your feed?',
      'What song do you play to win that Facebook argument?',
      'You just saved princess Peach from Bowser.',
      'What is the winning song when you win PacMan?',
      'What would the theme song be of a series about your life?',
    ],
  ),
  Pack(
    id: 6,
    name: "RELIGION",
    img: "religion",
    scenarios: const [
      'What song would you play for Jesus if you could go back in time?',
      'You are reincarnated, what is your theme song?',
      'You are sent into heaven; what are the angels playing?',
      'You are in hell with Satan, Hitler and your mom; what is she playing?',
      'You are tortured in hell; what is Satan playing?',
      'You are God, you are on the seventh day of creating Earth, what do you play to end it?',
      'You are going to see buddha; what do you let him hear?',
      'You are meeting all the gods of Hinduism; what do they play for you?',
      'You sacrifice a goat for a satanic ritual; what are the men in hoods playing?',
      'You just got attacked by the flying spaghetti monster; what do you play to scare it off?',
      'You can suddenly walk on water; what do you play when flexing on people who cannot?',
      'You just turned water into wine; what do you play as an opener for a huge party?',
      'Jesus turned out to be a fat, old-looking man; what do you play as his *Alexa; play Despacito*?',
      'Buddha is making dancing videos on TikTok; what is he dancing to?',
      'Poseidon is surfing on the water in Hawaii; what do they vibe to?',
      'You meet with Rah, and they decide to turn off the sun; what do you play to convince him to turn it back on?',
      'You are meeting Mohammed; what does he play for you to send his message?',
      'If a song could qualify as a god, what song would it be?',
      'What is the theme song of your religion?',
      'What song would you go in a cult for?',
      'You just recruited the first disciples of your religion.'
    ],
  ),
  Pack(
    id: 7,
    name: "SCARY",
    img: "scary",
    scenarios: const [
      'You are in a haunted house.',
      'You are in a mental asylum; what is a little girl humming?',
      'You are drowning in a cold lake.',
      'You are in a zombie apocalypse, trapped in the basement of a secret lab. Zombies are banging on all the doors around you. You set up all your traps and loaded all your weapons. The first door breaks down...',
      'You are being poisoned.',
      'What song describes your most recent nightmare?',
      'You have to undergo your greatest fear.',
      'You are the last person on earth; what song do you hum to stay sane?',
      'You teleported into a horror movie; what song is the killer playing while chasing you?',
      'You suddenly lose all your senses; what song would you miss the most?',
      'You dressed up as Joker; what song do you listen to while dancing on the stairs?',
      'You are watching a horror movie; what song would scare the crap out of you when it started playing?',
      'What song would a ghost let you hear?',
      'What song would you play on the organ if you were a vampire?',
      'You are vibing with Ghostbusters; what do they hit you with?',
      'What do you play while you transform into a werewolf?',
      'What song do you chant while performing an exorcism?',
      'You are dying in a house fire;.',
      'You see a dancing skeleton; what is it dancing to?',
      'You are about to be kidnapped; what do you not want to hear?',
    ],
  ),
  Pack(
    id: 8,
    name: "SCI-FI",
    img: "sci-fi",
    scenarios: const [
      'You get abducted by aliens; what do they let you hear?',
      'You have to choose a song to send into space for other lifeforms; what do you send?',
      'It is the last day on Earth.',
      'The aliens are planning to exterminate the human race; which song do you play to stop them?',
      'You are in a rocket travelling through space with only one song, what is on repeat?',
      'Aliens put on a song to fuck with you.',
      'You travel 100 years to the future; what song has no one ever heard?',
      'You can teleport to any music festival.',
      'You teleport behind someone; what song do you play to scare them?',
      'You can put an elevator song into someone’s thoughts.',
      'What song would you use in your mind control tape?',
      'You are watching a fight between two gigantic mutants.',
      'What is your other self playing in an alternate universe to this question?',
      'What song sounds like it is from another dimension?',
      'What song was invented in a fictional world?',
      'You go back in time to remove one song from the charts; which is it?',
      'What do you play for robots to avoid a singularity?',
      'You can share a song your friends can listen to at all times; what do you play for them?',
      'You can sing a song while you are invisible; how do you freak someone out?',
    ],
  ),
  Pack(
    id: 9,
    name: "SPORTS",
    img: "sports",
    scenarios: const [
      'You fight a heavyweight boxing champion, what is your entry song?',
      'You are in a gladiator fight with a lion.',
      'You are on top of Mount Everest.',
      'You are preparing for the Champions League final.',
      'Someone is jogging past you with loud music, what is the worst song they could play?',
      'You are wrestling a boar in the mud.',
      'You are getting caught with a drug test; what song describes your state of despair?',
      'You punch a referee.',
      'You are in the shower with your team after practice.',
      'You just hit a strike; what song is playing on the screen?',
      'You are joyriding a golf cart while the owner runs after you; what are you playing to say fuck you?',
      'You got a concussion during sports; what is going on in your mind?',
      'You just let go of the winning curling stone.',
      'You are getting grappled in a judo match.',
      'You are snowboarding away from an avalanche; what do you play to evade it?',
      'You hit a new PR in weightlifting.',
      'What is your opening song for your darting match?',
      'You need to play music to secure your pool table.',
      'What do you put on to find the perfect move in a chess match?',
      'You just dunked on someone; what do you play to embarrass them?',
    ],
  ),
  Pack(
    id: 10,
    name: "WEED",
    img: "weed",
    scenarios: const [
      'You are high; and ??.',
      'You join a smoke sesh with Snoop Dogg, Bob Marley, MLK and Obama, what do they play?',
      'You are high and on your way to meet your family-in-law; what do you play to calm yourself down?',
      'You are smoking in the car with your mate with a seaside view.',
      'You just rolled your first cross joint.',
      'You are high, and your pizza just finished.',
      'Your mate just pulled up with some cold juice.',
      'You accidentally took weed brownies; what do you play to enjoy the night?',
      'You just found a Ben&Jerry’s New York Super Fudge Chunk in your freezer; what do you play while feasting?',
      'You are on an adventure to get a (vegan) Big Mac; what do you play on the way?',
      'You are smoking a sad jonko; what do you put on to cope with it?',
      'You are chilling on the couch, smoking a joint; what music video do you put on?',
      'You lay in an open field, smoking a joint, looking at the stars.',
      'You are playing Dungeons and Dragons high; what is your character’s tune?',
      'You are smoking for the first time; what makes you go into a bad trip?',
      'You are high at a concert; what musician do you want to see live?',
      'You are sitting on your balcony, listening to the rain.',
      'You are chilling on the beach with a joint; what do you put on the speaker?',
      'You are smoking a joint with your favourite artist; what is the song you feature on?',
      'You roll the joint, and something goes wrong; what do you play to cheer you up?',
    ],
  ),
];

class GameObject {
  final List<Player> players;
  final int totalRounds;
  final List<String> scenarios;

  int currentRound = 1;
  String currentScenario = "";

  GameObject({required this.players, required this.totalRounds, required this.scenarios});
}

class Player {
  final String name;
  int score = 0;
  int rank = maxRanks;

  Player({required this.name});

  updateScore() => {score += maxRanks - rank, rank = maxRanks};
}

class Pack {
  final int id;
  final String name;
  final String img;
  final List scenarios;
  bool isSelected;

  Pack({
    required this.id,
    required this.name,
    required this.img,
    required this.scenarios,
    this.isSelected = true,
  });
}

GameObject? game;

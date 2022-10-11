library crank_it_up.lib.app;

import 'package:flutter/material.dart';

int maxRanks = 1;
List<bool> ranks = List<bool>.filled(maxRanks, false);
List<Color> rankColors = [
  const Color.fromARGB(255, 255, 223, 0),
  const Color.fromARGB(255, 196, 202, 206),
  const Color.fromARGB(255, 205, 127, 50)
];

List<Pack> packs = [
  Pack(
    id: 0,
    name: "BASE",
    img: "base",
    scenarios: const [
      'What is the song you wish you made?',
      'You have to milk 100 cows, what song do you put on?',
      'You have to program a mobile application, what do you play to focus?',
      'You are fighting the biggest dump of your life (shirt off, socks on), what do you play?',
      'You are in a car with your pregnant wife in the trunk driving off a bridge, what is the song you are singing?',
      'You are on the way to a schooltrip, what are you jamming to?',
      'You can show your young self one song, what do you let them know?',
      'You are dancing at a middle school prom, what is the DJ playing?',
      'You are on a road trip with your parents when you were young, what are they playing?',
      'You walk into a house party in 2007, what is on?',
      'You are mining for gold, what is your mate playing?',
      'You wait in line for a hotdog stand, what is the guy in front of you playing?',
      'You are on hold for tech support, what are they playing for you?',
      'You are rolling around in whipped cream, what did you put on?',
    ],
  ),
  Pack(
    id: 1,
    name: "18+",
    img: "18+",
    scenarios: const [
      'You walk into the black room of a gay bar, what do you hear?',
      'You walk onto a porn set, what is playing in the background of the recording?',
      'You are playing soggy biscuit. What is playing in the background?',
      'You accidentally enter a furry orgy. What music are they playing?',
      'You are fucking a MILF, what is your song?',
      'You catch your parents having sex, what did they put on?',
      'Your lover is seducing you, what did they put on?',
      'What is the background song of your porn movie?',
      'What song is the perfect rhythm for thrusting?',
      'What is the song you do a strip tease to?',
      'What song do you want to hear while getting head?',
      'What song describes the best head you have ever gotten?',
      'You are taking off the shirt of your partner; what lyrics describes your thoughts?',
      'What song is your background music while pole dancing?',
      'What song do you listen to while having hard, animal sex?',
      'What song do you play while whipping out the whip?',
    ],
  ),
  Pack(
    id: 2,
    name: "CHILL",
    img: "chill",
    scenarios: const [
      'You are chilling in a bath with candles and rose petals, what is in the background?',
      'If you are flying like a bird, what would you listen to?',
      'You are vibing in the womb, what is your mom listening to?',
      'You woke up from your nap in the grass; what do you wish was playing in the background?',
      'You are getting a massage; what do you play to hint at a happy ending?',
      'What are you banging while taking a hot shower?',
      'You are sitting on a balcony while it’s raining; what do you play to accompany the mood?',
      'You are roasting marshmallows around a campfire; what do you play to sing along?',
      'Someone cooked you your favourite comfort food, what do you play to thank them?',
      'You are relaxing after a big dump; what do you play to de-stress?',
      'You are having a cold drink in hot summer; what song do you play in your head while chugging it?',
      'You wake up in the middle of the night and see you can sleep five more hours; what do you play to fall asleep?',
      'You are enjoying a hot chocolate in the snow; what would you like to hear?',
      'You are floating on an air mattress in the Caribbean; what is your go-to song?',
      'You lie in a Hammock with a cocktail and a book; what song are the birds singing in the background?',
      'You wake up after a party, not hungover; with which song do you celebrate your morning?',
      'Someone took over your shift; what do you play to celebrate?',
      'You wake up, and someone made you breakfast in bed; what song have they put on?',
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
      'You mistook a raccoon for a cat; what is your go-to chase song?',
      'The cops come to check on your party; what do you play to make it not suspicious?',
      'Your parents come home early; what do you put on to make everyone go home quickly?',
      'You have your final beer on marathon Monday; what do you put on to enjoy it?',
      'You focus to sink the final cup; what do you put on?',
      'You just won a game of beer pong; what is your celebration song?',
      'What do you play to distract other players during a drinking game?',
      'Your mate fell asleep at a party; how do you wake him up?',
      'You are walking home crossfaded; what do you chant together?',
      'You are staring at yourself in the mirror at a party, and you realise you are wasted; what do you play to sober yourself up?',
      'The DJ just passed out; what do you put on to keep the party going?',
      'You are pregaming, and you can play one final song; what do you play to sober and hype you up at once?',
      'The party just ran out of beer; what is the beer delivery driver playing to start the party again?',
      'A bunch of people just skinny-dipped into a pool, and the splash broke the speakers; what distorted song comes on?',
      'You are puking your guts out in the toilet; what song do you put on to get everything out?',
      'You span the bottle on your crush; what is the song playing in your head?',
      'You just set a new limbo record; what was the song that made you able to do it?',
      'What do you play while cleaning someone else’s puke at a party?',
    ],
  )
  Pack(
    id: 4,
    name: "DRUGS",
    img: "drugs",
    scenarios: const [
      'You are about to take XTC on a festival for the first time, what is playing in the tent behind you?',
      'You are going hard on a festival, what is the worst song to come on?',
      'What song gives you a bad LSD trip?',
      'You are tripping on top of the Eiffel Tower, what do you hear?',
      'You are sitting on top of the Egyptian pyramids in the desert, tripping on LSD, what do you put on?',
      'You are smuggling drugs on the border of Mexico, what song do you listen to to keep calm?',
      'On a DMT trip, what do other entities play for you?',
      'You are on your way to rehab, about to take your last hit, what do you put on?',
      'You are trip sitting your friend for the first time, what do you play for them?',
      'You just drank a bottle of vodka by yourself, what is the song on?',
      'You are doing psychedelics in the forest; what are you playing?',
      'You are tripping in a theme park; what’s your go-to song?',
      'What’s your anthem when you are peaking?',
      'What’s playing at an underground rave party?',
      'You are coming up in the bathroom; what do you hear in the other room?',
      'You go outside for a smoke break; what is playing at the party?',
      'You finally managed to pee at a festival; what’s your winning song?',
      'You are preparing for a festival; how do you hype yourself up?',
      'What do you play to keep you going while you are crossfaded?',
      'You are tripping and can see sound waves; what are you playing?',
      'You can feel extra vibrations; what do you play to test it?',
    ],
  ),
  Pack(
    id: 5,
    name: "MEDIA",
    img: "pop-culture",
    scenarios: const [
      'Which song would you make the opening of the anime about your life?',
      'You are in a car chase, what is banging?',
      'You are drawing Mona Lisa, what are you listening to?',
      'Your evil nemesis turns around in a chair, slowly and with a cat on their lap, what are they playing for you?',
      'You are watching one of those fake game ads, what is their background music?',
      'A car commercial is on, what is playing in the background?',
      'You are before the final fight in Harry Potter; what do you play to hype up?',
      'You read a great book; what do you play in the background?',
      'You are in an empty cinema, what do you put on the speakers?',
      'You are testing your new speakers; what do you play on them?',
      'You are a princess in a Disney movie; what song do you sing to the birds?',
      'Dora is taking you exploring; what is her vibe?',
      'Spongebob failed his driver’s exam again; what do you play to cheer him up?',
      'What would the pokémon theme song be if you had to decide?',
      'What is your go-to TikTok song?',
      'What song do you keep getting on your feed?',
      'What song do you play to win that Facebook argument?',
      'You are storming Bowser’s castle; what song is on in his castle?',
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
      'You are being reincarnated, what is your theme song?',
      'You are sent into heaven, what are the angels playing?',
      'You are in hell with Satan, Hitler and your mom, what is she playing?',
      'You are being tortured in hell, what is Satan playing?',
      'You are God, you’re on the seventh day of creating Earth, what do you play to end it?',
      'You are going to see buddha; what do you let him hear?',
      'You are meeting all the gods of Hinduism; what do they play for you?',
      'You sacrifice a goat for a satanic ritual; what are the men in hoods playing?',
      'You just got attacked by the flying spaghetti monster; what do you play to scare it off?',
      'You can suddenly walk on water; what do you play when flexing on people who can’t?',
      'You just turned water into wine; what do you play as an opener for a huge party?',
      'Jesus turned out to be a fat, old-looking man; what do you play as his *Alexa; play Despacito*?',
      'Buddha is making dancing videos on TikTok; what is he dancing to?',
      'Poseidon is surfing on the water in Hawaii; what do they vibe to?',
      'You meet with Rah, and they decide to turn off the sun; what do you play to convince him to turn it back on?',
      'You are meeting Mohammed; what does he play for you to send his message?',
      'If a song could qualify as a god, what song would it be?',
      'What’s the theme song of your religion?',
      'What song would you go in a cult for?',
    ],
  ),
  Pack(
    id: 7,
    name: "SCARY",
    img: "scary",
    scenarios: const [
      'You are in a haunted house, what is playing?',
      'You are in a mental asylum, what is a little girl humming?',
      'You are drowning in a cold lake, what is playing?',
      'In a zombie apocalypse, what is the going song?',
      'You are being poisoned, what song do you go out on?',
      'What song describes your most recent nightmare?',
      'You have to undergo your greatest fear, what is',
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
      'You are dying in a house fire; what do you play as a last song?',
      'You see a dancing skeleton; what is it dancing to?',
      'You are about to be kidnapped; what do you not want to hear?',
    ],
  ),
  Pack(
    id: 8,
    name: "SCI-FI",
    img: "sci-fi",
    scenarios: const [
      'You are abducted by aliens, what do they let you hear?',
      'You have to choose a song to send into space for other lifeforms, what do you send?',
      'It’s the last day on Earth, what do you wanna listen to?',
      'The aliens are planning to exterminate the human race, which song do you play to stop them?',
      'You are in a rocket travelling through space with only one song, what is on repeat?',
      'Aliens put on a song to fuck with you; what do they play?',
      'You travel 100 years to the future; what song has no one ever heard?',
      'You can teleport to any music festival; what is playing?',
      'You teleport behind someone; what song do you play to scare them?',
      'You can put an elevator song into someone’s thoughts; what do you play?',
      'What song would you use in your mind control tape?',
      'You are watching a fight between two gigantic mutants; what fits the moment?',
      'What’s your other self playing in an alternate universe to this question?',
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
      'You are in a gladiator fight with a lion, what song is in the background?',
      'You are on top of the Mount Everest, what is a mountain climber playing?',
      'You are preparing for the Champions League final, what do you play on your headphones?',
      'Someone is jogging past you with very loud music, what do you hear?',
      'You are wrestling a boar in the mud, what is your jam?',
      'You are getting caught with a drug test; what song describes your state of despair?',
      'You punch the referee; what tune is playing in your mind?',
      'You are in the shower with your team after practice; what is your banger?',
      'You just hit a strike; what song is playing on the screen?',
      'You are joyriding a golf cart while the owner runs after you; what are you playing to say fuck you?',
      'You got a concussion during sports; what is going on in your mind?',
      'You just let go of the winning curling stone; what do you put on in the back of your mind?',
      'You are getting grappled in a judo match; what gives extra strength?',
      'You are snowboarding away from an avalanche; what do you play to evade it?',
      'You hit a new PR in weightlifting; what did you put on?',
      'What’s your opening song for your darting match?',
      'You need to play music to secure your pool table; what do you put on?',
      'What do you put on to find the perfect move in a chess match?',
      'You just dunked on someone; what do you play to embarrass them?',
    ],
  ),
  Pack(
    id: 10,
    name: "WEED",
    img: "weed",
    scenarios: const [
      'You are high and ?',
      'You join a smoke sesh with Snoop Dogg, Bob Marley, MLK and Obama, what do they play?',
      'You are high and on your way to meet your family in law, what do you play to calm yourself down?',
      'You are in smoking the car with your mate with a seaside view, what is on the car radio?',
      'You just rolled your first cross joint, what do you play to celebrate?',
      'You are high, and your pizza just finished; what do you want to hear in the background?',
      'Your mate just pulled up with some cold juice; what do you play to celebrate?',
      'You accidentally took weed brownies; what do you play to enjoy the night?',
      'You just found a Ben&Jerry’s New York Super Fudge Chunk in your freezer; what do you play while feasting?',
      'You are on an adventure to get a (vegan) Big Mac; what do you play on the way?',
      'You are smoking a sad jonko; what do you put on to cope with it?',
      'You are chilling on the couch, smoking a joint; what music video do you put on?',
      'You lay in an open field, smoking a joint, looking at the stars; what do you play in the background?',
      'You are playing Dungeons and Dragons high; what is your character’s tune?',
      'You are smoking for the first time; what makes you go into a bad trip?',
      'You are high at a concert; what musician do you want to see live?',
      'You are sitting on your balcony, listening to the rain; what is on in the background?',
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

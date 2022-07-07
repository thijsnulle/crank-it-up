library crank_it_up.lib.app;

import 'dart:ui';
import 'components/pack.dart';

int maxRanks = 1;
List<bool> ranks = List<bool>.filled(maxRanks, false);

List<Pack> packs = [
  Pack(
      id: 0,
      name: "BASE",
      img: "base",
      scenarios: const [
        'What’s the song you wish you made?',
        'You have to milk 100 cows, what song do you put on?',
        'You have to program a mobile application, what do you play to focus?',
        'You’re fighting the biggest dump of your life (shirt off, socks on), what do you play?',
        'You’re in a car with your pregnant wife in the trunk driving off a bridge, what’s the song you’re singing?',
        'You’re on the way to a schooltrip, what are you jamming to?',
        'You can show your young self one song, what do you let them know?',
        'You’re dancing at a middle school prom, what is the DJ playing?',
        'You’re on a road trip with your parents when you were young, what are they playing?',
        'You walk into a house party in 2007, what’s on?',
        'You are mining for gold, what’s your mate playing?',
        'You wait in line for a hotdog stand, what’s the guy in front of you playing?',
        'You are on hold for tech support, what are they playing for you?',
        'You are rolling around in whipped cream, what did you put on?',
      ],
      color: const Color.fromARGB(255, 43, 41, 41)),
  // Pack(
  //     id: 1,
  //     name: "18+",
  //     img: "18+",
  //     scenarios: const [
  //       'You walk into the black room of a gay bar, what do you hear?',
  //       'You walk onto a porn set, what’s playing in the background of the recording?',
  //       'You’re playing soggy biscuit. What’s playing in the background?',
  //       'You accidentally enter a furry orgy. What music are they playing?',
  //       'You’re fucking a MILF, what’s your song?',
  //       'You catch your parents having sex, what did they put on?',
  //       'Your lover is seducing you, what did they put on?',
  //     ],
  //     color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(
      id: 1,
      name: "CHILL",
      img: "chill",
      scenarios: const [
        'You’re chilling in a bath with candles and rose petals, what’s in the background?',
        'If you’re flying like a bird, what’d you listen to?',
        'You’re vibing in the womb, what’s your mom listening to?',
      ],
      color: const Color(0xFF247BA0)),
  Pack(
      id: 2,
      name: "COUNTRIES",
      img: "countries",
      scenarios: const [
        'You walk into a random house in Texas, what do you hear?',
        'You’re skydiving off the burj khalifa',
        'Kim Jung Un will listen to one song to free North Korea, what do you put up?',
        'You are on a research mission in the arctics, what’s your coworker playing?',
      ],
      color: const Color.fromARGB(255, 73, 155, 74)),
  // Pack(
  //     id: 3,
  //     name: "DRUGS",
  //     img: "drugs",
  //     scenarios: const [
  //       'You’re about to take XTC on a festival for the first time, what’s playing in the tent behind you?',
  //       'You’re going hard on a festival, what’s the worst song to come on?',
  //       'What song gives you a bad LSD trip?',
  //       'You’re tripping on top of the Eiffel Tower, what do you hear?',
  //       'You’re sitting on top of the Egyptian pyramids in the desert, tripping on LSD, what do you put on?',
  //       'You’re smuggling drugs on the border of Mexico, what song do you listen to to keep calm?',
  //       'On a DMT trip, what do other entities play for you?',
  //       'You’re on your way to rehab, about to take your last hit, what do you put on?',
  //       'You’re trip sitting your friend for the first time, what do you play for them?',
  //       'You just drank a bottle of vodka by yourself, what’s the song on?',
  //     ],
  //     color: const Color.fromARGB(255, 119, 36, 160)),
  Pack(
      id: 3,
      name: "MEDIA",
      img: "pop-culture",
      scenarios: const [
        'Which song would you make the opening of the anime about your life?',
        'You’re in a car chase, what’s banging?',
        'You’re drawing Mona Lisa, what are you listening to?',
        'Your evil nemesis turns around in a chair, slowly and with a cat on their lap, what are they playing for you?',
        'You’re watching one of those fake game ads, what’s their background music?',
        'A car commercial is on, what’s playing in the background?',
      ],
      color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(
      id: 4,
      name: "RELIGION",
      img: "religion",
      scenarios: const [
        'What song would you play for Jesus if you could go back in time?',
        'You’re being reincarnated, what’s your theme song?',
        'You’re sent into heaven, what are the angels playing?',
        'You’re in hell with Satan, Hitler and your mom, what is she playing?',
        'You’re being tortured in hell, what’s Satan playing?',
        'You are God, you’re on the seventh day of creating Earth, what do you play to end it?',
      ],
      color: const Color.fromARGB(255, 207, 210, 212)),
  Pack(
      id: 5,
      name: "SCARY",
      img: "scary",
      scenarios: const [
        'You are in a haunted house, what’s playing?',
        'You are in a mental asylum, what’s a little girl humming?',
        'You’re drowning in a cold lake, what’s playing?',
        'In a zombie apocalypse, what’s the going song?',
        'You’re being poisoned, what song do you go out on?',
      ],
      color: const Color.fromARGB(255, 222, 152, 12)),
  Pack(
      id: 6,
      name: "SCI-FI",
      img: "sci-fi",
      scenarios: const [
        'You’re abducted by aliens, what do they let you hear?',
        'You have to choose a song to send into space for other lifeforms, what do you send?',
        'It’s the last day on Earth, what do you wanna listen to?',
        'The aliens are planning to exterminate the human race, which song do you play to stop them?',
        'You’re in a rocket travelling through space with only one song, what’s on repeat?',
      ],
      color: const Color.fromARGB(255, 119, 36, 160)),
  Pack(
      id: 7,
      name: "SPORTS",
      img: "sports",
      scenarios: const [
        'You fight a heavyweight boxing champion, what’s your entry song?',
        'You’re in a gladiator fight with a lion, what song is in the background?',
        'You’re on top of the Mount Everest, what’s a mountain climber playing?',
        'You are preparing for the Champions League final, what do you play on your headphones?',
        'Someone is jogging past you with very loud music, what do you hear?',
        'You’re wrestling a boar in the mud, what’s your jam?',
      ],
      color: const Color.fromARGB(255, 160, 44, 36)),
  Pack(
      id: 8,
      name: "VACATION",
      img: "vacation",
      scenarios: const [
        'You’re in a foreign country, step into a taxi, what’s playing on the radio?',
        'You dive into the Mariana Trench, what do you listen to?',
        'You listen to a snake charmer, what is he playing?',
        'You’re in a Japanese elevator, what’s the tune?',
      ],
      color: const Color.fromARGB(255, 222, 152, 12)),
  // Pack(
  //     id: 11,
  //     name: "WEED",
  //     img: "weed",
  //     scenarios: const [
  //       'You join a smoke sesh with Snoop Dogg, Bob Marley, MLK and Obama, what do they play?',
  //       'You’re high and on your way to meet your family in law, what do you play to calm yourself down?',
  //       'You’re in smoking the car with your mate with a seaside view, what’s on the car radio?',
  //       'You just rolled your first cross joint, what do you play to celebrate?',
  //     ],
  //     color: const Color.fromARGB(255, 73, 155, 74)),
];

class GameObject {
  final List<Player> players;
  final int totalRounds;
  final List<String> scenarios;

  int currentRound = 1;

  GameObject({required this.players, required this.totalRounds, required this.scenarios});
}

class Player {
  final String name;
  int score = 0;
  int rank = maxRanks;

  Player({required this.name});

  updateScore() => {score += maxRanks - rank, rank = maxRanks};
}

GameObject game = GameObject(players: [], totalRounds: -1, scenarios: []);

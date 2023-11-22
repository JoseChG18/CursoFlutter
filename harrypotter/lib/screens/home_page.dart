import 'package:flutter/material.dart';
import 'package:harrypotter/models/character.dart';
import 'package:harrypotter/screens/character_detail.dart';

List<Character> characters = [
  Character(
      name: "Harry Potter",
      url:
          "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest?cb=20160903184919",
      totalStars: 0,
      reviews: 0,
      strength: 8,
      magic: 10,
      speed: 9),
  Character(
      name: "Hermione Granger",
      url:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest?cb=20120729103114&path-prefix=es",
      totalStars: 0,
      reviews: 0,
      strength: 7,
      magic: 10,
      speed: 10),
  Character(
      name: "Ron Weasley",
      url:
          "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/1000?cb=20150523213430",
      totalStars: 0,
      reviews: 0,
      strength: 6,
      magic: 5,
      speed: 7)
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Hogwarts'),
          backgroundColor: Colors.deepPurple.shade200,
        ),
        body: ListView(
          children: [
            for (var character in characters)
              Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  leading: Hero(
                      tag: character.name, child: Image.network(character.url)),
                  title: Text(character.name),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CharacterDetail(character: character)));
                  },
                ),
              )
          ],
        ));
  }
}

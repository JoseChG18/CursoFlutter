import 'package:flutter/material.dart';
import 'package:harrypotter/models/character.dart';

class HogwartsData extends ChangeNotifier{
  List<Character> characters = [
    Character(
      id: 1,
        name: "Harry Potter",
        url:
        "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest?cb=20160903184919",
        totalStars: 0,
        reviews: 0,
        strength: 8,
        magic: 10,
        speed: 9),
    Character(
        id: 2,
        name: "Hermione Granger",
        url:
        "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest?cb=20120729103114&path-prefix=es",
        totalStars: 0,
        reviews: 0,
        strength: 7,
        magic: 10,
        speed: 10),
    Character(
        id: 3,
        name: "Ron Weasley",
        url:
        "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/1000?cb=20150523213430",
        totalStars: 0,
        reviews: 0,
        strength: 6,
        magic: 5,
        speed: 7)
  ];
  void addReview(int id, int rating){
    Character char = characters.firstWhere((element) => element.id == id);
    char.addReview(rating);
    notifyListeners();
  }
  Character getCharacterFromId(int id) => characters.firstWhere((element) => element.id == id);
}
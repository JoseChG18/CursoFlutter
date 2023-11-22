import 'package:flutter/material.dart';
import 'package:harrypotter/provider_data/hogwarts_data.dart';
import 'package:provider/provider.dart';

import '../models/character.dart';
import '../widgets/rating_widget.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id});

  final int id;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {

  double lastValueClicked = 0;
  @override
  Widget build(BuildContext context) {
    //var imgWidth = MediaQuery.of(context).size.width / 2;
    return Consumer<HogwartsData>(
      builder: (context,data,child) {
        Character char = data.getCharacterFromId(widget.id);
        return Scaffold(
          appBar: AppBar(
            title: Text("${char.name} Details"),
            backgroundColor: Colors.deepPurple.shade200,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: char.name,
                child: Image.network(char.url,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating( value: char.stars,),
                  Text("${char.reviews} Reviews")
                ],
              ),
              Text(
                char.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              Rating( value: lastValueClicked, color: Colors.blue,
              onRating: (value){
                // numero de estrellas clicados.
                setState(() {
                  lastValueClicked = value.toDouble();
                  data.addReview(widget.id, value);
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.fitness_center),
                      const Text("Fuerza"),
                      Text(char.strength.toString())
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.auto_fix_normal),
                      const Text("Magia"),
                      Text(char.magic.toString())
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.speed),
                      const Text("Velocidad"),
                      Text("${char.speed}")
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}

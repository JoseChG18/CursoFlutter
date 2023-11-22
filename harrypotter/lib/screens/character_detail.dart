import 'package:flutter/material.dart';

import '../models/character.dart';
import '../widgets/rating_widget.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {

  double lastValueClicked = 0;
  @override
  Widget build(BuildContext context) {
    //var imgWidth = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.character.name} Details"),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: widget.character.name,
            child: Image.network(widget.character.url,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Rating( value: widget.character.stars,),
              Text("${widget.character.reviews} Reviews")
            ],
          ),
          Text(
            widget.character.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Rating( value: lastValueClicked, color: Colors.blue,
          onRating: (value){
            // numero de estrellas clicados.
            setState(() {
              lastValueClicked = value.toDouble();
              widget.character.addReview(value);
            });
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Icon(Icons.fitness_center),
                  const Text("Fuerza"),
                  Text(widget.character.strength.toString())
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.auto_fix_normal),
                  const Text("Magia"),
                  Text(widget.character.magic.toString())
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.speed),
                  const Text("Velocidad"),
                  Text("${widget.character.speed}")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

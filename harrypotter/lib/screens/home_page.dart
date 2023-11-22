import 'package:flutter/material.dart';
import 'package:harrypotter/provider_data/hogwarts_data.dart';
import 'package:harrypotter/screens/character_detail.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Hogwarts'),
          backgroundColor: Colors.deepPurple.shade200,
        ),
        body: Consumer<HogwartsData>(
          builder: (context, data, child) {
            return ListView(
              children: [
                for (var character in data.characters)
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
                                    CharacterDetail(id: character.id)));
                      },
                    ),
                  )
              ],
            );
          }
        ));
  }
}

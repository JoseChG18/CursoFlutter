import 'package:actividad_4_api/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Random User"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (user == null)
              const Text("Busca un usuario.")
            else
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'appBar',
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                      user!.picture.large,
                      ),
                    ),
                  ),
                ),
                Text("${user!.name.first} ${user!.name.last}"),
                Text(user!.gender),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await http.get(Uri.parse("https://randomuser.me/api"));
          final result = resultFromJson(response.body);
          user =  result.users[0];
          setState(() {});
        },
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:codigos_postales/models/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  var data = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Codigos Postales"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 24),
                onSubmitted: (text) async{
                  data = "Obteniendo Datos...";
                  var response = await http.get(Uri.parse("https://api.zippopotam.us/es/$text"));
                  if(response.statusCode != 200){
                    data = null;
                  }else {
                    final place = placeFromJson(response.body);
                    data = place.places.first.placeName;
                  }

                  setState((){});
                },
              ),
            ),
            Text(data)
          ],
        ),
      )
    );
  }
}

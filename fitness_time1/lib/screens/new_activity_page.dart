import 'package:fitness_time/models/activity.dart';
import 'package:fitness_time/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewActivityPage extends StatefulWidget {
  const NewActivityPage({super.key});

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {

  TextEditingController distanceController = TextEditingController();
  bool _isButtonDisabled = true;
  String activityName= '';
  bool _isActiveWalk = false;
  bool _isActiveRun = false;
  bool _isActiveBike = false;
  @override
  void initState() {
    super.initState();
    distanceController.addListener(() {
      setState(() {
        if(activityName != '' && distanceController.text != ''){
          _isButtonDisabled = false;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva Actividad"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    style: _isActiveWalk ? IconButton.styleFrom(backgroundColor: AppStyles.heliotrope): null,
                    onPressed: () {
                      setState(() {
                        activityName = 'Caminar';
                        _isActiveWalk = true;

                        _isActiveRun = false;
                        _isActiveBike = false;
                        if(distanceController.text != ''){
                          _isButtonDisabled = false;
                        }
                      });
                    },
                    icon: const Column(children: [
                      Text("Caminar"),
                      Icon(Icons.directions_walk)
                    ]),
                  ),
                  IconButton(
                      style: _isActiveRun ? IconButton.styleFrom(backgroundColor: AppStyles.heliotrope): null,
                      onPressed: () {
                        setState(() {
                          activityName = 'Correr';
                          _isActiveRun = true;

                          _isActiveWalk = false;
                          _isActiveBike = false;
                          if(distanceController.text != ''){
                            _isButtonDisabled = false;
                          }
                        });
                      },
                      icon: const Column(children: [
                        Text("Correr"),
                        Icon(Icons.directions_run)
                      ])),
                  IconButton(
                      style: _isActiveBike ? IconButton.styleFrom(backgroundColor: AppStyles.heliotrope): null,
                      onPressed: () {
                        setState(() {
                          activityName = 'Bicicleta';
                          _isActiveBike = true;

                          _isActiveWalk = false;
                          _isActiveRun = false;
                          if(distanceController.text != ''){
                            _isButtonDisabled = false;
                          }
                        });
                      },
                      icon: const Column(children: [
                        Text("Bicicleta"),
                        Icon(Icons.directions_bike)
                      ]))
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: distanceController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Distancia',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isButtonDisabled ? null : () {
                var activityType = activityName;
                var distance = distanceController.text;
                var activity = Activity(
                  type: activityType,
                  date: DateTime.now(),
                  distance: double.tryParse(distance) ?? 0,
                );
                Navigator.pop(
                  context,
                  activity,
                );
              } ,
              child: const Text("Añade Actividad"),
            )
          ],
        ),
      )

    );
  }
}

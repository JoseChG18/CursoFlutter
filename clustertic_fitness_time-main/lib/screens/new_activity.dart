import 'package:fitness_time/provider_data/activity_data.dart';
import 'package:fitness_time/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/activity.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({super.key, this.id});

  final String? id;

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  TextEditingController activityController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  int selectedItem = -1;
  Activity? activity;
  @override
  void initState() {
    super.initState();
    if(widget.id != null){
      ActivityData aData = Provider.of<ActivityData>(context,listen: false);
      activity = aData.getActivityFromId(widget.id);
      selectedItem = Activity.types.indexOf(activity!.type);
      distanceController.text = activity!.distance.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text((activity == null) ? "Nueva actividad" : "Edita actividad"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var activityType in Activity.types)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = Activity.types.indexOf(activityType);
                        });
                      },
                      child: Card(
                        color:
                            selectedItem == Activity.types.indexOf(activityType)
                                ? AppStyles.heliotrope
                                : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(activityType.iconData),
                              Text(activityType.description),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              const Align(
                  alignment: Alignment.centerLeft, child: Text("Distancia")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: distanceController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                      textAlign: TextAlign.center,
                      style: AppStyles.bigTitle,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        "Km",
                        style: AppStyles.bigTitle,
                      ),
                      SizedBox(
                        height: 11,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Consumer<ActivityData>(
                builder: (context,data,child) {
                  return ElevatedButton(
                    onPressed:
                        (selectedItem >= 0 && distanceController.text.isNotEmpty)
                            ? () {
                                var distance = distanceController.text;
                                if(widget.id != null){
                                  data.modifyActivity(widget.id, Activity.types[selectedItem], DateTime.now(), double.tryParse(distance) ?? 0);
                                } else {
                                  Activity activity = Activity(
                                    id: UniqueKey().toString(),
                                    type: Activity.types[selectedItem],
                                    date: DateTime.now(),
                                    distance: double.tryParse(distance) ?? 0,
                                  );
                                  data.addActivity(activity);
                                }
                                Navigator.pop(context);
                              }
                            : null,
                    child: Text((activity == null)
                        ? "Añade Actividad"
                        : "Guarda Actividad"),
                  );
                }
              )
            ],
          ),
        ));
  }
}

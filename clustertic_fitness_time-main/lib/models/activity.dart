import 'package:flutter/material.dart';

class Activity {
  final String id;
  static List<ActivityType> types = [
    ActivityType.walk,
    ActivityType.run,
    ActivityType.bike
  ];
  ActivityType type;
  DateTime date;
  double distance;

  Activity({
    required this.id,
    required this.type,
    required this.date,
    required this.distance,
  });
}

enum ActivityType {
  walk("Caminar", Icons.directions_walk),
  run("Correr", Icons.directions_run),
  bike("Bicicleta", Icons.directions_bike);

  final String description;
  final IconData iconData;

  const ActivityType(this.description, this.iconData);
}

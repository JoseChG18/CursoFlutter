import 'package:fitness_time/models/activity.dart';
import 'package:fitness_time/screens/profile_page.dart';
import 'package:fitness_time/styles/app_style.dart';
import 'package:fitness_time/widgets/activity_card.dart';
import 'package:fitness_time/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

import 'new_activity_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> listActivities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
          title: const Text("Fitness Time"),
          actions: [
            Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Hero(
              tag: 'appBar',
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                icon: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/44.jpg",
                  ),
                )),
          ),
        ),
      ]),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Actividades",
              style: AppStyles.bigTitle,
            ),
            if (listActivities.isEmpty)
              const Padding(
                padding: EdgeInsets.all(80),
                child: Column(
                  children: [
                    Icon(
                      Icons.run_circle_outlined,
                      size: 120,
                      color: Colors.black45,
                    ),
                    Text(
                      "No hay actividades. Pulsa + para añadir una.",
                      textAlign: TextAlign.center,
                      style: AppStyles.subTitle,
                    )
                  ],
                ),
              ),
            for (var activity in listActivities)
              Dismissible(
                onDismissed: (direction) {
                  listActivities.remove(activity);
                },
                key: UniqueKey(),
                child: ActivityCard(
                    type: activity.type,
                    date: activity.date,
                    distance: activity.distance,
                    icon: Icons.run_circle_outlined),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var activity = await Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const NewActivityPage()));
          listActivities.add(activity);
          setState(() {});
        },
        tooltip: 'New Activity',
        elevation: 6,
        backgroundColor: Colors.cyan.shade100,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

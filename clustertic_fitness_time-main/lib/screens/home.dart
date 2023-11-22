import 'package:fitness_time/provider_data/activity_data.dart';
import 'package:fitness_time/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/activity.dart';
import '../styles/app_style.dart';
import '../widgets/activity_card.dart';
import 'new_activity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyles.persianPink,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/44.jpg"),
                  ),
                  Text("Antònia Font"),
                ],
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const ProfilePage()));
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Fitness Time 1.0.0",
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Fitness Time"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const ProfilePage()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Hero(
                tag: "profile",
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/44.jpg"),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ActivityData>(
          builder: (context, data, child) {
            List<Activity> activities = data.getAllActivities();
            return Column(
              children: [
                const Text(
                  "Actividades",
                  style: AppStyles.bigTitle,
                ),
                if (activities.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(80.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.run_circle_outlined,
                          size: 120,
                          color: Colors.black45,
                        ),
                        Text(
                          "No hay actividades. Pulsa + per añadir una.",
                          style: AppStyles.subTitle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                for (var activity in activities)
                  Dismissible(
                    key: UniqueKey(),
                    child: InkWell(
                      onTap: ()  {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ActivityDetail(id: activity.id)));
                        /*if (returnedActivity is Activity) {
                          var index = activities.indexOf(activity);
                          activities[index] = returnedActivity;
                          setState(() {});
                        }*/
                      },
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.edit),
                                  title: const Text("Editar actividad"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ActivityDetail(id: activity.id)));
                                    /*if (returnedActivity is Activity) {
                                      var index = activities.indexOf(activity);as
                                      activities[index] = returnedActivity;
                                      setState(() {});
                                    }*/
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.delete),
                                  title: const Text("Eliminar actividad"),
                                  onTap: () {
                                    Navigator.pop(context);
                                    activities.remove(activity);
                                    setState(() {});
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ActivityCard(activity: activity),
                    ),
                    onDismissed: (_) {
                      activities.remove(activity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Actividad ${activity.type} eliminada"),
                        ),
                      );
                    },
                  ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: Consumer<ActivityData>(
        builder: (context, data, child) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityDetail(id: null)));
              setState(() {});
            },
            child: const Icon(Icons.add),
          );
        }
      ),
    );
  }
}

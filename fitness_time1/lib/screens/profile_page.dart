import 'package:fitness_time/styles/app_style.dart';
import 'package:fitness_time/widgets/data_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int heightValue = 150;
  int weigthValue = 55;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Hero(
                tag: 'appBar',
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/44.jpg",
                  ),
                ),
              ),
            ),
            const Text("Antònia Font",
              style: AppStyles.bigTitle,),
            const Text("registered 20 April 2023",
              style: AppStyles.subTitle,),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DataCard(
                    icon: Icons.access_alarm,
                    titleLabel: "Time",
                    descLabel: "2h 45'"),
                DataCard(
                    icon: Icons.place, titleLabel: "Km", descLabel: "212,4"),
                DataCard(
                    icon: Icons.directions_run,
                    titleLabel: "Activities",
                    descLabel: "42"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Height"),
                Slider(
                    activeColor: AppStyles.heliotrope,
                    min: 140,
                    max: 210,
                    value: heightValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      heightValue = value.toInt();
                    });
                  }),
                Text("$heightValue cm"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Weight"),
                Slider(
                  min: 40,
                  max: 120,
                  value: weigthValue.toDouble(),
                  activeColor: AppStyles.heliotrope,
                  onChanged: (value) {
                    setState(() {
                      weigthValue = value.toInt();
                    });
                  },
                ),
                Text("$weigthValue kg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
*/

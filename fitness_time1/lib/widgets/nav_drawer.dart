import 'package:fitness_time/styles/app_style.dart';
import 'package:flutter/material.dart';

import '../screens/profile_page.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text("Menú"), tileColor: AppStyles.persianPink),
          //DrawerHeader(child: Text("Menú"),decoration: BoxDecoration(color: AppStyles.persianPink,),),
          const ListTile(title: Text("Home"),),
          ListTile(title: const Text("Profile"), onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfilePage()));
          },)
        ],
      ),
    );
  }
}

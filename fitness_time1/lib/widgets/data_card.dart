import 'package:flutter/material.dart';

import '../styles/app_style.dart';

class DataCard extends StatelessWidget {
  const DataCard(
      {super.key,
      required this.icon,
      required this.titleLabel,
      required this.descLabel});

  final IconData icon;
  final String titleLabel, descLabel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppStyles.heliotrope,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Icon(icon),
          Text(titleLabel),
          Text(
            descLabel,
            style: AppStyles.dataText,
          )
        ]),
      ),
    );
  }
}

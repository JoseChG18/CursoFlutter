import 'package:fitness_time/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.type, required this.date, required this.distance, required this.icon});

  final String type;
  final DateTime date;
  final double distance;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd MMM yyyy - HH:mm');
    final String formattedDate = formatter.format(date);

    return Card(
      child: Row(
        children: [
          /*GestureDetector(
            onLongPress: () {
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.run_circle_outlined,
              size: 32,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: AppStyles.dataText,
              ),
              Text(formattedDate),
            ],
          ),
          const Spacer(),
          Text(
            "$distance km",
            style: AppStyles.dataText,
          ),
        ],
      ),
    );
  }
}

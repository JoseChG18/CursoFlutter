import 'package:fitness_time/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityData extends ChangeNotifier{
  List<Activity> activities = [];

  void addActivity(Activity activity){
    activities.add(activity);
    notifyListeners();
  }

  List<Activity> getAllActivities(){
    return activities;
  }

  void modifyActivity(String? id, ActivityType type, DateTime date, double distance){
    Activity act = activities.firstWhere((element) => element.id == id);
    act.distance =distance;
    act.type = type;
    act.date = date;
    notifyListeners();
  }

  Activity getActivityFromId(String? id) => activities.firstWhere((element) => element.id == id);

  void deleteActivityFromId(String? id) {
    activities.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
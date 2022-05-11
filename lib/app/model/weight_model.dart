import 'dart:core';

import 'parent/model.dart';

class Weight extends Model {
  String? id;
  String? weight;
  String? time;

  Weight({required this.weight, required this.time, this.id});

  Weight.fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
    weight = stringFromJson(json, 'weight');
    time = stringFromJson(json, 'time');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['weight'] = this.weight;
    data['time'] = this.time;
    return data;
  }
}

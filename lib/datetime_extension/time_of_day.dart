import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addHour({int additionalHour = 0}) {
    int hourAdded= this.hour+additionalHour;
    print(this.minute);
    return this.replacing(hour: hourAdded, minute: this.minute);
  }
}
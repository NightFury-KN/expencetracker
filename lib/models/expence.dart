import 'package:flutter/foundation.dart';

int _idCounter = 0;

String generateSimpleId() {
  return 'id_xx${_idCounter++}';
}
enum Cat {
  food,
  transport,
  entertainment,
  fitness,
  other,

}


class Expence {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Cat category;

  Expence(
    {
      required this.title,
      required this.amount,
      required this.date,
      required this.category,

    }
  ): id = generateSimpleId();
}
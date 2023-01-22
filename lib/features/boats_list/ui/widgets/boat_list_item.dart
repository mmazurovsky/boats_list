import 'package:flutter/material.dart';

class BoatListItem extends StatelessWidget {
  final Map<String, String> boat;
  const BoatListItem({
    required Key key,
    required this.boat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = boat['name']!;
    final model = boat['model']!;
    final capacity = boat['capacity']!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade100,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: $name'),
          const SizedBox(height: 5),
          Text('Model: $model'),
          const SizedBox(height: 5),
          Text('Capacity: $capacity'),
        ],
      ),
    );
  }
}

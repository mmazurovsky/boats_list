import 'package:boats_list/features/boats_list/state/boat_list_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoatTextInputRow extends StatelessWidget {
  const BoatTextInputRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Name', border: OutlineInputBorder()),
          controller: context.read<BoatListChangeNotifier>().nameController,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: const InputDecoration(
              labelText: 'Model', border: OutlineInputBorder()),
          controller: context.read<BoatListChangeNotifier>().modelController,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Capacity',
            border: OutlineInputBorder(),
          ),
          controller: context.read<BoatListChangeNotifier>().capacityController,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}

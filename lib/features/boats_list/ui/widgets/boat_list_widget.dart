import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/boat_list_change_notifier.dart';
import '../styling/text_styles.dart';
import 'boat_list_item.dart';

class BoatListWidget extends StatelessWidget {
  const BoatListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boatList = context.watch<BoatListChangeNotifier>().boatList;
    final boatListIsEmpty = boatList.isEmpty;

    return boatListIsEmpty
        ? const Text(
            'Boat list is empty',
            style: tsBold17Black,
          )
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return BoatListItem(
                key: ValueKey(boatList[index]['id']!),
                boat: boatList[index],
              );
            },
            itemCount: boatList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 5),
          );
  }
}

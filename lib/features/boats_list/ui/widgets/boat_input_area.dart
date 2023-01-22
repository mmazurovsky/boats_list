import 'package:boats_list/features/boats_list/state/boat_list_change_notifier.dart';
import 'package:boats_list/features/boats_list/ui/styling/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'boat_text_input_row.dart';
import '../../../../common/widgets/buttons.dart';
import '../../../../common/widgets/custom_padding.dart';

class BoatInputArea extends StatelessWidget {
  const BoatInputArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomPadding(
          child: Text(
            'Add Boat',
            style: tsBold20Accent,
          ),
        ),
        const SizedBox(height: 10),
        const CustomPadding(
          child: BoatTextInputRow(),
        ),
        const SizedBox(height: 10),
        CustomPadding(
          child: BigButton(
            onTap: context.read<BoatListChangeNotifier>().addNewBoat,
            title: 'Add Boat',
          ),
        ),
      ],
    );
  }
}

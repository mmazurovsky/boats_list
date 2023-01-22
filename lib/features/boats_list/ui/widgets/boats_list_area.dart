import 'package:boats_list/features/boats_list/ui/styling/text_styles.dart';
import 'package:boats_list/common/widgets/custom_padding.dart';
import 'package:boats_list/features/signature/ui/signature_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/boat_list_change_notifier.dart';
import 'boat_list_widget.dart';
import '../../../../common/widgets/buttons.dart';

class BoatsListArea extends StatelessWidget {
  const BoatsListArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boatListIsEmpty =
        context.watch<BoatListChangeNotifier>().boatList.isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Boat list',
                style: tsBold20Accent,
              ),
              if (!boatListIsEmpty)
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActionButton(
                          color: Colors.red,
                          onTap:
                              context.read<BoatListChangeNotifier>().clearList,
                          title: 'Clear list',
                        ),
                        ActionButton(
                          color: Colors.green,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider.value(
                                value: context.read<BoatListChangeNotifier>(),
                                child: const SignaturePage(),
                              ),
                            ),
                          ),
                          title: 'Submit',
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Expanded(
          child: CustomPadding(
            child: BoatListWidget(),
          ),
        ),
      ],
    );
  }
}

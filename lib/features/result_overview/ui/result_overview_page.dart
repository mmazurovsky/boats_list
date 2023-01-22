import 'package:boats_list/features/boats_list/state/boat_list_change_notifier.dart';
import 'package:boats_list/features/boats_list/ui/styling/text_styles.dart';
import 'package:boats_list/common/widgets/buttons.dart';
import 'package:boats_list/common/widgets/custom_padding.dart';
import 'package:boats_list/features/signature/state/signature_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../boats_list/ui/widgets/boat_list_widget.dart';

class ResultOverviewPage extends StatelessWidget {
  const ResultOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signature = context.read<SignatureChangeNotifier>().signature!;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Text(
            'List submitted!',
            style: tsBold17Black,
          ),
          const SizedBox(height: 10),
          Image.memory(
            signature,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: CustomPadding(
              child: BoatListWidget(),
            ),
          ),
          const SizedBox(height: 10),
          CustomPadding(
            child: BigButton(
              onTap: () {
                context.read<BoatListChangeNotifier>().clearList();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              title: 'Create another list',
            ),
          )
        ]),
      ),
    );
  }
}

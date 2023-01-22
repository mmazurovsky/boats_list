import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/boat_list_change_notifier.dart';
import 'widgets/boat_input_area.dart';
import 'widgets/boats_list_area.dart';

class BoatsListPage extends StatelessWidget {
  const BoatsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BoatListChangeNotifier(),
      builder: (context, _) {
        return const BoatsListPageContent();
      },
    );
  }
}

class BoatsListPageContent extends StatelessWidget {
  const BoatsListPageContent({Key? key}) : super(key: key);

  void _displayMessageHandler(BuildContext context) {
    final messageToDisplay =
        context.watch<BoatListChangeNotifier>().messageToDisplay;
    if (messageToDisplay != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(messageToDisplay.snackBar);
        context.read<BoatListChangeNotifier>().clearMessage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _displayMessageHandler(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BoatInputArea(),
            SizedBox(height: 20),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(height: 20),
            Expanded(
              child: BoatsListArea(),
            ),
          ],
        ),
      ),
    );
  }
}

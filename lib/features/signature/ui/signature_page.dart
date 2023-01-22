import 'package:boats_list/features/result_overview/ui/result_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import '../../../common/widgets/snack_bar.dart';
import '../../boats_list/state/boat_list_change_notifier.dart';
import '../../boats_list/ui/styling/text_styles.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_padding.dart';
import '../state/signature_change_notifier.dart';

class SignaturePage extends StatelessWidget {
  const SignaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignatureChangeNotifier(),
      builder: (context, _) {
        return const SignaturePageContent();
      },
    );
  }
}

class SignaturePageContent extends StatelessWidget {
  const SignaturePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add your signature',
          style: tsBold17,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Signature(
                controller: context.read<SignatureChangeNotifier>().controller,
                backgroundColor: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPadding(
                  child: ActionButton(
                    title: 'Clear signature',
                    color: Colors.blue,
                    onTap:
                        context.read<SignatureChangeNotifier>().clearSignature,
                  ),
                ),
                const SizedBox(height: 10),
                CustomPadding(
                  child: BigButton(
                    onTap: () async {
                      final response = await context
                          .read<SignatureChangeNotifier>()
                          .saveSignature();
                      if (response) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MultiProvider(
                              providers: [
                                ChangeNotifierProvider.value(
                                  value: context.read<BoatListChangeNotifier>(),
                                ),
                                ChangeNotifierProvider.value(
                                  value:
                                      context.read<SignatureChangeNotifier>(),
                                ),
                              ],
                              child: const ResultOverviewPage(),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            ErrorSnackBar(message: 'Add your signature'),
                          );
                      }
                    },
                    title: 'Save signature',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:signature/signature.dart';

class SignatureChangeNotifier with ChangeNotifier {
  final SignatureController _controller = SignatureController();
  Uint8List? _signature;

  SignatureController get controller => _controller;
  Uint8List? get signature => _signature;

  Future<bool> saveSignature() async {
    final signature = await _controller.toPngBytes();
    if (signature == null) {
      return false;
    } else {
      _signature = signature;
      return true;
    }
  }

  void clearSignature() {
    _signature = null;
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

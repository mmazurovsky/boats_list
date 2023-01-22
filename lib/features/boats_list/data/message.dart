import '../../../common/widgets/snack_bar.dart';

abstract class Displayable {
  String get displayMessage;
  CustomSnackBar get snackBar;
}

class CustomError implements Displayable {
  @override
  final String displayMessage;
  CustomError(this.displayMessage);

  @override
  CustomSnackBar get snackBar => ErrorSnackBar(message: displayMessage);
}

class DisplayMessage implements Displayable {
  @override
  final String displayMessage;
  DisplayMessage(this.displayMessage);

  @override
  CustomSnackBar get snackBar => MessageSnackBar(message: displayMessage);
}

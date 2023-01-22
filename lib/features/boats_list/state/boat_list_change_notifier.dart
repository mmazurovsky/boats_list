import 'package:flutter/material.dart';

import '../data/message.dart';

class BoatListChangeNotifier with ChangeNotifier {
  final List<Map<String, String>> _boatList = [];
  Displayable? _messageToDisplay;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();

  List<Map<String, String>> get boatList => _boatList;
  Displayable? get messageToDisplay => _messageToDisplay;

  TextEditingController get nameController => _nameController;
  TextEditingController get modelController => _modelController;
  TextEditingController get capacityController => _capacityController;

  void addNewBoat() {
    final name = _nameController.text;
    final model = _modelController.text;
    final capacity = _capacityController.text;
    final boatId = '$name$model$capacity';

    CustomError? errorToDisplay;

    if (name.isEmpty) {
      errorToDisplay = CustomError('Name should not be empty');
    } else if (model.isEmpty) {
      errorToDisplay = CustomError('Model should not be empty');
    } else if (capacity.isEmpty) {
      errorToDisplay = CustomError('Capacity should not be empty');
    }

    final isThereBoatWithSameId =
        _boatList.where((element) => element['id'] == boatId);
    if (isThereBoatWithSameId.isNotEmpty) {
      errorToDisplay = CustomError('This boat is already in the list');
    }

    final capacityAsInt = int.tryParse(capacity);
    if (capacityAsInt == null) {
      errorToDisplay = CustomError('Capacity should be a number');
    }

    if (errorToDisplay != null) {
      _displayMessage(errorToDisplay);
    } else {
      final newBoat = {
        'id': boatId,
        'name': name,
        'model': model,
        'capacity': capacity,
      };

      _boatList.insert(0, newBoat);
      _nameController.clear();
      _modelController.clear();
      _capacityController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      notifyListeners();
    }
  }

  void _displayMessage(Displayable displayable) {
    _messageToDisplay = displayable;
    notifyListeners();
  }

  void clearMessage() {
    _messageToDisplay = null;
    notifyListeners();
  }

  void clearList() {
    _boatList.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _modelController.dispose();
    _capacityController.dispose();
    super.dispose();
  }
}

import 'package:chat_app_flutter2022/model/user.dart';
import 'package:flutter/cupertino.dart';

class GroupUsers extends ChangeNotifier {
  List<UserData> _selectedContacts = [];

  List<UserData> get selectedContacts => _selectedContacts;

  set setSelectedContacts(List<UserData> value) {
    _selectedContacts = value;
    notifyListeners();
  }

  void addTOList(UserData user) {
    if (!_selectedContacts.any((element) => element.uid == user.uid)) {
      _selectedContacts.add(user);
      notifyListeners();
    }
  }

  void removeFromList(UserData user) {
    _selectedContacts.removeWhere((element) => element.uid == user.uid);
    notifyListeners();
  }
}

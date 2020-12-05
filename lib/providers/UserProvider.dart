import 'package:flutter/foundation.dart';
import 'package:popi/models/Compte.dart';


class UserProvider with ChangeNotifier {
  Compte _user = new Compte();

  Compte get user => _user;

  void setUser(Compte user) {
    _user = user;
    notifyListeners();
  }

  void removeUser(){
    _user = null;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class UserPrefernceModel extends ChangeNotifier {
  bool isMember = false;
  bool isAllYouCanEat = false;
  int noodleType = 0;
  String _choosecard = '';
  String _choosecard2 = '';

  bool get getIsMember => this.isMember;
  set setIsMember(bool isMember) {
    this.isMember = isMember;
    notifyListeners();
  }

  get getIsAllYouCanEat => this.isAllYouCanEat;
  set setIsAllYouCanEat(isAllYouCanEat) {
    this.isAllYouCanEat = isAllYouCanEat;
    notifyListeners();
  }

  get getNoodleType => this.noodleType;
  set setNoodleType(noodleType) {
    this.noodleType = noodleType;
    notifyListeners();
  }

  get choosecard => this._choosecard;
  set choosecard(value) {
    this._choosecard = value;
    notifyListeners();
  }

  get choosecard2 => this._choosecard2;
  set choosecard2(value) {
    this._choosecard2 = value;
    notifyListeners();
  }
}

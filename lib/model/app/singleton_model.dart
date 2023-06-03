import 'package:e_commerce_apps/model/app/home/selected_item_model.dart';
import 'package:e_commerce_apps/model/user_model.dart';
import 'package:flutter/material.dart';

class SingletonModel {
  static final SingletonModel _singleton = SingletonModel._internal();

  factory SingletonModel() {
    return _singleton;
  }

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context) {
    _singleton.context = context;
    return _singleton;
  }

  static SingletonModel get shared => _singleton;

  bool isLogin;
  UserModel user;
  User userModel;
  int id;
  String onindoToken;
  BuildContext context;
  List<SelectedItemModel> item;
}

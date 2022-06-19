import 'dart:async';

import 'package:e_commerce_apps/api/session_manager.dart';
import 'package:e_commerce_apps/common/constans.dart';
import 'package:e_commerce_apps/model/app/singleton_model.dart';
import 'package:e_commerce_apps/page/home/home_page.dart';
import 'package:e_commerce_apps/page/main_page.dart';
import 'package:e_commerce_apps/page/onboard_page.dart';
import 'package:e_commerce_apps/tool/permissions_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _controller;
  SingletonModel _model;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    _model = SingletonModel.withContext(context);
    _checkPermission();
    _cekSession();
  }

  void _checkPermission() async {
    await PermissionService.permissionGranted();
    _checkData();
  }

  void _checkData() {
    _model.item = [];
    _model.isLogin = false;
    _model.user.data.users = [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future _cekSession() async {
    return Future.delayed(const Duration(milliseconds: 5900), () {
      session.getSession().then((value) {
        if (value != null) {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => MainPage()), (
              route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => OnBoardPage()), (
              route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            kImgLogo,
            width: 200,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: LinearProgressIndicator(
              color: Colors.amber,
              backgroundColor: Colors.amberAccent,
              value: _controller.value,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:e_commerce_apps/common/styles/theme.dart';
import 'package:e_commerce_apps/dialog/exit_dialog.dart';
import 'package:e_commerce_apps/model/app/singleton_model.dart';
import 'package:e_commerce_apps/page/cart/cart_page.dart';
import 'package:e_commerce_apps/page/home/home_page.dart';
import 'package:e_commerce_apps/page/profile/profile_page.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int page;

  MainPage({this.page = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  SingletonModel _model;
  int _page;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _model = SingletonModel.withContext(context);
    _page = widget.page;
  }

  Future<bool> _onWillPop() async {
    if (_page > 0) {
      setState(() {
        _page = 0;
      });
      return Future(() => false);
    } else {
      bool exit = await openExitDialog(context) ?? false;
      if (exit) {
        setState(() {
          exit = true;
        });
      }
      return Future(() => exit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildBody(_page),
        bottomSheet: _buildBottomNavbar(),
      ),
      onWillPop: _onWillPop,
    );
  }

  Widget _buildBody(int page) {
    return [
      const HomePage(),
      const ProfilePage(),
      const CartPage(),
    ].toList()[_page];
  }

  Widget _buildBottomNavbar() {
    return Theme(
      data: tdMain(context).copyWith(),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: (i) => setState(() {
          _page = i;
        }),
        elevation: 0.0,
        selectedItemColor: HexColor("#5956E9"),
        unselectedItemColor: Colors.grey,
        backgroundColor: HexColor("#F2F2F2"),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _page == 0 ? Icons.home : Icons.home_outlined,
              size: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 1 ? Icons.person : Icons.person_outlined,
              size: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _page == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
              size: 25,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

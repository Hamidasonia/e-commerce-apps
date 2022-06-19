import 'package:e_commerce_apps/common/constans.dart';
import 'package:e_commerce_apps/page/auth/login_page.dart';
import 'package:e_commerce_apps/tool/helper.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  Helper _helper;

  @override
  void initState() {
    super.initState();
    _helper = Helper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EF5DA8"),
      body: Stack(
        children: [
          Positioned(
            bottom: 70,
            child: Image.asset(
              kImgAssetOnBoard,
              width: 360,
            ),
          ),
          _buildBody()
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Lock your Gadget",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            Image.asset(
              kImgLogo,
            ),
            const Spacer(),
            Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: MaterialButton(
                minWidth: 300,
                onPressed: () {
                  _helper.jumpToPage(
                    context,
                    page: const LoginPage(),
                  );
                },
                child: Text(
                  "Get started",
                  style: TextStyle(fontSize: 16, color: HexColor("#5956E9")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_apps/main.dart';
import 'package:e_commerce_apps/page/main_page.dart';
import 'package:e_commerce_apps/tool/helper.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:e_commerce_apps/tool/multi_vertical_drag_gesture_recognizer.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey;
  Helper _helper;
  ScrollController _cScroll;
  GlobalKey<FormState> _formKey;
  TextEditingController _cEmail;
  TextEditingController _cPassword;
  bool _obscureText;
  bool _processLogin;
  double _position;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
    _helper = Helper();
    _formKey = GlobalKey();
    _cEmail = TextEditingController();
    _cPassword = TextEditingController();
    _obscureText = false;
    _processLogin = false;
    _cScroll = ScrollController();
    _position = 0;
    _initPosition();
  }

  void _initPosition() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (_cScroll.hasClients) {
      _cScroll.animateTo(350.0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      _initPosition();
    }
  }

  Map<Type, GestureRecognizerFactory> _gestures() {
    return {
      MultiVerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<
          MultiVerticalDragGestureRecognizer>(
        () => MultiVerticalDragGestureRecognizer(),
        _initializer,
      ),
    };
  }

  void _initializer(MultiVerticalDragGestureRecognizer instance) {
    bool close = false;
    instance.onUpdate = (DragUpdateDetails detail) {
      print(detail.globalPosition.dy);
      close =
          detail.globalPosition.dy >= MediaQuery.of(context).size.height * .6;
    };
    instance.onEnd = (DragEndDetails detail) {
      if (close) {
        Navigator.pop(context);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: _gestures(),
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    MediaQueryData q = MediaQuery.of(context);
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return;
      },
      child: CustomScrollView(
        controller: _cScroll,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: q.size.height * .8,
            elevation: 0.0,
            floating: false,
            pinned: true,
            snap: false,
            collapsedHeight: 100,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constrain) {
                _position = constrain.biggest.height;
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: HexColor("#EF5DA8"),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 65),
                        child: const Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Container(
                            width: 100.0,
                            height: 2.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _contentAuth(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _contentAuth() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 30,
      ),
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: HexColor("#868686"),
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                "Email",
                style: TextStyle(color: HexColor("#868686")),
              )
            ],
          ),
          TextFormField(
            controller: _cEmail,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Please input your email",
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.lock_outline,
                color: HexColor("#868686"),
                size: 20,
              ),
              const SizedBox(width: 5),
              Text(
                "Password",
                style: TextStyle(color: HexColor("#868686")),
              )
            ],
          ),
          TextFormField(
            controller: _cPassword,
            obscureText: !_obscureText,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Please input your password",
              hintStyle: TextStyle(color: Colors.grey[500]),
              suffix: InkWell(
                child: Text(_obscureText ? "Hide" : "Show"),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              suffixStyle: TextStyle(
                color: HexColor("#5956E9"),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Forgot password?",
            style: TextStyle(
              color: HexColor("#5956E9"),
            ),
          ),
          const SizedBox(height: 50),
          Material(
            clipBehavior: Clip.antiAlias,
            color: HexColor("#EF5DA8"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: MaterialButton(
              minWidth: 300,
              height: 60,
              onPressed: () {
                _helper.moveToPage(context, page: MainPage());
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Create account",
              style: TextStyle(color: HexColor("#5956E9"), fontSize: 16),
            ),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

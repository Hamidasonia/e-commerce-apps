import 'package:e_commerce_apps/common/constans/general.dart';
import 'package:e_commerce_apps/tool/helper.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      key: _scaffoldKey,
      body: _buildBody(),
      appBar: PreferredSize(
        preferredSize: const Size(200, 100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              const Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Yusuf Nizam",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "yusufnizam@gmail.com",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Semarang, Indonesia",
                        style: TextStyle(
                          color: HexColor("#5956E9"),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 30)
                    ],
                  ),
                ),
                Positioned(
                  left: Constants.padding,
                  right: Constants.padding,
                  top: Constants.padding,
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage("assets/images/img_profile.jpg"),
                            fit: BoxFit.contain)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildCard(text: "Edit Text"),
            _buildCard(text: "Shoping Address"),
            _buildCard(text: "Order History"),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({String text}) {
    return InkWell(
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
      onTap: (){
        Helper().showToast("Coming Soon");
      },
    );
  }
}

import 'package:e_commerce_apps/model/app/home/wearable_model.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';

class DetailHomePage extends StatefulWidget {
  final WearableModel data;

  DetailHomePage({@required this.data});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          color: Colors.white,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
            color: HexColor("#F6F6F9"),
            image: DecorationImage(
              image: AssetImage(widget.data.image),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 25,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding:
                const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 20),
            width: width,
            height: MediaQuery.of(context).size.height * .55,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.name + " " + widget.data.version,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

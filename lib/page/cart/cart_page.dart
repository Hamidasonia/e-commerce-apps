import 'package:e_commerce_apps/model/app/singleton_model.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  SingletonModel _model;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
    _model = SingletonModel.withContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F2F2F2"),
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size(100, 50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                const Text(
                  "Basket",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    Size s = MediaQuery.of(context).size;
    int jumlah = 0;
    _model.item.forEach((element) {
      jumlah += element.jumlahItem;
    });
    int cost = 0;
    _model.item.forEach((element) {
      cost += element.items.price * element.jumlahItem;
    });
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _model.item.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 16, bottom: 16),
                  height: 130,
                  width: s.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(_model.item[index].items.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: s.width * .4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _model.item[index].items.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money_outlined,
                                  color: HexColor("#5956E9"),
                                  size: 18,
                                ),
                                Text(
                                  "${cost}",
                                  style: TextStyle(
                                    color: HexColor("#5956E9"),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

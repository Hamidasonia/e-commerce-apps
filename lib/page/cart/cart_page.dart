import 'package:e_commerce_apps/api/api.dart';
import 'package:e_commerce_apps/common/constans/general.dart';
import 'package:e_commerce_apps/model/app/order_model.dart';
import 'package:e_commerce_apps/model/app/singleton_model.dart';
import 'package:e_commerce_apps/tool/helper.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  SingletonModel _model;
  bool _isSubmit;
  String _tglOrder;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
    _model = SingletonModel.withContext(context);
    _isSubmit = false;
    _tglOrder = DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  Future<OrderModel> _checkout() async {
    try {
      setState(() {
        _isSubmit = true;
      });
      final MutationOptions options =
          MutationOptions(document: gql(QueryDatabase.checkout), variables: {
        'product': _model.item[0].items.name,
        'total_price': _model.item[0].items.price,
        'order_date': _tglOrder,
        'user_id': 1,
      });
      final QueryResult result =
          await QueryDatabase.client.value.mutate(options);
      printLog("${result.data} IKI LEK");
      if (result.data.isNotEmpty) {
        setState(() {
          _isSubmit = false;
          Helper().showToast("Success Checkout!");
        });
      } else {
        setState(() {
          _isSubmit = false;
          Helper().showToast("Checkout Failed!");
        });
      }
    } catch (e) {
      setState(() {
        _isSubmit = false;
        Helper().showToast(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#F2F2F2"),
        key: _scaffoldKey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(),
                    const Text(
                      "Basket",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _model.item.clear();
                        });
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        color: HexColor("#FA4A0C"),
                        size: 30,
                      ),
                    )
                  ],
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
    for (var element in _model.item) {
      jumlah += element.jumlahItem;
    }
    int cost = 0;
    for (var element in _model.item) {
      cost += element.items.price * element.jumlahItem;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ListView.builder(
              shrinkWrap: true,
              primary: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _model.item.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
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
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(_model.item[index].items.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: s.width * .4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _model.item[index].items.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money_outlined,
                                  color: HexColor("#5956E9"),
                                  size: 18,
                                ),
                                Text(
                                  "${_model.item[index].items.price}",
                                  style: TextStyle(
                                    color: HexColor("#5956E9"),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor("#EF5DA8"),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      // SelectedItemModel items = _model.item
                                      //     .where((element) =>
                                      // element.items.id == _model.item[index].id)
                                      //     .first;
                                      setState(() {
                                        if (_model.item[index].jumlahItem ==
                                            1) {
                                          _model.item.removeWhere((element) =>
                                              element.items.id ==
                                              _model.item[index].items.id);
                                        } else {
                                          _model.item
                                              .where((element) =>
                                                  element.items.id ==
                                                  _model.item[index].items.id)
                                              .first
                                              .jumlahItem--;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${_model.item.where((element) => element.items.id == _model.item[index].items.id).first.jumlahItem} Items",
                                  style: TextStyle(
                                    color: HexColor("#EF5DA8"),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: HexColor("#EF5DA8"),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      if (jumlah < 5) {
                                        setState(() {
                                          _model.item
                                              .where((element) =>
                                                  element.items.id ==
                                                  _model.item[index].items.id)
                                              .first
                                              .jumlahItem++;
                                        });
                                      } else {
                                        Helper().showToast(
                                            "Max 5 items can be added!");
                                      }
                                    },
                                    child: _model.item
                                                .where((element) =>
                                                    element.items.id ==
                                                    _model.item[index].items.id)
                                                .first
                                                .jumlahItem >
                                            4
                                        ? Container(width: 20)
                                        : const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
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
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Icon(
                  Icons.attach_money_outlined,
                  color: HexColor("#5956E9"),
                  size: 18,
                ),
                Text(
                  "$cost",
                  style: TextStyle(
                    color: HexColor("#5956E9"),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            clipBehavior: Clip.antiAlias,
            color: HexColor("#EF5DA8"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            child: MaterialButton(
              minWidth: double.infinity,
              onPressed: _checkout,
              child: _isSubmit
                  ? SpinKitThreeBounce(
                      color: Colors.black,
                      size: 24,
                    )
                  : const Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}

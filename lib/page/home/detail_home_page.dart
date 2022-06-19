import 'package:e_commerce_apps/model/app/home/item_model.dart';
import 'package:e_commerce_apps/model/app/home/selected_item_model.dart';
import 'package:e_commerce_apps/model/app/singleton_model.dart';
import 'package:e_commerce_apps/tool/helper.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';

class DetailHomePage extends StatefulWidget {
  final ItemModel data;

  const DetailHomePage({Key key, @required this.data}) : super(key: key);

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
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
      key: _scaffoldKey,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    int jumlah = 0;
    _model.item.forEach((d) {
      jumlah += d.jumlahItem;
    });
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
          ),
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Image.asset(widget.data.image),
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
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            width: width,
            height: MediaQuery.of(context).size.height * .55,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
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
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Colors",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: widget.data.colors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                  0,
                                  2,
                                ), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: widget.data.colors[index].colorCode,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.data.colors[index].colorName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 20);
                      },
                    ),
                  ),
                  Text(
                    widget.data.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.data.descriptions,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Full Description",
                        style: TextStyle(
                          color: HexColor("#5956E9"),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: HexColor("#5956E9"),
                        // size: 20,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
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
                            "${widget.data.price}",
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
                  const SizedBox(height: 20),
                  _model.item
                          .where(
                              (element) => element.items.id == widget.data.id)
                          .isEmpty
                      ? Material(
                          clipBehavior: Clip.antiAlias,
                          color: HexColor("#EF5DA8"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: () {
                              if (jumlah < 5) {
                                setState(() {
                                  _model.item.add(SelectedItemModel(
                                    items: widget.data,
                                    jumlahItem: 1,
                                  ));
                                });
                              } else {
                                Helper().showToast("Max 5 items can be added!");
                              }
                            },
                            child: const Text(
                              "Add to basket",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor("#EF5DA8"),
                              ),
                              child: InkWell(
                                onTap: () {
                                  SelectedItemModel items = _model.item
                                      .where((element) =>
                                          element.items.id == widget.data.id)
                                      .first;
                                  setState(() {
                                    if (items.jumlahItem == 1) {
                                      _model.item.removeWhere((element) =>
                                          element.items.id == widget.data.id);
                                    } else {
                                      _model.item
                                          .where((element) =>
                                              element.items.id ==
                                              widget.data.id)
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
                              "${_model.item.where((element) => element.items.id == widget.data.id).first.jumlahItem} Items",
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
                                              widget.data.id)
                                          .first
                                          .jumlahItem++;
                                    });
                                  } else {
                                    Helper()
                                        .showToast("Max 5 items can be added!");
                                  }
                                },
                                child: _model.item
                                            .where((element) =>
                                                element.items.id ==
                                                widget.data.id)
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
                        ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

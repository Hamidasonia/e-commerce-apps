import 'package:e_commerce_apps/common/constans.dart';
import 'package:e_commerce_apps/model/app/home/colors_model.dart';
import 'package:e_commerce_apps/model/app/home/item_model.dart';
import 'package:e_commerce_apps/model/app/singleton_model.dart';
import 'package:e_commerce_apps/page/home/detail_home_page.dart';
import 'package:e_commerce_apps/page/home/search_home_page.dart';
import 'package:e_commerce_apps/tool/helper.dart';
import 'package:e_commerce_apps/tool/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _index;
  Helper _helper;
  TextEditingController _textController;
  List<ItemModel> _data;
  List<ItemModel> _dataLaptop;
  List<ItemModel> _dataDrone;
  SingletonModel _model;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _index = 0;
    _helper = Helper();
    _textController = TextEditingController();
    _data = [
      ItemModel(
        id: 0,
        image: kImgAssetHome2,
        name: "Apple Watch",
        version: "Series 6 . Red",
        price: 359,
        colors: [
          ColorsModel(
            colorName: "Red",
            colorCode: HexColor("#eb3a34"),
          ),
          ColorsModel(
            colorName: "Black",
            colorCode: HexColor("#000000"),
          ),
          ColorsModel(
            colorName: "Green",
            colorCode: HexColor("#1dc471"),
          )
        ],
        title: "Get Apple Watch",
        descriptions:
            "Available discount for purchase this year. Let's update your device.",
      ),
      ItemModel(
        id: 1,
        image: kImgAssetHome3,
        name: "Samsung Galaxy Watch",
        version: "Active . Green",
        price: 159,
        colors: [
          ColorsModel(
            colorName: "Old Green",
            colorCode: HexColor("#385c4a"),
          ),
        ],
        title: "Get Samsung Galaxy Watch",
        descriptions:
            "Available discount for purchase this year. Let's update your device.",
      )
    ];
    _dataLaptop = [
      ItemModel(
        id: 3,
        image: kImgAssetAsus,
        name: "ASUS",
        version: "Vivobook . 14",
        price: 480,
        colors: [
          ColorsModel(
            colorName: "Grey",
            colorCode: HexColor("#cfd1d0"),
          ),
          ColorsModel(
            colorName: "Black",
            colorCode: HexColor("#000000"),
          ),
        ],
        title: "Get ASUS Vivobook 14",
        descriptions:
            "Available discount for purchase this year. Let's update your device.",
      ),
      ItemModel(
        id: 4,
        image: kImgAssetMacbook,
        name: "Macbook",
        version: "Pro . 2020",
        price: 961,
        colors: [
          ColorsModel(
            colorName: "Silver",
            colorCode: HexColor("#cfd1d0"),
          ),
        ],
        title: "Get Macbook Pro 2020",
        descriptions:
            "Available discount for purchase this year. Let's update your device.",
      ),
    ];
    _dataDrone = [
      ItemModel(
        id: 5,
        image: kImgAssetDrone,
        name: "Drone Dji",
        version: "Mini . 2",
        price: 343,
        colors: [
          ColorsModel(
            colorName: "White",
            colorCode: HexColor("#FFFFFF"),
          ),
          ColorsModel(
            colorName: "Black",
            colorCode: HexColor("000000"),
          )
        ],
        title: "Get Drone Dji",
        descriptions:
            "Available discount for purchase this year. Let's update your device.",
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F2F2F2"),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 30),
              child: Row(
                children: [
                  SvgPicture.asset(kIcHomeAsset),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _textController,
                      autofocus: false,
                      onTap: () {
                        setState(() {
                          _helper.jumpToPage(context,
                              page: const SearchHomePage());
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey[300],
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey[300],
                            width: 3,
                          ),
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order online\ncollect in store",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TabBar(
                  labelPadding: const EdgeInsets.only(left: 0, right: 16),
                  labelColor: HexColor("#5956E9"),
                  indicatorColor: HexColor("#5956E9"),
                  indicatorWeight: 3,
                  unselectedLabelColor: Colors.grey[400],
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controller,
                  isScrollable: true,
                  onTap: (i) {
                    setState(() {
                      _index = i;
                    });
                  },
                  tabs: const [
                    Tab(child: Text("Wearable")),
                    Tab(child: Text("Laptops")),
                    Tab(child: Text("Phones")),
                    Tab(child: Text("Drones")),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Expanded(
            child: [
              _wearable(),
              _laptops(),
              _phones(),
              _drones(),
            ].toList()[_index],
          )
        ],
      ),
    );
  }

  Widget _wearable() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => _helper.jumpToPage(context,
              page: DetailHomePage(data: _data[index])),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 250,
                width: 190,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _data[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _data[index].version,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: HexColor("#5956E9"),
                          size: 15,
                        ),
                        Text(
                          "${_data[index].price}",
                          style: TextStyle(
                            color: HexColor("#5956E9"),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
              Positioned(
                left: Constants.padding,
                right: Constants.padding,
                top: Constants.padding - 5,
                child: Image.asset(
                  _data[index].image,
                  height: 150,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 20);
      },
    );
  }

  Widget _laptops() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _dataLaptop.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => _helper.jumpToPage(context,
              page: DetailHomePage(data: _dataLaptop[index])),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 220,
                width: 190,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _dataLaptop[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _dataLaptop[index].version,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: HexColor("#5956E9"),
                          size: 15,
                        ),
                        Text(
                          "${_dataLaptop[index].price}",
                          style: TextStyle(
                            color: HexColor("#5956E9"),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
              Positioned(
                left: Constants.padding,
                right: Constants.padding,
                top: Constants.padding - 30,
                child: Image.asset(
                  _dataLaptop[index].image,
                  height: 150,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 20);
      },
    );
  }

  Widget _phones() {
    return Container();
  }

  Widget _drones() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: _dataDrone.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => _helper.jumpToPage(context,
              page: DetailHomePage(data: _dataDrone[index])),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: 220,
                width: 190,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _dataDrone[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _dataDrone[index].version,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: HexColor("#5956E9"),
                          size: 15,
                        ),
                        Text(
                          "${_dataDrone[index].price}",
                          style: TextStyle(
                            color: HexColor("#5956E9"),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
              Positioned(
                left: Constants.padding,
                right: Constants.padding,
                top: Constants.padding - 30,
                child: Image.asset(
                  _dataDrone[index].image,
                  height: 150,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 20);
      },
    );
  }
}

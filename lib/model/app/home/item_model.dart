import 'package:e_commerce_apps/model/app/home/colors_model.dart';

class ItemModel {
  int id;
  String name;
  String image;
  String detailImage;
  List<ColorsModel> colors;
  String version;
  String title;
  String descriptions;
  int price;

  ItemModel({
    this.id,
    this.name,
    this.image,
    this.detailImage,
    this.colors,
    this.version,
    this.title,
    this.descriptions,
    this.price,
  });
}

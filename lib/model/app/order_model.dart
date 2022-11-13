class OrderModel {
  OrderModel({
    this.data,
  });

  Data data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.insertOrder,
  });

  InsertOrder insertOrder;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        insertOrder: InsertOrder.fromJson(json["insert_order"]),
      );

  Map<String, dynamic> toJson() => {
        "insert_order": insertOrder.toJson(),
      };
}

class InsertOrder {
  InsertOrder({
    this.returning,
  });

  List<Returning> returning;

  factory InsertOrder.fromJson(Map<String, dynamic> json) => InsertOrder(
        returning: List<Returning>.from(
            json["returning"].map((x) => Returning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "returning": List<dynamic>.from(returning.map((x) => x.toJson())),
      };
}

class Returning {
  Returning({
    this.id,
    this.product,
    this.totalPrice,
    this.orderDate,
    this.userId,
  });

  int id;
  String product;
  String totalPrice;
  DateTime orderDate;
  int userId;

  factory Returning.fromJson(Map<String, dynamic> json) => Returning(
        id: json["id"],
        product: json["product"],
        totalPrice: json["total_price"],
        orderDate: DateTime.parse(json["order_date"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "total_price": totalPrice,
        "order_date":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "user_id": userId,
      };
}

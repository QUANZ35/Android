import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  List<Datum> data;

  Review({
    required this.data,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String orderId;
  String content;
  int favorite;
  int views;
  String image;
  int rating;
  String createTime;
  Order order;

  Datum({
    required this.id,   //리뷰한 사람 ID
    required this.orderId,  //주문번호 ID
    required this.content,  //#맛집
    required this.favorite, //하트모양
    required this.views,
    required this.image,    //사진
    required this.rating,   //별점
    required this.createTime,   //작성일지
    required this.order,        //주문하기 버튼
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    orderId: json["orderId"],
    content: json["content"],
    favorite: json["favorite"],
    views: json["views"],
    image: json["image"],
    rating: json["rating"],
    createTime: json["createTime"],
    order: Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "content": content,
    "favorite": favorite,
    "views": views,
    "image": image,
    "rating": rating,
    "createTime": createTime,
    "order": order.toJson(),
  };
}

class Order {
  String id;
  int storeId;
  String userId;
  String orderDate;
  String status;
  Store store;
  User user;
  List<OrderDetail> orderDetails;

  Order({
    required this.id,
    required this.storeId,
    required this.userId,
    required this.orderDate,
    required this.status,
    required this.store,
    required this.user,
    required this.orderDetails,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    storeId: json["storeId"],
    userId: json["userId"],
    orderDate: json["orderDate"],
    status: json["status"],
    store: Store.fromJson(json["store"]),
    user: User.fromJson(json["user"]),
    orderDetails: List<OrderDetail>.from(json["orderDetails"].map((x) => OrderDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "storeId": storeId,
    "userId": userId,
    "orderDate": orderDate,
    "status": status,
    "store": store.toJson(),
    "user": user.toJson(),
    "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
  };
}

class OrderDetail {
  String id;
  String orderId;
  int menuId;
  int amount;
  int price;
  Menu menu;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.menuId,
    required this.amount,
    required this.price,
    required this.menu,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"],
    orderId: json["orderId"],
    menuId: json["menuId"],
    amount: json["amount"],
    price: json["price"],
    menu: Menu.fromJson(json["menu"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "menuId": menuId,
    "amount": amount,
    "price": price,
    "menu": menu.toJson(),
  };
}

class Menu {
  int id;
  String name;
  String description;
  int price;
  dynamic image;
  String status;
  int storeId;

  Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.status,
    required this.storeId,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    image: json["image"],
    status: json["status"],
    storeId: json["storeId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": image,
    "status": status,
    "storeId": storeId,
  };
}

class Store {
  int id;
  String name;
  String description;
  dynamic address;
  dynamic image;
  dynamic phoneNumber;
  String userId;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required  this.address,
    required this.image,
    required this.phoneNumber,
    required this.userId,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    address: json["address"],
    image: json["image"],
    phoneNumber: json["phoneNumber"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "image": image,
    "phoneNumber": phoneNumber,
    "userId": userId,
  };
}

class User {
  String id;
  String name;
  dynamic email;
  dynamic emailVerified;
  String image;
  dynamic password;
  String phoneNumber;
  String allergy;
  int money;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.image,
    required this.password,
    required this.phoneNumber,
    required this.allergy,
    required this.money,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerified: json["emailVerified"],
    image: json["image"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    allergy: json["allergy"],
    money: json["money"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "emailVerified": emailVerified,
    "image": image,
    "password": password,
    "phoneNumber": phoneNumber,
    "allergy": allergy,
    "money": money,
  };
}

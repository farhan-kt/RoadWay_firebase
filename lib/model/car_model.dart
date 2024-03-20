class CarModel {
  String? id;
  String? carName;
  String? km;
  String? description;
  String? date;
  int? price;
  String? image;
  List wishList;

  CarModel(
      {this.id,
      this.image,
      this.date,
      required this.carName,
      required this.km,
      required this.description,
      required this.price,
      required this.wishList});

  factory CarModel.fromJson(String id, Map<String, dynamic> json) {
    return CarModel(
        id: id,
        image: json['image'],
        carName: json['name'],
        km: json['km'],
        date: json['date'],
        description: json['description'],
        price: json['price'],
        wishList: List<String>.from(json['wishlist']));
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': carName,
      'km': km,
      'date': date,
      'description': description,
      'price': price,
      'wishlist': wishList
    };
  }
}

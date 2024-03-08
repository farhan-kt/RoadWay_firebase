class CarModel {
  String? id;
  String? carName;
  String? category;
  String? description;
  int? price;
  String? image;
  List wishList;

  CarModel(
      {this.id,
      this.image,
      required this.carName,
      required this.category,
      required this.description,
      required this.price,
      required this.wishList});

  factory CarModel.fromJson(String id, Map<String, dynamic> json) {
    return CarModel(
        id: id,
        image: json['image'],
        carName: json['name'],
        category: json['category'],
        description: json['description'],
        price: json['price'],
        wishList: List<String>.from(json['wishlist']));
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': carName,
      'category': category,
      'description': description,
      'price': price,
      'wishlist': wishList
    };
  }
}

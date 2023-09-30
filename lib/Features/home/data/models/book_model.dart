class BookModel {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  BookModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.discount,
      this.priceAfterDiscount,
      this.stock,
      this.bestSeller,
      this.image,
      this.category});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    stock = json['stock'];
    bestSeller = json['best_seller'];
    image = json['image'];
    category = json['category'];
  }
}

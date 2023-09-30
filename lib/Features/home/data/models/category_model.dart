class CategoryModel {
  int? id;
  String? name;
  int? productCount;

  CategoryModel({
    this.id,
    this.name,
    this.productCount,
  });

  CategoryModel.fromJson(data) {
    id = data['id'];
    name = data['name'];
    productCount = data['products_count'];
  }
}

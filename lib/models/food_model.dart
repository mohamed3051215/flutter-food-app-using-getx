class FoodModel {
  String id, name, category;
  final String? imageUrl;
 Map<String , dynamic> nutrients;

  FoodModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageUrl,
      required this.nutrients});

  FoodModel.fromJson(Map<String, dynamic> json)
      : this.id = json["food"]['foodId'],
        this.category = json["food"]["category"],
        this.imageUrl = json["food"]["image"],
        this.nutrients = json["food"]["nutrients"],
        this.name = json["food"]['label'];
  Map<String, dynamic> toJson() {
    return {
      "label": name,
      "foodId": id,
      "category": category,
      "image": imageUrl,
      "nutrients": nutrients
    };
  }
}

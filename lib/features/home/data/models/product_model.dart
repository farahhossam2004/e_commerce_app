class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

 ProductModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  title = json['title'] ?? "No Title"; // Default title
  price = json['price'] ?? 0.0; // Default price
  description = json['description'] ?? "No Description";
  category = json['category'] ?? "Uncategorized";
  image = json['image'] ?? "https://via.placeholder.com/150"; // Default image
  rating = json['rating'] != null ? Rating.fromJson(json['rating']) : Rating(rate: 0, count: 0);
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}

class Product{
  final int id;
  final String title;
  final double price;
  final String description;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.thumbnail
  });

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id'], 
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: (json['description']),
      thumbnail: json['thumbnail']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'thumbnail': thumbnail
    };
  }

  factory Product.fromMap(Map<String,dynamic> map){
    return Product(
      id: map['id'], 
      title: map['title'], 
      price: map['price'], 
      description: map['description'], thumbnail: map['thumbnail']);
  }
}
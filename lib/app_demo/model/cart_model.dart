

class Cart{

    final int id;
    final List<CartProduct> products;
    final double total;
    final double discountedTotal;
    final int userId;
    final int totalProducts;

    Cart({
      required this.id,
      required this.products,
      required this.total,
      required this.discountedTotal,
      required this.userId,
      required this.totalProducts
    });

    factory Cart.fromJson(Map<String,dynamic> json){
     return Cart(
      id: json['id'], 
      total: json['total'].toDouble(),
      discountedTotal: json['discountedTotal'].toDouble(),
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      products: List<CartProduct>.from(
        (json['products'] as List).map((p) => CartProduct.fromJson(p))
      )
    );
  }

  Map<String,dynamic> toMap() =>{
    'id':id,
    'userID': userId,
    'total': total,
    'discountedTotal':discountedTotal,
    'totalProducts':totalProducts
  };

  factory Cart.fromMap(Map<String,dynamic> map , List<CartProduct> products){
    return Cart(
      id: map['id'], 
      products: products,
      total: map['total'],
      discountedTotal: map['discountedTotal'],
      userId: map['userId'],
      totalProducts: map['totalProducts']);
  }
}

class CartProduct{
  
  final int id;
  final String title;
  final double price;
  final int quantity;
  final String thumbnail;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail
  });

  factory CartProduct.fromJson(Map<String, dynamic> json){
    return CartProduct(
      id: json['id'], 
      title: json['title'],
      price: double.parse((json['price'] ?? 0).toString()),
      quantity: json['quantity'],
      thumbnail: json['thumbnail'] as String 
    );
  }

  Map<String,dynamic> toMap(int cartID) =>{
    'cartID':cartID,
    'productId':id,
    'title':title,
    'price':price,
    'quantity':quantity,
    'thumbnail': thumbnail
  };

  factory CartProduct.fromMap(Map<String,dynamic> map){
    return CartProduct(
      id: map['id'], 
      title: map['title'], 
      price: map['price'], 
      quantity: map['quantity'], 
      thumbnail: map['thumbnail']);
  }

} 

class CartListReponse{

  final List<Cart> carts;
  final double total;
  final int skip;
  final int limit;

  CartListReponse({
    
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartListReponse.fromJson(Map<String,dynamic> json){
    return CartListReponse(
      carts: List<Cart>.from(
        (json['carts'] as List).map((c) => Cart.fromJson(c)),
      ), 
      total: double.parse((json['total'] ?? 0).toString()),
      skip: json['skip'], 
      limit: json['limit']
    );
  }

}





// {
//       "id": 1,
//       "products": [
//         {
//           "id": 162,
//           "title": "Blue Frock",
//           "price": 29.99,
//           "quantity": 4,
//           "total": 119.96,
//           "discountPercentage": 12.13,
//           "discountedTotal": 105.41,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/tops/blue-frock/thumbnail.webp"
//         },
//         {
//           "id": 113,
//           "title": "Generic Motorcycle",
//           "price": 3999.99,
//           "quantity": 3,
//           "total": 11999.97,
//           "discountPercentage": 12.1,
//           "discountedTotal": 10547.97,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/motorcycle/generic-motorcycle/thumbnail.webp"
//         },
//         {
//           "id": 122,
//           "title": "iPhone 6",
//           "price": 299.99,
//           "quantity": 3,
//           "total": 899.97,
//           "discountPercentage": 6.69,
//           "discountedTotal": 839.76,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/smartphones/iphone-6/thumbnail.webp"
//         },
//         {
//           "id": 138,
//           "title": "Baseball Ball",
//           "price": 8.99,
//           "quantity": 2,
//           "total": 17.98,
//           "discountPercentage": 1.71,
//           "discountedTotal": 17.67,
//           "thumbnail": "https://cdn.dummyjson.com/product-images/sports-accessories/baseball-ball/thumbnail.webp"
//         }
//       ],
//       "total": 13037.88,
//       "discountedTotal": 11510.81,
//       "userId": 1,
//       "totalProducts": 4,
//       "totalQuantity": 12
//     },
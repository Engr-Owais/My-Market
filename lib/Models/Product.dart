class Product {
  String productName;
  String productID;
  bool status;
  String price;
  String image;
  String subCatID;
  String userPhone;
  String prodDescription;
  String imageUrl;
  String catID;
  String userName;
  bool prodNegotiable;
  bool brandNew;
  bool used;
  String region;
  bool refurbished;

  Product(
      {this.productID,
      this.productName,
      this.status,
      this.image,
      this.price,
      this.catID,
      this.region,
      this.imageUrl,
      this.userName,
      this.prodDescription,
      this.prodNegotiable,
      this.userPhone,
      this.subCatID,
      this.used,
      this.brandNew,
      this.refurbished});

  Map<String, dynamic> toMap() {
    return {
      'productID': productID,
      'productName': productName,
      'catstatus': status,
      'price': price,
      'image': image,
      'catId': catID,
      'region': region,
      'subCatId': subCatID,
      'imageUrl': imageUrl,
      'userName': userName,
      'prodDescription': prodDescription,
      'prodNegotiable': prodNegotiable,
      'userPhone': userPhone,
      'used': used,
      'refurbished': refurbished,
      'brandNew': brandNew,
    };
  }

  Product.fromData(Map<String, dynamic> data)
      : productID = data['productID'],
        productName = data['productName'],
        image = data['image'],
        imageUrl = data['imageUrl'],
        catID = data['catId'],
        region = data['region'],
        subCatID = data['subCatId'],
        price = data['price'],
        status = data['catstatus'],
        userName = data['userName'],
        prodDescription = data['prodDescription'],
        prodNegotiable = data['prodNegotiable'],
        userPhone = data['userPhone'],
        used = data['used'],
        brandNew = data['brandNew'],
        refurbished = data['refurbished'];

  static Product fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
// , String documentId
    return Product(
      productName: map['productName'],
      productID: map['productID'],
      status: map['status'],
      image: map['image'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      catID: map['catId'],
      region: map['region'],
      subCatID: map['subCatId'],
      userName: map['userName'],
      prodDescription: map['prodDescription'],
      prodNegotiable: map['prodNegotiable'],
      userPhone: map['userPhone'],
      used: map['used'],
      brandNew: map['brandNew'],
      refurbished: map['refurbished'],
    );
  }
}

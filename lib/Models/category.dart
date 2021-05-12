class Category {
  final String catName;
  String catId;
  final String userId;
  final bool status;
  final String imageFileName;

  final String imageUrl;

  Category({
    this.catId,
    this.catName,
    this.userId,
    this.status,
    this.imageFileName,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'catId': catId,
      'catName': catName,
      'catStatus': status,
      'imageFileName': imageFileName,
      'catImage': imageUrl,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
// , String documentId
    return Category(
      catName: map['catName'],
      catId: map['catId'],
      status: map['catStatus'],
      userId: map['userId'],
      imageFileName: map['imageFileName'],
      imageUrl: map['catImage'],
    );
  }
}

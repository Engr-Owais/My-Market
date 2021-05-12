class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String userRole;
  final String imageFileName;

  final String imageUrl;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.userRole,
    this.imageFileName,
    this.imageUrl,
  });

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        phone = data['phone'],
        email = data['email'],
        userRole = data['userRole'],
        imageFileName = data['imageFileName'],
        imageUrl = data['userImage'];

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      imageFileName: map['imageFileName'],
      imageUrl: map['userImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'userRole': userRole,
      'imageFileName': imageFileName,
      'userImage': imageUrl,
    };
  }
}

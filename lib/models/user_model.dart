class UserModel {
  final int? userId;
  final String? name;
  final String? email;
  final int? refId;
  final String? picture;
  final String? isActive;

  UserModel(
      {required this.userId,
      required this.name,
      required this.email,
      required this.picture,
      required this.refId,
      required this.isActive});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userId: json['id'],
        name: json['name'],
        email: json['email'],
        picture: json['picture'],
        refId: json['ref_id'],
        isActive: json['is_ctive']);
  }
}

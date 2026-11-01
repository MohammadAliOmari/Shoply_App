class RequestProfile {
  final String? address;
  final String? fullName;
  final String? userName;
  final String? profileImage;

  RequestProfile({
    required this.address,
    required this.fullName,
    required this.userName,
    required this.profileImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'fullName': fullName,
      'userName': userName,
      'profileImage': profileImage,
    };
  }
}

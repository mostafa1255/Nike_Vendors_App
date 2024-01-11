// ignore_for_file: file_names

class VendorModel {
  String? name;
  String? email;
  String? userid;

  VendorModel({
    required this.email,
    required this.userid,
    required this.name,
  });

  VendorModel.fromJcon({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    userid = data['userid'];
  }

  Map<String, dynamic> toJcon() {
    return {
      'name': name,
      'email': email,
      'userid': userid,
    };
  }
}

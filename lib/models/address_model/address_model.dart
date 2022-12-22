class AddressModel {
  String? title;
  String? name;
  String? address;
  String? landMark;
  String? pinCode;
  String? place;
  String? state;
  String? mobNum;

  AddressModel({
    required this.title,
    required this.name,
    required this.address,
    required this.landMark,
    required this.pinCode,
    required this.place,
    required this.state,
    required this.mobNum,
  });
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "fullName": name,
      "phone": mobNum,
      "pin": pinCode,
      "state": state,
      "place": place,
      "address": address,
      "landMark": landMark
    };
  }
}

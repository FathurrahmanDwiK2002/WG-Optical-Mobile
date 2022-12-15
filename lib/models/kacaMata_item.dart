// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_this, prefer_collection_literals

class KacaMataItem {
  String? itemImg;
  String? title;
  String? subtitle;
  String? title2;
  String? subtitle2;
  double? price;
  String? Waktu;

  KacaMataItem({
    this.itemImg,
    this.title,
    this.subtitle,
    this.price,
    this.Waktu,
    this.title2,
    this.subtitle2,
  });

  KacaMataItem.fromJson(Map<String, dynamic> json) {
    itemImg = json['itemImg'];
    title = json['title'];
    subtitle = json['subtitle'];
    title2 = json['title2'];
    subtitle2 = json['subtitle2'];
    price = json['price'];
    Waktu = json['jam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['itemImg'] = this.itemImg;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['title2'] = this.title2;
    data['subtitle2'] = this.subtitle2;
    data['price'] = this.price;
    data['jam'] = this.Waktu;
    return data;
  }

  static map(Function(dynamic e) param0) {}
}

class KacaMataItem {
  String? itemImg;
  String? title;
  String? subtitle;
  double? price;

  KacaMataItem({this.itemImg, this.title, this.subtitle, this.price});

  KacaMataItem.fromJson(Map<String, dynamic> json) {
    itemImg = json['itemImg'];
    title = json['title'];
    subtitle = json['subtitle'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemImg'] = this.itemImg;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['price'] = this.price;
    return data;
  }

  static map(Function(dynamic e) param0) {}
}

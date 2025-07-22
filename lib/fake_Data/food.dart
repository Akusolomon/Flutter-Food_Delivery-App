class Food {
  Food(
      {required this.type,
      required this.img,
      required this.price,
      required this.desc,
      required this.fasting,
      required this.rate,
      required this.name});
  final String name;
  final String type;
  final double price;
  final String desc;
  final bool fasting;
  final double rate;
  final String img;

  Map<String, dynamic> toMap() {
    final foodE = Map<String, dynamic>();
    foodE['name'] = this.name;
    foodE['price'] = this.price;
    foodE['type'] = this.type;
    foodE['desc'] = this.desc;
    foodE['fasting'] = this.fasting;
    foodE['rate'] = this.rate;
    foodE['img'] = this.img;

    return foodE;
  }
}

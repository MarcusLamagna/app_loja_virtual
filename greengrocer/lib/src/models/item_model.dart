class ItemModel {
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  //Criando contrutor para classe
  ItemModel({
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });
}

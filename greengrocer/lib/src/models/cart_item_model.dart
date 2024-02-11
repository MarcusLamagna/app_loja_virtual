import 'package:greengrocer/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  //Criando contrutor
  CartItemModel({
    required this.item,
    required this.quantity,
  });

  //Criando método para retorar o totao de produtos
  double totalPrice() => item.price * quantity;
}

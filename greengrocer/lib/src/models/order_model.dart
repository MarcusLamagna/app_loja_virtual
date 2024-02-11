import 'package:greengrocer/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime; //Qrcode vencido
  List<CartItemModel> items;
  String status;
  String copyAndPaste; //Copia e cola Pix
  double total; //Total de pedidos em relação a todos os produtos comprados

  //Criando contrutor
  OrderModel({
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.id,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.total,
  });
}

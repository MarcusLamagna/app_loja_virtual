import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  //Método R$ valor para converter em real
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  //Método para criar data formatada
  String formatDateTime(DateTime datetime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt-BR').add_Hm();
    return dateFormat.format(datetime);
  }
}
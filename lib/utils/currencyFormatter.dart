import 'package:intl/intl.dart';

final format = new NumberFormat("#,##0.00", "en_US");
String currencyFormater(double number){
  return format.format(number);
}
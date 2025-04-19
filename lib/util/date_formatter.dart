import 'package:intl/intl.dart';

String formattedDate(String date){
  DateTime dateTime= DateTime.parse(date);
  String formattedDate= DateFormat('MMM d, yyyy').format(dateTime);
  return formattedDate;
}
import 'package:intl/intl.dart';

String translateNumbersToArabic({required num number}) {
  NumberFormat numberFormat = NumberFormat.decimalPattern('ar_EG');
  String formattedNumber = numberFormat.format(number);
  return formattedNumber;
}

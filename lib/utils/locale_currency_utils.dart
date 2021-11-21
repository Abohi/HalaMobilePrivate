
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class LocaleCurrencyUtils{
  static String getCurrencySymbol(BuildContext context) {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return format.currencySymbol;
  }
}
import 'dart:ui';
import 'package:flutter/material.dart';

class AppStyle {
  static const baseTextStyle = TextStyle(fontWeight: FontWeight.bold);
  static final TextStyle pageTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 26.0,
  );
  static final TextStyle headerTextStyle = baseTextStyle.copyWith(
    fontSize: 20.0,
  );
  static final TextStyle regularTextStyle = baseTextStyle.copyWith(
    fontSize: 18.0,
  );
  static final TextStyle subHeaderTextStyle =
      baseTextStyle.copyWith(fontSize: 26.0);
  static const TextStyle itemPriceTextStyle = TextStyle(color: Colors.blueGrey);
  static final TextStyle subPriceTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 20.0,
  );
  static final TextStyle priceSubTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.blueGrey,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle priceTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.indigo,
    fontSize: 22.0,
  );

  static final Color goldColor = Color.fromRGBO(212, 175, 55, 1);

}

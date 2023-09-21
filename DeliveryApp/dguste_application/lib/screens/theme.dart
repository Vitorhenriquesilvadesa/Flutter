import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0XFFF2C53D),
        elevation: 6,
        toolbarHeight: 90,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      primaryColor: const Color(0XFFF2C53D),
      primaryColorDark: const Color(0xFFAA8107),
      primaryColorLight: const Color(0xFFFFE28D),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Futura',
      textTheme: textTheme());
}

TextTheme textTheme() {
  return const TextTheme(
    //Logo Principal
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Color(0XFFDC0808),
    ),

    // 3 variações de titulos em tamanho apenas
    titleLarge: TextStyle(fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontWeight: FontWeight.bold),

    labelLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0XFFDC0808),
        fontSize: 16), // botões
    labelMedium: TextStyle(fontWeight: FontWeight.bold), // botões
    labelSmall: TextStyle(fontWeight: FontWeight.normal), // label de inputs
    // bodyLarge: TextStyle(), //por enquanto sem uso
    bodyMedium: TextStyle(
      fontSize: 14,
    ), // textos medios para descrições
    bodySmall: TextStyle(fontSize: 12
        // color:

        ), // textos minusculos no tom de cinza

    // Sem uso por enquanto:
    // headlineLarge:TextStyle(),
    // headlineMedium:TextStyle(),
    // headlineSmall:TextStyle(),
  );
}

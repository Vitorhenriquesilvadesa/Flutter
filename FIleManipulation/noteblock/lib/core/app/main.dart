import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'home_page.dart';

/*
-------------LEIA ANTES DE EXECUTAR-----------------

EXECUTE SOMENTE NO SISTEMA WINDOWS POIS O A APLICAÇÃO NÃO FOI
FEITA PARA MOBILE (NÃO TENHO COMO TESTAR NO MOBILE).

OBSERVAÇÕES: PARA VALIDAR O CAMPO DE PREÇO DO ANUNCIO, FOI
USADO UM FILTRO COM REGULAR EXPRESSION (REGEX), ESTUDEI
APENAS A PARTE DE VERIFICAR DIGITOS SEGUIDOS POR PONTOS,
E NO MAXIMO 2 DIGITOS APÓS O PONTO OU VIRGULA. 

NO WINDOWS EU NÃO CONSEGUI ACESSAR A CÂMERA, ENTÃO A I
MAGEM DEVE SERSELECIONADA A PARTIR DA GALERIA DO DISPOSITIVO.

NO ARQUIVO home_page.dart EXISTE UM METODO CHAMADO _onDismissed(),
POR ALGUMA RAZÃO A IMAGEM DO ANUNCIO NÃO ESTÁ SENDO CARREGADA AO
COMPARTILHAR ELE. SE PUDER DEIXAR UM FEEDBACK SOBRE O QUE POSSA SER,
TENTEI DE VÁRIAS FORMAS E NENHUMA FUNCIONOU.
 */

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

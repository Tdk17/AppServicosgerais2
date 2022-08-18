import 'package:flutter/material.dart';
import 'package:globalchaveimp/Utils/cores_impactus.dart';
import 'package:globalchaveimp/Utils/sistemas_impactus.dart';
import 'package:provider/provider.dart';
import 'package:servicosimp/pages/autenticacao_page.dart';
import 'package:servicosimp/pages/configuracao_page.dart';
import 'package:servicosimp/pages/home_page.dart';
import 'package:servicosimp/utils/app_routes.dart';
import 'package:servicosimp/utils/constantes.dart';

import 'model/autenticacao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(fontFamily: 'Segoe UI');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Autenticacao(),
        ),
      ],
      child: MaterialApp(
        title: Constantes.tituloApp,
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: CoresImpactus.corPrincipal(SistemaImpactus.interno),
            secondary: CoresImpactus.corSecundaria(SistemaImpactus.interno),
          ),
          toggleableActiveColor:
              CoresImpactus.corSecundaria(SistemaImpactus.interno),
        ),
        routes: {
          AppRoutes.home: (context) => const HomePage(),
          AppRoutes.configuracao: (context) => const ConfiguracaoPage(),
          AppRoutes.autenticacao: (context) => const AutenticacaoPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

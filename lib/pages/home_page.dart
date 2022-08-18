import 'dart:io';

import 'package:flutter/material.dart';

import 'package:globalchaveimp/Page/erro_page.dart';

import 'package:provider/provider.dart';
import 'package:servicosimp/pages/configuracao_page.dart';
import 'package:servicosimp/pages/principal_page.dart';

import '../model/autenticacao.dart';
import '../utils/constantes.dart';
import 'autenticacao_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  bool _ehMensagemConexaoApi(Object erro) {
    return erro is SocketException &&
        (erro.message.toLowerCase().startsWith('connection refused') ||
            erro.message.toLowerCase().startsWith('connection timed out'));
  }

  @override
  Widget build(BuildContext context) {
    Autenticacao autenticacao = Provider.of(
      context,
      listen: false,
    );
    return FutureBuilder(
      //future: autenticacao.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          if (_ehMensagemConexaoApi(snapshot.error!)) {
            return ConfiguracaoPage();
          }
          return ErroPage(
              tituloApp: Constantes.tituloApp,
              mensagem: 'Ocorreu um erro.\n${snapshot.error}');
        } else {
          return !autenticacao.urlApiInformada
              ? const ConfiguracaoPage()
              : !autenticacao.licencaUsoValida
                  ? ErroPage(
                      tituloApp: Constantes.tituloApp,
                      mensagem: autenticacao.mensagemLicencaUso)
                  : !autenticacao.estaAutenticado
                      ? const AutenticacaoPage()
                      : const PrincipalPage();
        }
      },
    );
  }
}

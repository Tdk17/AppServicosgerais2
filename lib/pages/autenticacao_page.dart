import 'package:flutter/material.dart';
import 'package:globalchaveimp/Utils/cores_impactus.dart';
import 'package:globalchaveimp/Utils/sistemas_impactus.dart';

import '../components/autenticacao_form.dart';

class AutenticacaoPage extends StatelessWidget {
  const AutenticacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CoresImpactus.corPrincipal(SistemaImpactus.interno),
                CoresImpactus.corSecundaria(SistemaImpactus.interno),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        AutenticacaoForm(),
      ],
    ));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:globalchaveimp/Data/store.dart';
import 'package:globalchaveimp/Models/licenca_uso.dart';

import '../utils/constantes.dart';

class Autenticacao with ChangeNotifier {
  int? _cdColaborador;
  String? _nmColaborador;
  String? _logoEmpresa;
  String? _caminhoApi;
  Image? _imagemLogoEmpresa;
  LicencaUso? _licencaUso;

  bool get estaAutenticado {
    return _cdColaborador != null;
  }

  bool get urlApiInformada {
    return _caminhoApi != null;
  }

  int? get cdColaborador {
    return estaAutenticado ? _cdColaborador : null;
  }

  bool get licencaUsoValida {
    return (_licencaUso?.moduloContratado ?? false) &&
        !(_licencaUso?.dataLicenca.isBefore(DateTime.now()) ?? true);
  }

  String get mensagemLicencaUso {
    if (_licencaUso == null) return '';
    if (!_licencaUso!.moduloContratado) {
      return 'Você não possui o módulo ${Constantes.tituloApp} contratado.';
    }
    if (!_licencaUso!.dataLicenca.isBefore(DateTime.now())) {
      return 'Sua licença de uso expirou em }.';
    }
    return '';
  }

  String? get nmColaborador {
    return estaAutenticado ? _nmColaborador : null;
  }

  Image get logoEmpresa {
    if (_imagemLogoEmpresa == null) {
      if (_logoEmpresa?.isEmpty ?? true) {
        _imagemLogoEmpresa = Image.asset(
          'assets/imagens/logoImpactus.png',
          fit: BoxFit.cover,
        );
      } else {
        _imagemLogoEmpresa = Image.memory(
          base64.decode(_logoEmpresa!.replaceAll('\r\n', '')),
          fit: BoxFit.cover,
        );
      }
    }
    return _imagemLogoEmpresa!;
  }

  String? get caminhoApi {
    return _caminhoApi;
  }

  void login(int cdColaborador, String nmColaborador, String logoEmpresa) {
    _cdColaborador = cdColaborador;
    _nmColaborador = nmColaborador;
    _logoEmpresa = logoEmpresa;

    Store.saveMap('infoLogin', {
      'cdColaborador': _cdColaborador,
      'nmColaborador': _nmColaborador,
      'logoEmpresa': _logoEmpresa,
    }).then((_) {
      notifyListeners();
    });
  }

  Future<void> tryAutoLogin() async {
    if (estaAutenticado) return;

    final configuracoes = await Store.getMap('configuracoes');

    if (configuracoes.isEmpty) return;

    _caminhoApi = configuracoes['caminhoIP'];

    //final licenca = await Api.retornarLicencaUso();

    //_licencaUso = LicencaUso(
    //   dataLicenca: DateTime.parse(licenca['dataLicenca']),
    //  moduloContratado: licenca['moduloContratado']);

    final infoLogin = await Store.getMap('infoLogin');

    if (infoLogin.isEmpty) return;

    _cdColaborador = infoLogin['cdColaborador'];
    _nmColaborador = infoLogin['nmColaborador'];
    _logoEmpresa = infoLogin['logoEmpresa'];
    notifyListeners();
  }

  void logout() {
    _cdColaborador = null;
    _nmColaborador = null;
    _logoEmpresa = null;
    _imagemLogoEmpresa = null;
    Store.remove('infoLogin').then((_) {
      notifyListeners();
    });
  }
}

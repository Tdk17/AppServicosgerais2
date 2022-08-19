import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:servicosimp/model/servicos.dart';

class ServicesList with ChangeNotifier {
  List<Servicos> _servicos = [];

  List<Servicos> get servicos {
    return [..._servicos];
  }

  int get itemsCount {
    return _servicos.length;
  }

  void addServicosFromData(Map<String, Object> data) {
    final newService = Servicos(
      id: Random().nextInt(2000).toString(),
      solicitante: data['solicitante'].toString(),
      equipamento: data['equipamento'].toString(),
      marca: data['marca'].toString(),
      modelo: data['modelo'].toString(),
      series: data['series'].toString(),
      descricaoProblema: data['descricaoProblema'].toString(),
      descricaoRealizada: data['descricaoRealizada'].toString(),
      data: data['data'].toString(),
      hora: data['horas'].toString(),
    );
    addOS(newService);
  }

  void addOS(Servicos servicos) {
    _servicos.add(servicos);
    notifyListeners();
  }

  void clear() {
    _servicos.clear();
    notifyListeners();
  }
}

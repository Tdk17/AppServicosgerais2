import 'package:objectbox/objectbox.dart';

@Entity()
class Servicos {
  int id = 0;
  String? solicitante;
  String? equipamento;
  String? marca;
  String? modelo;
  String? series;
  String? descricaoProblema;
  String? descricaoRealizada;

  Servicos({
    this.solicitante,
    this.equipamento,
    this.marca,
    this.modelo,
    this.series,
    this.descricaoProblema,
    this.descricaoRealizada,
  });
}

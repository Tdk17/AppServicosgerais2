class Servicos {
  String? id;
  String solicitante;
  String equipamento;
  String marca;
  String modelo;
  String series;
  String descricaoProblema;
  String descricaoRealizada;
  String data;
  String hora;

  Servicos({
    this.id,
    required this.solicitante,
    required this.equipamento,
    required this.marca,
    required this.modelo,
    required this.series,
    required this.descricaoProblema,
    required this.descricaoRealizada,
    required this.data,
    required this.hora,
  });
}

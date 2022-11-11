class SimuladorModel {
  final String id;
  final String titulo;
  final String descricao;
  final double inicial;
  final double aporte;
  final double taxa;
  final int periodo;
  final DateTime data;

  SimuladorModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.inicial,
    required this.aporte,
    required this.taxa,
    required this.periodo,
    required this.data,
  });
}

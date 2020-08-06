class LembreteEntity {
  final int id;
  final String observacao;
  final DateTime dataCompra;
  final double valor;
  final String responsavel;
  final String categoria;

  LembreteEntity({
    this.id,
    this.dataCompra,
    this.valor,
    this.responsavel,
    this.categoria,
    this.observacao,
  });

  @override
  factory LembreteEntity.fromJson(Map<String, dynamic> json) {
    return LembreteEntity(
      id: json["id"] as int,
      categoria: json["categoria"] as String,
      dataCompra: DateTime.parse(json["dataCompra"]),
      observacao: json["observacao"] as String,
      responsavel: json["responsavel"] as String,
      valor: json["valor"] as double,
    );
  }

  @override
  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return '{ ${this.observacao} }';
  }
}

class Despesa {
  String? idDespesa;
  String tituloDespesa;
  String tipoDespesa;
  num valorDespesa;
  String dataDespesa;

  Despesa({
    this.idDespesa,
    required this.tituloDespesa,
    required this.tipoDespesa,
    required this.valorDespesa,
    required this.dataDespesa,
  });
}
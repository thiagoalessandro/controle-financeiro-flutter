enum CategoriaDespesa{
  DESPESA_CASA,
  ASSINATURA
}

extension CategoriaDespesaExtension on CategoriaDespesa {

  String get description {
    switch (this) {
      case CategoriaDespesa.DESPESA_CASA:
        return 'Despesas Casa';
      case CategoriaDespesa.ASSINATURA:
        return 'Assinaturas';
      default:
        return null;
    }
  }

}
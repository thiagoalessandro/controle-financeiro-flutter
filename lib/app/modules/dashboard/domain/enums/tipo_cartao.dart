enum TipoCartao{
  ITAUGOLD,
  ITAUICONTA,
  NUBANK
}

extension CartaoTypeExtension on TipoCartao {

  String get description {
    switch (this) {
      case TipoCartao.ITAUGOLD:
        return 'Itaú Gold';
      case TipoCartao.ITAUICONTA:
        return 'Itaú Iconta';
      case TipoCartao.NUBANK:
        return 'Nubank';
      default:
        return null;
    }
  }

}
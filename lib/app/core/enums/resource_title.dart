enum ResourceTitle{
  LEMBRETE,
  RESPONSAVEL
}

extension TitlePageExtension on ResourceTitle {

  String get description {
    switch (this) {
      case ResourceTitle.LEMBRETE:
        return 'Lembrete';
      case ResourceTitle.RESPONSAVEL:
        return 'Responsável';
      default:
        return null;
    }
  }

}
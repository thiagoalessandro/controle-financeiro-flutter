enum ResourceTitle {
  DASHBOARD,
  LEMBRETE,
  RESPONSAVEL,
}

extension TitlePageExtension on ResourceTitle {

  String get description {
    switch (this) {
      case ResourceTitle.DASHBOARD:
        return 'Dashboard';
      case ResourceTitle.LEMBRETE:
        return 'Lembrete';
      case ResourceTitle.RESPONSAVEL:
        return 'Responsável';
      default:
        return null;
    }
  }

}
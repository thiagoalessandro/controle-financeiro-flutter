enum NotificationType{
  ERROR,
  WARNNING,
  SUCCESS
}

extension NotificationTypeExtension on NotificationType {

  String get description {
    switch (this) {
      case NotificationType.ERROR:
        return 'Erro';
      case NotificationType.WARNNING:
        return 'Alerta';
      case NotificationType.SUCCESS:
        return 'Sucesso';
      default:
        return null;
    }
  }

}
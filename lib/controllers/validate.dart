class Validate {
  static String? onlyString(String nome) {
    if (nome.contains(RegExp(r'[0-9]')))
      return 'Valores numéricos não são permitidos';
    return null;
  }

  static String? onlyNumber(String tele) {
    if (tele.contains(RegExp(r'[A-Z]')))
      return 'Neste campo só é permitido números';
    return null;
  }
}

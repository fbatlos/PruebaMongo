class Utils {
  static bool validarNIF(String nif) {
    final regex = RegExp(r"^[0-9]{8}[A-Z]$");
    return regex.hasMatch(nif);
  }
}

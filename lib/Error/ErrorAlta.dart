class ErrorAlta extends Error {
  String mensaje;
  ErrorAlta(this.mensaje);

  @override
  String toString() {
    return mensaje;
  }
}

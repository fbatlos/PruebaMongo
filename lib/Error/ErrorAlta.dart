//Error personalizado para cuando se da un error al darse de alta
class ErrorAlta extends Error {
  String mensaje;
  ErrorAlta(this.mensaje);

  @override
  String toString() {
    return mensaje;
  }
}

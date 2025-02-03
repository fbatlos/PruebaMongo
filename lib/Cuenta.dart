import 'package:dart_act_bancaria/Persona.dart';

abstract class Cuenta {
  Persona titular;
  String numeroCuenta;

  Cuenta(this.titular, this.numeroCuenta);

  void depositar(double monto);
  void retirar(double monto);
  double getSaldo();
}

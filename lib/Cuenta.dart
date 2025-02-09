import 'package:dart_act_bancaria/Persona.dart';

abstract class CuentaBancaria {
  Persona titular;
  String numeroCuenta;
  double saldo;

  CuentaBancaria(this.titular, this.numeroCuenta, this.saldo);

  void depositar(double monto) {
    if (monto > 0) {
      saldo += monto;
    } else {
      print('El monto a depositar debe ser mayor a 0');
    }
  }

  void retirar(double monto);
  double getSaldo();
}

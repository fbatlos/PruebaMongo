import 'package:dart_act_bancaria/Persona.dart';

//Clase abstracta para que tosdas hereden toda la funcionalidad
abstract class CuentaBancaria {
  Persona titular;
  String numeroCuenta;
  double saldo;

  CuentaBancaria(this.titular, this.numeroCuenta, this.saldo);
//Depositar de todas las cuentas
  void depositar(double monto) {
    if (monto > 0) {
      saldo += monto;
    } else {
      print('El monto a depositar debe ser mayor a 0');
    }
  }

//Retirar de todas las cuentas
  void retirar(double monto) {
    if ((saldo - monto) >= saldo || saldo - monto >= 0) {
      saldo -= monto;
    } else {
      print('El saldo mínimo no puede ser menor a $saldo');
    }
  }

//Obtener saldo del usuario
  double getSaldo();
}

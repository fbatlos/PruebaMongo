import 'package:dart_act_bancaria/Cuenta.dart';

class CuentaCorriente extends CuentaBancaria {
  static const double interes = 1.5;

  CuentaCorriente(super.titular, super.numeroCuenta, super.saldo);

  @override
  void depositar(double monto) {
    if (monto > 0) {
      saldo += monto;
    } else {
      print('El monto a depositar debe ser mayor a 0');
    }
  }

  @override
  void retirar(double monto) {
    if (saldo - monto >= 0) {
      saldo -= monto;
    } else {
      print('El saldo no puede ser menor a 0');
    }
  }

  @override
  double getSaldo() {
    return saldo;
  }

  @override
  String toString() {
    return 'Cuenta corriente de ${titular.nombre} ${titular.apellido} con saldo de $saldo';
  }
}

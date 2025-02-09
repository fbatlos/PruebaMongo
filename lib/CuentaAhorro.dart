import 'package:dart_act_bancaria/Cuenta.dart';
import 'package:dart_act_bancaria/Persona.dart';

class CuentaAhorro extends CuentaBancaria {
  double interes;

  CuentaAhorro(super.titular, super.numeroCuenta, super.saldo, this.interes);

  @override
  void retirar(double monto) {
    if ((saldo - monto) >= saldo || saldo - monto >= 0) {
      saldo -= monto;
    } else {
      print('El saldo mínimo no puede ser menor a $saldo');
    }
  }

  void calcularInteres() {
    var intereses = getSaldo() * (interes / 100);
    depositar(intereses);
  }

  void cambiarInteres(double nuevoInteres) {
    interes = nuevoInteres;
  }

  @override
  double getSaldo() {
    return saldo;
  }

  @override
  String toString() {
    return 'Cuenta de ahorro de ${titular.nombre} ${titular.apellido} con saldo de $saldo';
  }
}

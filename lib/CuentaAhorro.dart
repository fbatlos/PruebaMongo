import 'package:dart_act_bancaria/Cuenta.dart';
import 'package:dart_act_bancaria/Persona.dart';

class Cuentaahorro extends Cuenta {
  double interes;
  double saldoMinimo;

  Cuentaahorro(
      Persona titular, String numeroCuenta, this.interes, this.saldoMinimo)
      : super(titular, numeroCuenta);

  @override
  void depositar(double monto) {
    if (monto > 0) {
      depositar(monto);
    } else {
      print('El monto a depositar debe ser mayor a 0');
    }
  }

  @override
  void retirar(double monto) {
    if (getSaldo() - monto >= saldoMinimo) {
      retirar(monto);
    } else {
      print('El saldo mínimo no puede ser menor a $saldoMinimo');
    }
  }

  void calcularInteres() {
    var intereses = getSaldo() * interes;
    depositar(intereses);
  }

  void cambiarInteres(double nuevoInteres) {
    interes = nuevoInteres;
  }

  @override
  double getSaldo() {
    return saldoMinimo;
  }

  @override
  String toString() {
    return 'Cuenta de ahorro de ${titular.nombre} ${titular.apellido} con saldo de $saldoMinimo';
  }
}

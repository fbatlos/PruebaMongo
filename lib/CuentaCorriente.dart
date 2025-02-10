import 'package:dart_act_bancaria/Cuenta.dart';

//Clase Corriente que hereda de Cuenta bancaria
class CuentaCorriente extends CuentaBancaria {
  static const double interes = 1.5;
//Inicializamos todos los atributo del padre con super
  CuentaCorriente(super.titular, super.numeroCuenta, super.saldo);

//Obtenemos el saldo de la cuenta
  @override
  double getSaldo() {
    return saldo;
  }

//Sobre escibrimos el toString para dar un mensaje propio
  @override
  String toString() {
    return 'Cuenta corriente de ${titular.nombre} ${titular.apellido} con saldo de $saldo';
  }
}

import 'package:dart_act_bancaria/Cuenta.dart';

//Clase Ahorro que hereda de Cuenta bancaria
class CuentaAhorro extends CuentaBancaria {
  double interes;
  //Inicializamos todos los atributo del padre con super
  CuentaAhorro(super.titular, super.numeroCuenta, super.saldo, this.interes);
//Calculamos el interes
  void calcularInteres() {
    var intereses = getSaldo() * (interes / 100);
    depositar(intereses);
  }

//Cambiamos el interes
  void cambiarInteres(double nuevoInteres) {
    interes = nuevoInteres;
  }

//Obtenemos el saldo de la cuenta
  @override
  double getSaldo() {
    return saldo;
  }

//Sobre escibrimos el toString para dar un mensaje propio
  @override
  String toString() {
    return 'Cuenta de ahorro de ${titular.nombre} ${titular.apellido} con saldo de $saldo';
  }
}

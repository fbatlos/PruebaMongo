import 'package:dart_act_bancaria/Menu.dart';

void main(List<String> arguments) {
  var menu = Menu();

  /*
    La logica es la siguiente:
    1. Se debe dar de alta el cliente en el banco para que el banco pueda tener cuentas asociadas a ese cliente.
    2. El cliente tras agregarlo al banco, se le debe poder dar de alta en una cuenta corriente o una cuenta de ahorro.
    3. El cliente debe poder operar su cuenta corriente o de ahorro.
  */

  try {
    menu.mostrarMenu();
  } catch (e) {
    print(e);
  }
}

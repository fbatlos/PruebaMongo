import 'dart:io';
import 'dart:math';

import 'package:dart_act_bancaria/CuentaAhorro.dart';
import 'package:dart_act_bancaria/CuentaCorriente.dart';
import 'package:dart_act_bancaria/Error/ErrorAlta.dart';
import 'package:dart_act_bancaria/Persona.dart';
import 'package:dart_act_bancaria/utils/Utils.dart';

//Es el menu de las opciones del usuario
class Menu {
  //Usuarios ya determinados
  final _clientes = [
    Persona("Pepe", "Lopez", "12345678Z"),
    Persona("Juan", "Perez", "87654321A")
  ];
  var cuentaCorriente = [];
  var cuentaAhorro = [];

//Alta en el banco para que el banco tenga tus datos para posteriormente tu puedas abrirte una cuenta
  void altaBanco() {
    print("Alta de banco");
    print("Nombre del titular: ");
    var nombre = stdin.readLineSync();
    if (nombre == null || nombre.isEmpty) {
      throw ErrorAlta("El nombre no es válido");
    }

    print("Apellido del titular: ");
    var apellido = stdin.readLineSync();
    if (apellido == null || apellido.isEmpty) {
      throw ErrorAlta("El apellido no es válido");
    }

    print("NIF del titular: ");
    var nif = stdin.readLineSync();
    if (nif == null || nif.isEmpty) {
      throw ErrorAlta("El NIF no puede estar vacío");
    } else if (!Utils.validarNIF(nif)) {
      throw ErrorAlta("El NIF debe ser valido");
    }

    _clientes.add(Persona(nombre, apellido, nif));
    print("Cliente agregado correctamente");
    //Preguntar si es necesario hacer try-catch para manejar errores
  }

//Tras date de alta en el banco y añadir a sus clientes, podras abrirte una cuenta corriente
  bool altaCuentaCorriente() {
    print("Alta de cuenta corriente");
    var titular = getTitular();
    if (titular == null) {
      return false;
    }

    var numeroCuenta = _generarNumeroCuentaAleatorio();
    print("Saldo inicial: 0");
    var saldo = 0.0;
    cuentaCorriente.add(CuentaCorriente(titular, numeroCuenta, saldo));
    return true;
  }

//Tras date de alta en el banco y añadir a sus clientes, podras abrirte una cuenta de ahorro
  bool altaCuentaAhorro() {
    print("Alta de cuenta de ahorro");

    var titular = getTitular();
    if (titular == null) {
      return false;
    }

    var numeroCuenta = _generarNumeroCuentaAleatorio();
    print("Interés: ");
    var interes = double.parse(stdin.readLineSync()!);
    print("Saldo mínimo: ");
    var saldoMinimo = 0.0;
    cuentaAhorro.add(CuentaAhorro(titular, numeroCuenta, saldoMinimo, interes));
    return true;
  }

//Genera de forma aleatoria el numero de cuenta
  String _generarNumeroCuentaAleatorio() {
    var numerosPosibles = "0123456789";
    var numeroCuenta = "";
    for (var i = 0; i < 9; i++) {
      numeroCuenta += numerosPosibles[Random().nextInt(10)];
    }

    return numeroCuenta;
  }

//Obtenermos el titular de la cuenta mediante el NIF
  Persona? getTitular() {
    print("NIF del titular: ");
    var nif = stdin.readLineSync();
    for (var cliente in _clientes) {
      if (cliente.NIF == nif) {
        return cliente;
      }
    }
    return null;
  }

//Te da la opción de eleguir la cuenta que quieres operar
  void elegirCuenta() {
    print("Elija el tipo de cuenta a operar");
    print("1. Cuenta corriente");
    print("2. Cuenta de ahorro");
    var opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
        var titular = getTitular();
        if (titular != null) {
          _operarCuentaCorriente(titular);
        } else {
          print("No se encontró el titular");
        }
        break;
      case 2:
        var titular = getTitular();
        if (titular != null) {
          _operarCuentaAhorro(titular);
        } else {
          print("No se encontró el titular");
        }
        break;
      default:
        print("Opción no válida");
    }
  }

//Realizas todas las acciones de la cuenta corriente
  void _operarCuentaCorriente(Persona titular) {
    bool operar = true;
    var cuentaCorrienteCliente;

    try {
      cuentaCorrienteCliente =
          cuentaCorriente.firstWhere((element) => element.titular == titular);
    } catch (e) {
      print("No se encontró la cuenta corriente asociada a ese NIF");
      return;
    }

    print(cuentaCorrienteCliente);

    while (operar) {
      print("Operaciones de cuenta corriente");
      print("1. Depositar");
      print("2. Retirar");
      print("3. Consultar saldo");
      print("4. Salir");

      var opcion = int.parse(stdin.readLineSync()!);

      switch (opcion) {
        case 1:
          print("Monto a depositar: ");
          var monto = double.parse(stdin.readLineSync()!);
          cuentaCorrienteCliente.depositar(monto);

          print("${cuentaCorrienteCliente.toString()}");

          break;
        case 2:
          print("Monto a retirar: ");
          var monto = double.parse(stdin.readLineSync()!);

          cuentaCorrienteCliente.retirar(monto);

          print("${cuentaCorrienteCliente.toString()}");

          break;
        case 3:
          print("${cuentaCorrienteCliente.toString()}");
          break;
        case 4:
          operar = false;
          break;
        default:
          print("Opción no válida");
      }
    }
  }

//Realiza todas las acciones de la cuenta de ahorros
  void _operarCuentaAhorro(Persona titular) {
    bool operar = true;
    var cuentaAhorroCliente;
    try {
      cuentaAhorroCliente =
          cuentaAhorro.firstWhere((element) => element.titular == titular);
    } catch (e) {
      print("No se encontró la cuenta de ahorro asociada a ese NIF");
      return;
    }

    while (operar) {
      print("Operaciones de cuenta de ahorro");
      print("1. Depositar");
      print("2. Retirar");
      print("3. Consultar saldo");
      print("4. Calcular interés");
      print("5. Cambiar interés");
      var opcion = int.parse(stdin.readLineSync()!);

      switch (opcion) {
        case 1:
          print("Monto a depositar: ");
          var monto = double.parse(stdin.readLineSync()!);
          cuentaAhorroCliente.depositar(monto);

          print("${cuentaAhorroCliente.toString()}");
          break;
        case 2:
          print("Monto a retirar: ");
          var monto = double.parse(stdin.readLineSync()!);
          cuentaAhorroCliente.retirar(monto);

          print("${cuentaAhorroCliente.toString()}");
          break;
        case 3:
          print("Saldo: ${cuentaAhorroCliente.getSaldo()}");
          break;
        case 4:
          print("Interés: ${cuentaAhorroCliente.interes}");
          cuentaAhorroCliente.calcularInteres();

          print("${cuentaAhorroCliente.toString()}");
          break;
        case 5:
          print("Nuevo interés: ");
          var nuevoInteres = double.parse(stdin.readLineSync()!);
          cuentaAhorroCliente.cambiarInteres(nuevoInteres);

          print("Interés actual: ${cuentaAhorroCliente.interes}");

          break;
        default:
          print("Opción no válida");
          operar = false;
      }
    }
  }

//Muestra el menu general y coge la opción elegida.
  void mostrarMenu() {
    while (true) {
      try {
        print("Menú");
        print("1. Alta de banco");
        print("2. Alta de cuenta corriente");
        print("3. Alta de cuenta de ahorro");
        print("4. Operar cuenta");
        print("5. Salir");
        var opcion = int.parse(stdin.readLineSync()!);
        switch (opcion) {
          case 1:
            altaBanco();
            break;
          case 2:
            var exito = altaCuentaCorriente();
            if (exito) {
              print("Cuenta corriente agregada correctamente");
            } else {
              print("No se pudo agregar la cuenta corriente");
            }
            break;
          case 3:
            var exito = altaCuentaAhorro();
            if (exito) {
              print("Cuenta de ahorro agregada correctamente");
            } else {
              print("No se pudo agregar la cuenta de ahorro");
            }
            break;
          case 4:
            elegirCuenta();
            break;
          case 5:
            print("Saliendo del programa");
            return;
          default:
            print("Opción no válida");
        }
      } on FormatException {
        print("Error de formato de entrada, intente de nuevo");
      } catch (e) {
        print("Ocurrió un error : $e");
      }
    }
  }
}

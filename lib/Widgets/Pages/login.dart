// ignore_for_file: use_build_context_synchronously

//admin@megabovino.com.br
//megabovino

import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Services/login_api.dart';
import 'package:mobile_megabovino/Widgets/Pages/home.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  get screenWidth => null;

  get screenHeight => null;

  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "MegaBovino",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          centerTitle: true,
        ),
        body: _body(context));
  }

  _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/background.png'), // Substitua pela localização da sua imagem
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _textFormField("Login", "Digite o Login", controller: _ctrlLogin),
              _textFormField("Senha", "Digite sua Senha",
                  senha: true, controller: _ctrlSenha),
              _raisedButton("Login", Colors.greenAccent, 30, context),
            ],
          ),
        ),
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool senha = false,
    TextEditingController? controller,
    FormFieldValidator? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: senha,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        hintText: hint,
      ),
    );
  }

  _raisedButton(
      String text, Color color, double fontSize, BuildContext context) {
    return ButtonTheme(
      height: 100.0,
      child: ElevatedButton(
        onPressed: () {
          //Ação do botão LOGIN:
          //_clickButton(context);
          _clickButtonTest(context);
        },
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: fontSize),
        ),
      ),
    );
  }

  _clickButtonTest(BuildContext context) async {
    _goToHomePage(context);
    print("Login realizado");
  }

  _clickButton(BuildContext context) async {
    bool formOK = _formKey.currentState!.validate();

    if (!formOK) {
      return;
    }

    String login = _ctrlLogin.text;
    String senha = _ctrlSenha.text;

    print("login : $login  senha: $senha");

    var response = await AuthService().login(login, senha);

    if (response) {
      _goToHomePage(context);
      print("Login realizado");
    } else {
      _userErrorLogin(context);
      print("Senha ou usuário inválido");
    }
  }

  _goToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  _userErrorLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro de Login'),
          content: Text('Usuário ou senha inválido. Tente novamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
                _ctrlLogin.clear(); //Limpa o campo Login
                _ctrlSenha.clear(); //Limpa o campo Senha
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

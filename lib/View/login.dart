import 'package:cursoweb/Controller/user_controller.dart';
import 'package:cursoweb/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  UserController userController = UserController();
  UserModel user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.green)),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Insira suas credenciais',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: TextFormField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green[700],
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: TextFormField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.green[700],
                          )),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('Entrar'),
                      ),
                      onPressed: () async {
                        final result = await userController.login(UserModel(
                            email: _emailTextController.text,
                            password: _passwordTextController.text));
                        if (result) {
                          Navigator.pushNamed(context, '/home');
                        } else {
                          return ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            backgroundColor: Colors.lightGreen,
                            content: Text('E-mail ou senha incorretos...'),
                          ));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

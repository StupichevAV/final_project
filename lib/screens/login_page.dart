import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: '+7 (###) ###-##-##');
  final String _validLogin = "9050976491";
  final String _validPassword = "12345";

  /// Авторизация входа
  void checkLogin() {
    if (maskFormatter.getUnmaskedText() == _validLogin &&
        passwordController.text == _validPassword) {
      Navigator.pushNamed(context, '/users');
    } else {
      // Ошибка авторизации!
      simpleDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, //.red.shade300,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Image.asset(
              'assets/images/profile.png',
              height: 200,
              width: 200,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Вход',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: phoneController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: const Icon(Icons.phone),
                          suffixIcon: phoneController.text.isEmpty
                              ? const Text('')
                              : GestureDetector(
                                  onTap: () {
                                    phoneController.clear();
                                  },
                                  child: const Icon(Icons.close)),
                          hintText: '+7 (___) ___-__-__',
                          labelText: 'Телефон',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1))),
                      inputFormatters: [maskFormatter],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      obscureText: isVisible,
                      controller: passwordController,
                      onChanged: (value) {
                        //print(value);
                      },
                      //
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: 'Введите ваш пароль',
                          labelText: 'Пароль',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 1))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            checkLogin();
                          });
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                          child: Text('Войти'),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // Информация о проекте внизу экрана
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            "Финальный проект на Flutter, 2022",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

/// Простое диалоговое сообщение
Future simpleDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Авторизация'),
        content: const Text('Неверно указан телефон или пароль.'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

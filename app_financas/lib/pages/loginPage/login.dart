import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _marcado = false;

  void funcaoTeste() {
   print('clicou');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    "Bem \nVindo!",
                    style: TextStyle(
                      color: Color(0xff12CC02),
                      fontWeight: FontWeight.w200,
                      fontSize: 48,
                      decoration: TextDecoration.none
                    ),
                  ),
                  SizedBox(width: 20),
                  Image(
                    image: AssetImage('assets/imgs/graficos.png'),
                    width: 200,
                  )
                ],
              ),
              const SizedBox(height: 40),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )
                  ),
                  fillColor: Colors.red,
                  labelText: 'Seu Email',
                  labelStyle: TextStyle(color: Color(0xff12CC02)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff12CC02)),
                  ),
                ),
                style: TextStyle(
                  color: Color(0xff12CC02),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )
                  ),
                  fillColor: Colors.red,
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Color(0xff12CC02)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff12CC02)),
                  ),
                ),
                style: TextStyle(
                  color: Color(0xff12CC02),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: funcaoTeste, 
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff12CC02),
                  padding: const EdgeInsets.only(left: 135, right: 135, top: 15, bottom: 15)
                ),
                child: const Text(
                  "Fazer Login",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Lembrar senha"),
                      activeColor: const Color(0xff12CC02),
                      value: _marcado,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? valor) {},
                    )
                  ),
                  const Text("Esqueceu a senha ?"),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Ou",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 30),
              
              GestureDetector(
                child: const Text(
                  "Cadastrar-se",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff12CC02),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/criarConta');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
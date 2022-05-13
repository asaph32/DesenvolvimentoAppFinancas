import 'package:flutter/material.dart';

class CreateCountPage extends StatefulWidget {
  const CreateCountPage({ Key? key }) : super(key: key);

  @override
  State<CreateCountPage> createState() => _CreateCountPageState();
}

class _CreateCountPageState extends State<CreateCountPage> {

  void funcaoTeste() {
    print('clicou');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
        backgroundColor: const Color(0xff12CC02),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                fillColor: Colors.red,
                labelText: 'Nome',
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
            const SizedBox(height: 30),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                fillColor: Colors.red,
                labelText: 'Email',
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
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: funcaoTeste, 
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff12CC02),
                padding: const EdgeInsets.only(left: 135, right: 135, top: 15, bottom: 15)
              ),
              child: const Text(
                "Criar Conta",
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ),
            const SizedBox(height: 30),
            GestureDetector(
              child: const Text(
                "Ja tenho uma conta? Fazer login.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
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
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                labelText: 'Nome',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                labelText: 'Senha',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: funcaoTeste, 
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
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
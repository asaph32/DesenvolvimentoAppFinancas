import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ListMoedas extends StatefulWidget {
  const ListMoedas({Key? key}) : super(key: key);

  @override
  State<ListMoedas> createState() => _ListMoedasState();
}

class _ListMoedasState extends State<ListMoedas> {

  List<Map> respostaApi = [];
  List<String> moedas = ["USD", "EUR", "BTC"];

  Future<dynamic> consultaMoedas() async {

    for(String moeda in moedas) {
      var url = Uri.parse("https://economia.awesomeapi.com.br/last/$moeda-BRL");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        respostaApi.add(jsonResponse);
      } 
    }
    
    print("$respostaApi");
    return respostaApi;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: consultaMoedas(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          final snackBar = const SnackBar(content: Text("Erro ao carregar moedas"), duration: Duration(seconds: 5),);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        if(snapshot.hasData) {
          return ListView(
            children: [ 
              ListTile(
                title: Text("${snapshot.data[0]['USDBRL']['code']}"),
                subtitle: const Text("USD para BRL"),
                trailing: Text(
                  "R\$ ${snapshot.data[0]['USDBRL']['ask']}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                title: Text("${snapshot.data[1]['EURBRL']['code']}"),
                subtitle: const Text("EUR para BRL"),
                trailing: Text(
                  "R\$ ${snapshot.data[1]['EURBRL']['ask']}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                title: Text("${snapshot.data[2]['BTCBRL']['code']}"),
                subtitle: const Text("BTC para BRL"),
                trailing: Text(
                  "R\$ ${snapshot.data[2]['BTCBRL']['ask']}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ]
          );
          }
        
        return const Center(child: CircularProgressIndicator());

      },
    );
  }
}
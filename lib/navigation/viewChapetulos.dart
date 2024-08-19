import 'package:biblia_v2/model/capitulo.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../config/preferences.dart';
import '../config/requests.dart';

class Viewchapetulos extends StatefulWidget {
  int livro;
  String nameLivro;

  Viewchapetulos({super.key, required this.livro, required this.nameLivro});

  @override
  State<Viewchapetulos> createState() => _ViewchapetulosState();
}

class _ViewchapetulosState extends State<Viewchapetulos> {
  final PageController _controller = PageController();
  final requestsWebServices = RequestsWebServices(WSConstantes.URLBASE);
  List<Capitulo> capitulos = [];

  Future<void> listCapitulos(int idBook) async {
    try {
      final body = {
        WSConstantes.ID_BOOK: idBook,
        WSConstantes.TOKENID: WSConstantes.TOKEN,
      };
      setState(() {
        capitulos.clear();
      });
      final List<dynamic> decodedResponse = await requestsWebServices
          .sendPostRequestList(WSConstantes.LIST_CAPITULOS, body);
      if (decodedResponse.isNotEmpty) {
        for (final iten in decodedResponse) {
          final categoria = Capitulo.fromJson(iten);
          setState(() {
            capitulos.add(categoria);
          });
        }
        //listCategory();
      } else {
        print('NULO');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  @override
  void initState() {
    listCapitulos(widget.livro);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return capitulos.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                widget.nameLivro.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            )),
            body: Column(
              children: [
            Expanded(
            child: PageView.builder(
            controller: _controller,
              itemCount: capitulos.length,
              itemBuilder: (context, index) {
                final capitulo = capitulos[index];
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Capítulo ${capitulo.chapter}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: capitulo.verses?.asMap().entries.map((entry) {
                              final verseIndex = entry.key + 1; // Índice do verso, começando de 1
                              final verse = entry.value;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 20),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '$verseIndex. ', // Número do verso
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: verse.text ?? '',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          height: 1.5, // Ajusta o espaçamento entre linhas
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList() ?? [],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    ),
              ],
            ),
          );
  }
}

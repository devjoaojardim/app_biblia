import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../config/constants.dart';
import '../config/requests.dart';
import '../model/versosearch.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final requestsWebServices = RequestsWebServices(WSConstantes.URLBASE);
  List<VersosSearch> versos = [];

  Future<void> listBooks(String name) async {
    try {
      final body = {
        WSConstantes.SEARCH: name,
        WSConstantes.TOKENID: WSConstantes.TOKEN,
      };
      setState(() {
        versos.clear();
      });
      final List<dynamic> decodedResponse = await requestsWebServices
          .sendPostRequestList(WSConstantes.PESQUISAR_BOOKS, body);
      if (decodedResponse.isNotEmpty) {
        for (final iten in decodedResponse) {
          final categoria = VersosSearch.fromJson(iten);
          setState(() {
            versos.add(categoria);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Image.asset(
          'image/icone-biblia.png',
          color: Colors.black,
          width: 60,
          height: 60,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(25), // Define o raio das bordas
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    onChanged: (String name) {
                      listBooks(name);
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar versiculo...',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder
                          .none, // Remove a linha inferior padrão do TextField
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: versos.isNotEmpty
                  ? VersosListView(verses: versos)
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hourglass_empty_outlined),
                        Text('Nenhum versiculo encontrado')
                        
                      ],
                    ))
        ],
      ),
    );
  }
}

class VersosListView extends StatelessWidget {
  final List<VersosSearch> verses;

  VersosListView({required this.verses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: verses.length,
      itemBuilder: (context, index) {
        final verse = verses[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Card(
            color: Colors.white,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          verse.text ?? '',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '${verse.book ?? ''} ${verse.chapter ?? ''} - ${verse.verse ?? ''}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Implementar a funcionalidade de compartilhar aqui
                      final String verseText = verse.text ?? '';
                      final String bookName = verse.book ?? '';
                      final int chapter = verse.chapter ?? 0;
                      final int verseNumber = verse.verse ?? 0;
                      final String shareText =
                          '"$verseText"\n$bookName $chapter:$verseNumber';
                      // Chame a função de compartilhamento
                      _shareVerse(shareText);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _shareVerse(String text) {
    // Implementar a funcionalidade de compartilhamento
    print('Compartilhar: $text');
    Share.share(text);
    // Use o plugin de compartilhamento para compartilhar o texto
    // Exemplo: Share.share(text);
  }
}

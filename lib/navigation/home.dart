import 'dart:convert';

import 'package:biblia_v2/model/category.dart';
import 'package:biblia_v2/navigation/Search.dart';
import 'package:biblia_v2/navigation/books_category.dart';
import 'package:biblia_v2/navigation/viewChapetulos.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../config/constants.dart';
import '../config/preferences.dart';
import '../config/requests.dart';
import '../model/books.dart';
import '../model/versosearch.dart';
import '../util/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final requestsWebServices = RequestsWebServices(WSConstantes.URLBASE);
  List<Books> booksCategory = [];
  VersosSearch? versos;

  Future<void> listBooks() async {
    try {
      final body = {
        // WSConstantes.ID_CATEGORYY: idCateogria,
        WSConstantes.TOKENID: WSConstantes.TOKEN,
      };
      setState(() {
        booksCategory.clear();
      });
      final List<dynamic> decodedResponse = await requestsWebServices
          .sendPostRequestList(WSConstantes.LIST_BOOKS, body);
      if (decodedResponse.isNotEmpty) {
        for (final iten in decodedResponse) {
          final categoria = Books.fromJson(iten);
          setState(() {
            booksCategory.add(categoria);
          });
        }
        randomVerse();
        listCategory();
      } else {
        print('NULO');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  List<Category> category = [];

  Future<void> listCategory() async {
    try {
      final body = {
        // WSConstantes.ID_CATEGORYY: idCateogria,
        WSConstantes.TOKENID: WSConstantes.TOKEN,
      };
      setState(() {
        category.clear();
      });
      final List<dynamic> decodedResponse = await requestsWebServices
          .sendPostRequestList(WSConstantes.CATEGORYS, body);
      if (decodedResponse.isNotEmpty) {
        for (final iten in decodedResponse) {
          final categoria = Category.fromJson(iten);
          setState(() {
            category.add(categoria);
          });
        }
      } else {
        print('NULO');
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> randomVerse() async {
    Preferences.init();

      try {
        final body = {

          WSConstantes.TOKENID: WSConstantes.TOKEN
        };

        final response =
        await requestsWebServices.sendPostRequest(WSConstantes.VERSOS_ALEATORIO, body);

        final decodedResponse = jsonDecode(response);

        setState(() {
          versos = VersosSearch.fromJson(decodedResponse);
        });


      } catch (e) {

      } finally {

      }

  }

  @override
  void initState() {
    listBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: Container(),
        title: 
        Image.asset('image/icone-biblia.png', color: Colors.white, width: 60, height: 60,),
      ),
      body: versos != null
          ? Column(
        children: [
          Expanded(
            //  height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      // Define o raio das bordas
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.search_rounded),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Pesquisar...',
                            style: TextStyle(
                                fontSize: 14,
                                color: MyColors.black,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(left: 8),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryBookList(idCategoria: category[index].id!)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                // Define o raio das bordas
                                border:
                                Border.all(color: Colors.black, width: 1),
                              ),
                              child: Text(
                                category[index].name!,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: MyColors.black,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Versiculo do momento',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  Text(
                                    versos!.text ?? '',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '${versos!.book ?? ''} ${versos!.chapter ?? ''} - ${versos!.verse ?? ''}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: () {
                                    // Implementar a funcionalidade de compartilhar aqui
                                    final String verseText = versos!.text ?? '';
                                    final String bookName = versos!.book ?? '';
                                    final int chapter = versos!.chapter ?? 0;
                                    final int verseNumber = versos!.verse ?? 0;
                                    final String shareText =
                                        '"$verseText"\n$bookName $chapter:$verseNumber';
                                    // Chame a função de compartilhamento
                                    _shareVerse(shareText);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text(
                          'Livros',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        // Número de colunas
                        crossAxisSpacing: 8.0,
                        // Espaçamento horizontal entre os itens
                        mainAxisSpacing: 7.0,
                        // Espaçamento vertical entre os itens
                        childAspectRatio:
                        4 /
                            4.5, // Proporção de aspecto de cada item (largura/altura)
                      ),
                      itemCount: booksCategory.length,
                      itemBuilder: (context, index) {
                        final book = booksCategory[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Viewchapetulos(livro: book.id! - 1, nameLivro: book.name!,)));
                          },
                          child: BooksWidget(
                              book.name!, book.abbrev!, Colors.red, index),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16,)
                ],
              ))
        ],
      )
          : CircularProgressIndicator(
              color: Colors.white,
            ),
    );
  }
  void _shareVerse(String text) {
    // Implementar a funcionalidade de compartilhamento
    print('Compartilhar: $text');
    Share.share(text);
    // Use o plugin de compartilhamento para compartilhar o texto
    // Exemplo: Share.share(text);
  }

  Color getBookColor(String abbrev) {
    switch (abbrev.toLowerCase()) {
    // Pentateuco
      case 'gn': // Gênesis
      case 'ex': // Êxodo
      case 'lv': // Levítico
      case 'nm': // Números
      case 'dt': // Deuteronômio
        return Colors.pink.shade400;

    // Livros Históricos
      case 'js': // Josué
      case 'jz': // Juízes
      case 'rt': // Rute
      case '1sm': // 1 Samuel
      case '2sm': // 2 Samuel
      case '1rs': // 1 Reis
      case '2rs': // 2 Reis
      case '1cr': // 1 Crônicas
      case '2cr': // 2 Crônicas
      case 'ed': // Esdras
      case 'ne': // Neemias
      case 'et': // Ester
      case 'at': // Atos
        return Colors.red.shade400;

    // Livros Poéticos
      case 'job': // Jó
      case 'sl': // Salmos
      case 'pv': // Provérbios
      case 'ec': // Eclesiastes
      case 'ct': // Cânticos
        return Colors.lightGreen.shade400;

    // Profetas Maiores
      case 'is': // Isaías
      case 'jr': // Jeremias
      case 'lm': // Lamentações
      case 'ez': // Ezequiel
      case 'dn': // Daniel
        return Colors.green.shade400;

    // Profetas Menores
      case 'os': // Oséias
      case 'jl': // Joel
      case 'am': // Amós
      case 'ob': // Obadias
      case 'jn': // Jonas
      case 'mq': // Miquéias
      case 'na': // Naum
      case 'hc': // Habacuque
      case 'sf': // Sofonias
      case 'ag': // Ageu
      case 'zc': // Zacarias
      case 'ml': // Malaquias
        return Colors.orange.shade300;

      case 'mt': // Mateus
      case 'mc': // Marcos
      case 'lc': // Lucas
      case 'jo': // Malaquias
        return Colors.yellow.shade700;

    // Epístolas
      case 'rm': // Romanos
      case '1co': // 1 Coríntios
      case '2co': // 2 Coríntios
      case 'gl': // Gálatas
      case 'ef': // Efésios
      case 'fp': // Filipenses
      case 'cl': // Colossenses
      case '1ts': // 1 Tessalonicenses
      case '2ts': // 2 Tessalonicenses
      case '1tm': // 1 Timóteo
      case '2tm': // 2 Timóteo
      case 'tt': // Tito
      case 'fm': // Filemom
        return Colors.blue.shade400;
      case 'hb': // Hebreus
      case 'tg': // Tiago
      case '1pe': // 1 Pedro
      case '2pe': // 2 Pedro
      case '1jo': // 1 João
      case '2jo': // 2 João
      case '3jo': // 3 João
      case 'jd': // Judas
        return Colors.blue.shade800;

    // Revelação
      case 'ap': // Apocalipse
        return Colors.grey;

    // Cor padrão
      default:
        return Colors.grey;
    }
  }

  String getCategory(String abbrev) {
    switch (abbrev.toLowerCase()) {
    // Pentateuco
      case 'gn': // Gênesis
      case 'ex': // Êxodo
      case 'lv': // Levítico
      case 'nm': // Números
      case 'dt': // Deuteronômio
        return 'Pentateuco';

    // Livros Históricos
      case 'js': // Josué
      case 'jz': // Juízes
      case 'rt': // Rute
      case '1sm': // 1 Samuel
      case '2sm': // 2 Samuel
      case '1rs': // 1 Reis
      case '2rs': // 2 Reis
      case '1cr': // 1 Crônicas
      case '2cr': // 2 Crônicas
      case 'ed': // Esdras
      case 'ne': // Neemias
      case 'et': // Ester
      case 'at': // Atos
        return 'Históricos';

    // Livros Poéticos
      case 'job': // Jó
      case 'sl': // Salmos
      case 'pv': // Provérbios
      case 'ec': // Eclesiastes
      case 'ct': // Cânticos
        return 'Poéticos';

    // Profetas Maiores
      case 'is': // Isaías
      case 'jr': // Jeremias
      case 'lm': // Lamentações
      case 'ez': // Ezequiel
      case 'dn': // Daniel
        return 'Profetas\nMaiores';

    // Profetas Menores
      case 'os': // Oséias
      case 'jl': // Joel
      case 'am': // Amós
      case 'ob': // Obadias
      case 'jn': // Jonas
      case 'mq': // Miquéias
      case 'na': // Naum
      case 'hc': // Habacuque
      case 'sf': // Sofonias
      case 'ag': // Ageu
      case 'zc': // Zacarias
      case 'ml': // Malaquias
        return 'Profetas\nMenores';

      case 'mt': // Mateus
      case 'mc': // Marcos
      case 'lc': // Lucas
      case 'jo': // Malaquias
        return 'Evangelhos';

    // Epístolas
      case 'rm': // Romanos
      case '1co': // 1 Coríntios
      case '2co': // 2 Coríntios
      case 'gl': // Gálatas
      case 'ef': // Efésios
      case 'fp': // Filipenses
      case 'cl': // Colossenses
      case '1ts': // 1 Tessalonicenses
      case '2ts': // 2 Tessalonicenses
      case '1tm': // 1 Timóteo
      case '2tm': // 2 Timóteo
      case 'tt': // Tito
      case 'fm': // Filemom
        return 'Epístolas';
      case 'hb': // Hebreus
        return 'Epístolas';
      case 'tg': // Tiago
      case '1pe': // 1 Pedro
      case '2pe': // 2 Pedro
      case '1jo': // 1 João
      case '2jo': // 2 João
      case '3jo': // 3 João
      case 'jd': // Judas
        return 'Epístolas';

    // Revelação
      case 'ap': // Apocalipse
        return 'Revelação';

    // Cor padrão
      default:
        return '';
    }
  }

  Widget BooksWidget(String name, String abreviado, Color cor, int index) {
    return Stack(
      children: [
        // Fundo do livro
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
            color: getBookColor(abreviado),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(3, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        // Nome do livro no centro
        Positioned(
          top: 8,
          right: 8,
          child: Text(
            '${index + 1}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Text(
            getCategory(abreviado),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned.fill(child: Center(
          child: Text(
    abreviado == 'job' ? 'JÓ' : abreviado.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),),
        Positioned.fill(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),

                Column(
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

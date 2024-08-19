import 'package:biblia_v2/model/category.dart';
import 'package:biblia_v2/navigation/viewChapetulos.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../config/requests.dart';
import '../model/books.dart';
import '../util/colors.dart';

class CategoryBookList extends StatefulWidget {
  int idCategoria;

  CategoryBookList({super.key, required this.idCategoria});

  @override
  State<CategoryBookList> createState() => _CategoryBookListState();
}

class _CategoryBookListState extends State<CategoryBookList> {
  final requestsWebServices = RequestsWebServices(WSConstantes.URLBASE);
  List<Books> booksCategory = [];

  Future<void> listBooks(int idCategoria) async {
    try {
      final body = {
        WSConstantes.ID_CATEGORYY: idCategoria,
        WSConstantes.TOKENID: WSConstantes.TOKEN,
      };
      setState(() {
        booksCategory.clear();
      });
      final List<dynamic> decodedResponse = await requestsWebServices
          .sendPostRequestList(WSConstantes.LIST_BOOKS_BY_CATEOGRY, body);
      if (decodedResponse.isNotEmpty) {
        for (final iten in decodedResponse) {
          final categoria = Books.fromJson(iten);
          setState(() {
            booksCategory.add(categoria);
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
    listBooks(widget.idCategoria);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Image.asset(
          'image/icone-biblia.png',
          color: Colors.white,
          width: 60,
          height: 60,
        ),
      ),
      body: booksCategory.isNotEmpty
          ? Column(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // Número de colunas
                          crossAxisSpacing: 8.0,
                          // Espaçamento horizontal entre os itens
                          mainAxisSpacing: 7.0,
                          // Espaçamento vertical entre os itens
                          childAspectRatio: 4 /
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
                    )
                  ],
                ))
              ],
            )
          : CircularProgressIndicator(
              color: Colors.white,
            ),
    );
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
        return Colors.yellow.shade600;

      case 'mt': // Mateus
      case 'mc': // Marcos
      case 'lc': // Lucas
      case 'jo': // Malaquias
        return Colors.yellow.shade800;

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
        Positioned.fill(
          child: Center(
            child: Text(
              abreviado == 'job' ? 'JÓ' : abreviado.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
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
                    SizedBox(
                      height: 8,
                    ),
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

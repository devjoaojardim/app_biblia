import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestsWebServices {
  final String urlBase;

  RequestsWebServices(this.urlBase);

  Future<Map<String, dynamic>> sendPhotosAd(String urlResquet, String token, File files, int idUser, String idPedido) async {
    try {
      final url = Uri.parse(urlBase + urlResquet);

      final request = http.MultipartRequest('POST', url);

      request.fields['id_user'] = idUser.toString();
      request.fields['id_Pedido'] = idPedido.toString();
      request.fields['token'] = token;
      request.files.add(await http.MultipartFile.fromPath('url', files.path));



      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print('Conteúdo do corpo da requisição: ${request.fields}');
      print(url);
      print(responseString + " " + response.statusCode.toString());

      if (response.statusCode == 200) {
        final responseBody = json.decode(responseString);
        return responseBody;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
      throw Exception('Erro durante a requisição: $e');
    }
  }


  Future<List> sendMessage({
    required String urlResquet,
    required String token,
    required int idDe,
    required int idPara,
    required int type,
    required String mensagem,
  }) async {
    try {
      final url = Uri.parse(urlBase + urlResquet);

      final request = http.MultipartRequest('POST', url);
      request.fields['token'] = token;
      request.fields['id_de'] = idDe.toString();
      request.fields['id_para'] = idPara.toString();
      request.fields['type'] = type.toString();
      request.fields['mensagem'] = mensagem;



      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print('Conteúdo do corpo da requisição: ${request.fields}');
      print(url);
      print(responseString + " " + response.statusCode.toString());

      if (response.statusCode == 200) {
        final responseBody = json.decode(responseString);
        return responseBody;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
      throw Exception('Erro durante a requisição: $e');
    }
  }

  Future<String> sendPostRequest(String urlResquet, dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse(urlBase + urlResquet),

        body: jsonEncode(body),
      );
      print(urlBase + urlResquet);
      print(response.body.toString() + " " + response.statusCode.toString());
      print(jsonEncode(body));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante a solicitação POST: $e');
    }
  }

  Future<Map<String, dynamic>> getAddressFromCEP(String cep) async {
    try {
      final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return responseBody;
      } else {
        throw Exception('Falha na solicitação GET: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante a requisição GET: $e');
    }
  }

  Future<List<dynamic>> sendPostRequestList(String urlResquet, dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse(urlBase + urlResquet),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print(urlBase + urlResquet);
      print(response.body.toString() + " " + response.statusCode.toString());
      print(body);
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return responseBody;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante a solicitação POST: $e');
    }
  }

  Future<List<List<String>>> sendPostRequestListList(String urlRequest, dynamic body) async {
    try {
      final response = await http.get(
        Uri.parse(urlBase + urlRequest),
        headers: {'Content-Type': 'application/json'},
       // body: jsonEncode(body),
      );
      print(urlBase + urlRequest);
      print(response.body.toString() + " " + response.statusCode.toString());
      print(body);

      if (response.statusCode == 200) {
        // Decodificando o corpo da resposta como uma lista de listas de strings
        // Decodificando o corpo da resposta e convertendo a codificação, se necessário
        final responseBody = utf8.decode(response.bodyBytes);
        final jsonBody = json.decode(responseBody) as List<dynamic>;
        //final responseBody = json.decode(response.body) as List<dynamic>;

        // Convertendo cada item da lista para uma lista de strings
        final result = jsonBody.map<List<String>>(
              (item) => (item as List<dynamic>).map((e) => e.toString()).toList(),
        ).toList();

        return result;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante a solicitação POST: $e');
    }
  }


  Future<String> loginRequestData(String user, String password, String token) async {
    try {
      final url = Uri.parse('$urlBase/login?user=$user&password=$password&token=$token');

      final response = await http.post(url);
      print('$urlBase/login?user=$user&password=$password&token=$token');
      print(response.body.toString() + " " + response.statusCode.toString());
      if (response.statusCode == 200) {
        return response.body.toString();
      } else if(response.statusCode == 401){
        return response.body.toString();
      }
      else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }

    } catch (e) {
      print('Erro durante a requisição: $e');
      throw Exception('Erro durante a requisição: $e');
    }
  }

  Future<dynamic> sendFileToAPI({required String token, required int userId, required File fileUrl}) async {
    try {
      final url = Uri.parse('${urlBase}usuarios/updateavatar/');

      final request = http.MultipartRequest('POST', url);
      final file = fileUrl;
      request.files.add(await http.MultipartFile.fromPath('url', file.path));
      request.fields['token'] = token;
      request.fields['id_user'] = userId.toString();



      final response = await request.send();
      final responseString = await response.stream.bytesToString();


      print('Conteúdo do corpo da requisição: ${request.fields}');
      print(url);
      print(responseString + " " + response.statusCode.toString());
      if (response.statusCode == 200) {
        final responseBody = json.decode(responseString);
        return responseBody;
      } else {
        throw Exception('Falha na solicitação POST: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
      throw Exception('Erro durante a requisição: $e');
    }
  }
}

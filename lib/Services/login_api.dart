import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class AuthService {
  final String apiUrl = 'http://localhost:8181/security/authenticate/jwt/user';
  final String appId = 'CUSTOMER_WEB_APPLICATION';

  // Função para fazer login
  Future<bool> login(String username, String password) async {
    try {
      // Cria a requisição com os parâmetros de usuário e senha
      var dio = Dio();
      var data = {
        'username': username,
        'password': password,
      };
      final response = await dio.get(apiUrl,
          options: Options(headers: {
            'MEGABOVINO_APPLICATION_ID': appId,
            'Content-Type': 'application/json',
          }),
          queryParameters: data);

      if (response.statusCode == 200) {
        // A resposta foi bem-sucedida
        final Map<String, dynamic> responseData = response.data;

        if (responseData.containsKey('token')) {
          // Armazena o token no SharedPreferences
          await _saveToken(responseData['token']);
          print(responseData['token']);
          return true;
        } else {
          // A resposta não contém a chave 'token'
          print('Erro no login: Token não encontrado na resposta');
          return false;
        }
      } else {
        // Houve um erro no login
        print('Erro no login: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro no login: $e');
      return false;
    }
  }

  // Função para obter o token armazenado
  Future<String?> _getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Função para armazenar o token
  Future<void> _saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  // Função para fazer chamadas de API autenticadas
  Future<void> fetchData() async {
    try {
      final String? token = await _getToken();

      if (token != null) {
        final response = await http.get(
          Uri.parse(apiUrl),
          headers: {
            'MEGABOVINO_APPLICATION_ID': appId,
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          // A resposta foi bem-sucedida
          final Map<String, dynamic> data = json.decode(response.body);
          print('Resposta do servidor: $data');
        } else {
          // Houve um erro na chamada
          print('Erro na chamada: ${response.statusCode}');
        }
      } else {
        print('Token não encontrado. Faça login primeiro.');
      }
    } catch (e) {
      print('Erro na chamada: $e');
    }
  }
}

import 'package:app_fullmedcare_v1/src/data/model/address.dart';
import 'package:dio/dio.dart';

class SearchCep {
  final dio = Dio();

  Future<Address> fetchData(String cep) async {
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');

      if (response.statusCode == 200) {
        return Address.fromMap(response.data);
      } else {
        throw 'Erro do servidor: ${response.statusCode}';
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Conexão expirada. Verifique sua internet.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Tempo de resposta do servidor excedido.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception(
            'Erro na resposta: ${e.response?.statusCode} - ${e.response?.statusMessage}');
      } else if (e.type == DioExceptionType.cancel) {
        throw Exception('Requisição cancelada.');
      } else {
        throw Exception('Erro inesperado: ${e.message}');
      }
    } catch (e) {
      throw Exception('Cep não encontrado');
    }
  }
}

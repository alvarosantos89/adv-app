import 'package:mobile_megabovino/Widgets/Functions/Execucao/item.dart';

class DatabaseExecucao {
  Future<List<Item>> obterItensDaApi() async {
    // ignore: prefer_const_declarations
    /*final response = await http.get(Uri.parse('www.api.com'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      return List<Item>.from(data.map((item) {
        return Item(
          id: item['id'],
          nome: item['nome'],
          descricao: item['descricao'],
        );
      }));
    } else {
      throw Exception('Erro ao obter dados da API');
    }*/

    return List<Item>.from({
      Item(
        id: 01,
        nome: 'Nome1',
        descricao: 'Descricao1',
      ),
      Item(
        id: 02,
        nome: 'Nome2',
        descricao: 'Descricao2',
      ),
      Item(
        id: 03,
        nome: 'Nome3',
        descricao: 'Descricao3',
      ),
    });
  }
}

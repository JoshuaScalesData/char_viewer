import 'dart:convert';
import 'package:http/http.dart' as http;

class CharacterApi {
  final String baseUrl;

  CharacterApi(this.baseUrl);

  Future<List<Map<String, dynamic>>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl'));

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> characterList =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      return characterList;
    } else {
      throw Exception('Failed to fetch characters');
    }
  }
}

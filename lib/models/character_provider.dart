import 'package:flutter/foundation.dart';
import '../data/character_api.dart';
import '../models/character.dart';

class CharacterProvider extends ChangeNotifier {
  final CharacterApi _characterApi;
  List<Character> _characters = [];

  CharacterProvider(this._characterApi);

  List<Character> get characters => _characters;

  Future<void> fetchCharacters() async {
    try {
      _characters = (await _characterApi.fetchCharacters()).cast<Character>();
      notifyListeners();
    } catch (error) {
      // Handle the error here, e.g., show an error message.
    }
  }
}

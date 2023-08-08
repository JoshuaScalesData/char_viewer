import 'package:flutter/material.dart';

import '../models/character.dart';
import 'character_detail.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({required Key key, required this.title})
      : super(key: key);

  final String title;

  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<Character> characters = []; // List to hold characters

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when screen is initialized
  }

  Future<void> fetchData() async {
    // Simulate fetching data from API
    await Future.delayed(Duration(seconds: 2));

    // Replace this with actual API call to fetch characters
    final List<Map<String, dynamic>> apiResponse = [
      {
        "Title": "Homer Simpson",
        "Description": "The lovable father of the Simpson family.",
        "Icon":
            "http://www.trbimg.com/img-573a089a/turbine/ct-homer-simpson-live-pizza-debate-met-0517-20160516"
      },
      {
        "Title": "Marge Simpson",
        "Description": "The caring mother of the Simpson family.",
        "Icon":
            "https://www.clipartkey.com/mpngs/m/109-1094365_marge-simpson.png"
      },
      // Add more characters
    ];

    // Convert API response to Character objects
    List<Character> charactersList =
        apiResponse.map((data) => Character.fromJson(data)).toList();

    setState(() {
      characters = charactersList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CharacterDetailScreen(character: characters[index]);
                  },
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(characters[index].title),
                  subtitle: Text(characters[index].description),
                  leading: Image.network(
                    characters[index].icon.isNotEmpty
                        ? characters[index].icon
                        : 'https://img04.deviantart.net/fbc4/i/2011/035/2/1/the_simpsons_icon_pack_by_orchid975-d38rj2f.png',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/character_api.dart';
import 'models/character_provider.dart';
import 'screens/character_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterProvider(CharacterApi(
              'http://api.duckduckgo.com/?q=simpsons+characters&format=json&pretty=1')),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character Viewer',
      home: CharacterListScreen(),
    );
  }
}

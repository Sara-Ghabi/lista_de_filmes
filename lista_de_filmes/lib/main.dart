import 'package:flutter/material.dart';
import 'package:lista_de_filmes/movie_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF151730),
        colorScheme: const ColorScheme.dark(primary: Color(0xffbb06fc)),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF151730)),
        useMaterial3: true,
      ),
      home: const MovieListPage(),
    );
  }
}

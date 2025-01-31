import 'package:flutter/material.dart';
import 'package:lista_de_filmes/pages/movie_list/movie_list_page.dart';
import 'package:lista_de_filmes/service_locator.dart';

void main() {
  setUpGetIt();
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

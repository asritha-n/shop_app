import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/pages/home_page.dart';
//import 'package:shop_app/product_details.dart';
//import 'package:shop_app/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //for multiple providers in bigger apps.
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          fontFamily: 'CormorantGaramond',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(172, 120, 186, 1),
            primary: Color.fromRGBO(172, 120, 186, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_inventario/providers/update_navigation_bar_provider.dart';
import 'package:flutter_application_inventario/providers/product_provider.dart';
import 'package:flutter_application_inventario/screens/home_page.dart';
import 'package:flutter_application_inventario/screens/screen_my_account.dart';
import 'package:flutter_application_inventario/screens/screen_add_product.dart';
import 'package:flutter_application_inventario/widgets/custom_navigation_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ActualizarNavegacionProvider(),
      child: ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> _screens = [
    const HomePage(),
    const ScreenAddProduct(),
    ScreenMyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ActualizarNavegacionProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: _screens[provider.indicePagina], // Muestra la pantalla correcta
          bottomNavigationBar: const CustomNavigationBar(), // Se coloca aquí
        );
      },
    );
  }
}

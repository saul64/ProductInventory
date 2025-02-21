import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/update_navigation_bar_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ActualizarNavegacionProvider>(
      builder: (context, provider, child) {
        return BottomNavigationBar(
          currentIndex: provider.indicePagina,
          onTap: (valorSeleccionado) {
            provider.actualizarIndice(valorSeleccionado);
          },
          elevation: 8,
          backgroundColor: Colors.indigo,  // Color de fondo de la barra
          selectedItemColor: Colors.white, // Color para el ítem seleccionado
          unselectedItemColor: Colors.grey, // Color para ítem no seleccionado
          selectedFontSize: 14.0,  // Tamaño de texto del ítem seleccionado
          unselectedFontSize: 12.0,  // Tamaño de texto del ítem no seleccionado
          showSelectedLabels: true, // Mostrar las etiquetas
          showUnselectedLabels: true, // Mostrar las etiquetas no seleccionadas
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 30),  // Icono Home
              label: "Productos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 30),  // Icono Add
              label: "Agregar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),  // Icono Settings
              label: "Cuenta",
            ),
          ],
        );
      },
    );
  }
}

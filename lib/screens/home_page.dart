import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'screen_details_products.dart';  // Importamos la pantalla de detalles

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Productos")),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          final products = productProvider.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: product.imagePath.isNotEmpty
                    ? Image.file(
                        File(product.imagePath),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image_not_supported), // Si no hay imagen, mostrar ícono
                title: Text(product.name),
                subtitle: Text("Precio: \$${product.price}, Cantidad: ${product.quantity}"),
                onTap: () {
                  // Navegar a la pantalla de detalles del producto y pasar el producto seleccionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenDetailsProducts(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

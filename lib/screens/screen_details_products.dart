import 'dart:io';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ScreenDetailsProducts extends StatelessWidget {
  final Product product;

  const ScreenDetailsProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: product.name);
    final priceController = TextEditingController(text: product.price.toString());
    final quantityController = TextEditingController(text: product.quantity.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del Producto"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nombre: ${product.name}", style: TextStyle(fontSize: 18)),
              Text("Precio: \$${product.price}", style: TextStyle(fontSize: 18)),
              Text("Cantidad: ${product.quantity}", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              product.imagePath.isNotEmpty
                  ? Image.file(
                      File(product.imagePath),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image_not_supported), // Si no hay imagen, mostrar ícono

              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nombre Producto"),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Precio"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Cantidad"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      final updatedProduct = Product(
                        name: nameController.text,
                        price: double.tryParse(priceController.text) ?? product.price,
                        quantity: int.tryParse(quantityController.text) ?? product.quantity,
                        imagePath: product.imagePath,
                      );

                      // Actualizar el producto en el proveedor
                      productProvider.removeProduct(product.name);
                      productProvider.addProduct(updatedProduct);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Producto actualizado correctamente!')),
                      );

                      Navigator.pop(context);
                    },
                    child: const Text("Actualizar Producto"),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      // Eliminar el producto
                      productProvider.removeProduct(product.name);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Producto eliminado correctamente!')),
                      );

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Eliminar Producto"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

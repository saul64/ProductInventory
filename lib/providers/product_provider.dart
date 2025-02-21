// providers/product_provider.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  // Lista interna de productos
  List<Product> _products = [];

  // Getter para acceder a los productos
  List<Product> get products => _products;

  // Método para agregar un nuevo producto
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();  // Notifica a los widgets que se debe actualizar la UI
  }

  // Método para eliminar un producto por nombre
  void removeProduct(String productName) {
    _products.removeWhere((product) => product.name == productName);
    notifyListeners();
  }
}

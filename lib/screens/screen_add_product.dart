import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';

class ScreenAddProduct extends StatefulWidget {
  const ScreenAddProduct({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenAddProductState createState() => _ScreenAddProductState();
}

class _ScreenAddProductState extends State<ScreenAddProduct> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  File? _selectedImage; // Variable para almacenar la imagen seleccionada

  final ImagePicker _picker = ImagePicker();

  //Seleccionando la img desde galeria
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agregar Productos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            return Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Nombre Producto"),
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: "Precio"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: "Cantidad"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                
                // Mostrar imagen seleccionada o botón para elegir imagen
                _selectedImage != null
                    ? Image.file(_selectedImage!, height: 100)
                    : ElevatedButton(
                        onPressed: _pickImage,
                        child: const Text("Seleccionar Imagen"),
                      ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text.trim();
                    final priceString = _priceController.text.trim();
                    final quantityString = _quantityController.text.trim();

                    if (name.isEmpty || priceString.isEmpty || quantityString.isEmpty || _selectedImage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('All fields and image are required!')),
                      );
                      return;
                    }

                    final price = double.tryParse(priceString) ?? 0;
                    final quantity = int.tryParse(quantityString) ?? 0;

                    if (price <= 0 || quantity <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid price or quantity!')),
                      );
                      return;
                    }

                    final newProduct = Product(
                      name: name,
                      price: price,
                      quantity: quantity,
                      imagePath: _selectedImage!.path, // Guardamos la ruta de la imagen
                    );

                    productProvider.addProduct(newProduct);

                    _nameController.clear();
                    _priceController.clear();
                    _quantityController.clear();
                    _selectedImage = null;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Product added successfully!')),
                    );
                    setState(() {});
                  },
                  child: const Text("Agregar Producto"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

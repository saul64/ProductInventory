class Product {
  final String name;
  final double price;
  final int quantity;
  final String imagePath; // Nueva propiedad para la imagen

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imagePath, // Asegúrate de inicializarla
  });
}

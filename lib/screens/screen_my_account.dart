import 'package:flutter/material.dart';

class ScreenMyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Cuenta")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // mi foto de perfil
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            // Información del usuario
            Text("Saúl Aparicio", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Edad: 21", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            Text("Sexo: Masculino", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            Text("Correo: saul@example.com", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            const SizedBox(height: 20),
            
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text("Seguridad"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text("Términos y Condiciones"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text("Cerrar Sesión", style: TextStyle(color: Colors.red)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.switch_account),
                    title: Text("Cambiar de Cuenta"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

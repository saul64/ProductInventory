import 'package:flutter/material.dart';

class ActualizarNavegacionProvider extends ChangeNotifier{
  int _indicePagina = 0;

  int get indicePagina => _indicePagina;

  void actualizarIndice(int value){
    _indicePagina = value;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      fixedColor: Colors.red,
      unselectedItemColor: Colors.grey.shade700,
      backgroundColor: Colors.white,
      //onTap: (opcao) => setState(() => _opcaoselecionada = opcao),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded), label: 'Inicío'),
        BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded), label: 'Pedidos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded), label: 'Perfil'),
      ],
    );
  }
}

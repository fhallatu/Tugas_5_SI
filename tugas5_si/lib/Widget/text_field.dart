import 'package:flutter/material.dart';

class TextSearch extends StatelessWidget {
  const TextSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.purple),
        prefixIcon: const Icon(Icons.search, color: Colors.purple),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

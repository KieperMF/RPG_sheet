import 'package:flutter/material.dart';

class SavedAlert extends StatelessWidget {
  const SavedAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text(
        "Ficha Salva com Sucesso",
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK")),
      ],
    );
  }
}

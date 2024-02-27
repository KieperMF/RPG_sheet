import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rpg_sheet/management_mobx/management.dart';



class AlertCustom extends StatefulWidget {
  const AlertCustom({super.key});

  @override
  State<AlertCustom> createState() => _AlertCustomState();
}

class _AlertCustomState extends State<AlertCustom> {
  final management = Management();
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AlertDialog(
          content: const Text("Tem Certeza que deseja excluir todas as fichas?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar")),
            TextButton(
                onPressed: () {
                  
                  setState(() {
                    management.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("Excluir"))
          ],
        );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rpg_sheet/boxes.dart';

class AlertCustom extends StatelessWidget {
  const AlertCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:const Text("Tem Certeza que deseja excluir todas as fichas?"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child:const Text("Cancelar")),
        TextButton(onPressed: (){
            charactersSheets.clear();
          Navigator.of(context).pop();
        }, child:const Text("Excluir"))
      ],
    );
  }
}
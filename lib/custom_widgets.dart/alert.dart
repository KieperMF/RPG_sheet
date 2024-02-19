import 'package:flutter/material.dart';
import 'package:rpg_sheet/boxes.dart';

class AlertCustom extends StatefulWidget {
  const AlertCustom({super.key});

  @override
  State<AlertCustom> createState() => _AlertState();
}

class _AlertState extends State<AlertCustom> {
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
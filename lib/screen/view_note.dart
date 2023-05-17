import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note_app/model/notes_model.dart';

class ViewNote extends StatelessWidget {
  final NotesModel notesModel;
  const ViewNote({super.key, required this.notesModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notesModel.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Text(notesModel.description),
        ),
      ),
    );
  }
}

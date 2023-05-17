import 'package:flutter/material.dart';

import 'package:note_app/data/notes_data.dart';
import 'package:note_app/provider_service/notes_provider.dart';
import 'package:note_app/screen/add_note.dart';
import 'package:note_app/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Apps'),
      ),
      body: ListView.builder(
          itemCount: provider.notesData.length,
          itemBuilder: (context, index) {
            return CardWidget(
              notesModel: provider.notesData[index],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

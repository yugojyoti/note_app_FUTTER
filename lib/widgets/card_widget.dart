import 'package:flutter/material.dart';

import 'package:note_app/data/notes_data.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/provider_service/notes_provider.dart';
import 'package:note_app/screen/edit_note.dart';
import 'package:note_app/screen/view_note.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  final NotesModel notesModel;

  const CardWidget({super.key, required this.notesModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewNote(notesModel: notesModel),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                notesModel.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                notesModel.description,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            Divider(height: 1),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewNote(notesModel: notesModel),
                    ),
                  );
                },
                icon: Icon(Icons.remove_red_eye),
              ),
              title: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditNote(
                        notesModel: notesModel,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.edit),
              ),
              trailing: IconButton(
                onPressed: () {
                  // int index = provider.notesData
                  //     .indexWhere((element) => element.id == notesModel.id);
                  provider.removeModel(notesModel);
                },
                icon: Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}

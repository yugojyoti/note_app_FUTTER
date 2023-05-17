import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/provider_service/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final textProvider =
        Provider.of<TextControllerProvider>(context, listen: false);
    final provider = Provider.of<NotesProvider>(context);
    textProvider.clearText();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textProvider.titleController,
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: textProvider.descriptionController,
                maxLines: 10,
                decoration: InputDecoration(
                  label: Text("Description"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      uuid = const Uuid();
                      String id = uuid.v4();
                      provider.addModel(NotesModel(
                          title: textProvider.titleController.text,
                          description: textProvider.descriptionController.text,
                          id: id));
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.check),
                    label: Text('Save'),
                  ),
                  ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    label: Text('Cancel'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

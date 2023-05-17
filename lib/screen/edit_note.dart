import 'package:flutter/material.dart';
import 'package:note_app/data/notes_data.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/provider_service/notes_provider.dart';
import 'package:provider/provider.dart';

class EditNote extends StatelessWidget {
  final NotesModel notesModel;
  const EditNote({super.key, required this.notesModel});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context, listen: false);
    final textProvider =
        Provider.of<TextControllerProvider>(context, listen: false);
    textProvider.initvalue(notesModel);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
      ),
      body: SingleChildScrollView(
        child: Builder(builder: (context) {
          return Column(
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
                    Builder(builder: (context) {
                      return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          // provider.addModel(NotesModel(
                          //     title: textProvider.titleController.text,
                          //     description:
                          //         textProvider.descriptionController.text,
                          //     id: notesModel.id));

                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.check),
                        label: Text('Save'),
                      );
                    }),
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
          );
        }),
      ),
    );
    ;
  }
}

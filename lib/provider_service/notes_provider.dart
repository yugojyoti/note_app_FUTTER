import 'package:flutter/material.dart';

import '../model/notes_model.dart';

class NotesProvider extends ChangeNotifier {
  final List<NotesModel> _notesData = [
    NotesModel(
      id: "1",
      title: "MORING",
      description: "wAKE UP",
    ),
    NotesModel(id: "2", title: "Evening", description: "Go to Bed"),
    NotesModel(id: "3", title: "vegetable", description: "eat all Potatoes"),
    NotesModel(id: "4", title: "MORING", description: "wAKE UP"),
  ];
  List<NotesModel> get notesData => _notesData;

  void addModel(NotesModel model) {
    bool newElement = true;
    int elementI = _notesData.length;

    for (int i = 0; i < _notesData.length; i++) {
      if (model.id == _notesData[i].id) {
        newElement = false;
        elementI = i;
        break;
      }
    }
    if (newElement) {
      _notesData.add(model);
      print("new elment");
    } else {
      _notesData[elementI].title = model.title;
      _notesData[elementI].description = model.description;
    }

    notifyListeners();
  }

  void removeModel(NotesModel model) {
    notesData.remove(model);
    notifyListeners();
  }
}

class TextControllerProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void clearText() {
    titleController.clear();
    descriptionController.clear();
  }

  void initvalue(NotesModel model) {
    titleController.text = model.title;
    descriptionController.text = model.description;
  }
}

import 'package:uuid/uuid.dart';

var uuid = Uuid();

class NotesModel {
  NotesModel(
      {required this.title,
      required this.description,
      required this.id}); //: id = uuid.v4();
  final String id;
  String title;
  String description;
  String getid() {
    return id;
  }
}

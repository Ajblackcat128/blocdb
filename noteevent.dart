import 'package:classico/assign_15/NoteModel.dart';

abstract class NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final NoteModel note;
  AddNoteEvent({required this.note});
}

class FetchNotesEvent extends NoteEvent {}

class UpdateNoteEvent extends NoteEvent {
  final NoteModel note;
  UpdateNoteEvent({required this.note});
}

class DeleteNoteEvent extends NoteEvent {
  final int id;
  DeleteNoteEvent({required this.id});
}

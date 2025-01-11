import 'package:classico/assign_15/NoteModel.dart';
import 'package:bloc/bloc.dart';
import 'package:classico/assign_15/noteevent.dart';
import 'package:classico/assign_15/notestate.dart';

import 'db_helper.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final DBHelper dbHelper;

  NoteBloc(this.dbHelper) : super(NoteState(notes: [])) {
    on<FetchNotesEvent>((event, emit) async {
      final mNotes = await dbHelper.fetchAllNotes();
      emit(NoteState(notes: mNotes));
    });

    on<AddNoteEvent>((event, emit) async {
      bool check = await dbHelper.addNote(newNote: event.note);
      if (check) {
        final mNotes = await dbHelper.fetchAllNotes();
        emit(NoteState(notes: mNotes));
      }
    });

    on<UpdateNoteEvent>((event, emit) async {
      bool check = await dbHelper.updateNote(updateNote: event.note);
      if (check) {
        final mNotes = await dbHelper.fetchAllNotes();
        emit(NoteState(notes: mNotes));
      }
    });

    on<DeleteNoteEvent>((event, emit) async {
      bool check = await dbHelper.deleteNote(id: event.id);
      if (check) {
        final mNotes = await dbHelper.fetchAllNotes();
        emit(NoteState(notes: mNotes));
      }
    });
  }
}




import 'package:classico/assign_15/NoteModel.dart';
import 'package:classico/assign_15/blocdbhelper.dart';
import 'package:classico/assign_15/noteevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotePage extends StatelessWidget {
  final NoteModel? note; // Note to update or null for a new note
  final bool isUpdate;

  AddNotePage({this.note, this.isUpdate = false}) {
    if (isUpdate && note != null) {
      titleController.text = note!.title;
      descController.text = note!.description;
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? "Update Note" : "Add New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text.trim();
                String description = descController.text.trim();

                if (title.isNotEmpty || description.isNotEmpty) {
                  final newNote = NoteModel(
                    id: isUpdate ? note?.id : null,
                    title: title,
                    description: description,
                  );

                  if (isUpdate) {
                    context.read<NoteBloc>().add(UpdateNoteEvent(note: newNote));
                  } else {
                    context.read<NoteBloc>().add(AddNoteEvent(note: newNote));
                  }

                  Navigator.pop(context);
                }
              },
              child: Text(isUpdate ? 'Update Note' : 'Add Note'),
            )
          ],
        ),
      ),
    );
  }
}
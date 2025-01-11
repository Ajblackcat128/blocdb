import 'package:classico/assign_15/Addnote.dart';
import 'package:classico/assign_15/blocdbhelper.dart';
import 'package:classico/assign_15/noteevent.dart';
import 'package:classico/assign_15/notestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch FetchNotesEvent when the widget initializes
    context.read<NoteBloc>().add(FetchNotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          // Show a message if there are no notes
          if (state.notes.isEmpty) {
            return Center(child: Text("No notes available"));
          }

          // Display the list of notes
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        // Navigate to AddNotePage for editing
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddNotePage(note: note, isUpdate: true),
                          ),
                        );
                        // Refresh notes after returning from AddNotePage
                        context.read<NoteBloc>().add(FetchNotesEvent());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        if (note.id != null) {
                          context
                              .read<NoteBloc>()
                              .add(DeleteNoteEvent(id: note.id!));
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddNotePage for adding a new note
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNotePage()),
          );
          // Refresh notes after returning from AddNotePage
          context.read<NoteBloc>().add(FetchNotesEvent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

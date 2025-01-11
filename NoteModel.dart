class NoteModel {
  final int? id;
  final String title;
  final String description;

  NoteModel({this.id, required this.title, required this.description});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['note_id'],
      title: map['note_title'],
      description: map['note_desc'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'note_id': id,
      'note_title': title,
      'note_desc': description,
    };
  }
}

class NotesStorage {
  static int _counter = 0;
  static Map<int, String> _notes = {};

  static void createNote(String content) {
    _notes[_counter] = content;
    _counter++;
  }

  static String getNote(int id) {
    return _notes[id];
  }

  static void updateNote(int id, String content) {
    _notes[id] = content;
  }

  static void deleteNote(int id) {
    _notes.remove(id);
  }

  static get allNotes => _notes;
  static get latest => _counter - 1;
}
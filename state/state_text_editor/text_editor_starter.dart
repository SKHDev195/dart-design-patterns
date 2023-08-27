abstract class TextEditorState {
  String enterText(
    String currentText,
    String newText,
  );
  String bold(
    TextEditor editor,
    String currentText,
  );
  String italic(
    TextEditor editor,
    String currentText,
  );
  String underline(
    TextEditor editor,
    String currentText,
  );
  String undo(
    TextEditor editor,
    String currentText,
  );
  String redo(
    TextEditor editor,
    String currentText,
  );
  String getCurrentState();
}

class DefaultState implements TextEditorState {
  @override
  String bold(TextEditor editor, String currentText) {
    editor.setState(
      BoldState(),
    );
    return 'Bold text: $currentText';
  }

  @override
  String enterText(String currentText, String newText) {
    return '$currentText\nBold text: $newText';
  }

  @override
  String getCurrentState() {
    return 'New and selected text is bolded';
  }

  @override
  String italic(TextEditor editor, String currentText) {
    editor.setState(
      ItalicState(),
    );
    return 'Italic text: $currentText';
  }

  @override
  String redo(TextEditor editor, String currentText) {
    // TODO: implement redo
    throw UnimplementedError();
  }

  @override
  String underline(TextEditor editor, String currentText) {
    editor.setState(
      UnderlineState(),
    );
    return 'Underline text: $currentText';
  }

  @override
  String undo(TextEditor editor, String currentText) {
    // TODO: implement undo
    throw UnimplementedError();
  }
}

// TODO: Implement BoldState
class BoldState implements TextEditorState {
  // TODO: Fill in methods here
}

// TODO: Implement ItalicState
class ItalicState implements TextEditorState {
  // TODO: Fill in methods here
}

// TODO: Implement UnderlineState
class UnderlineState implements TextEditorState {
  // TODO: Fill in methods here
}

// TextEditor class using State Design Pattern
class TextEditor {
  TextEditorState _state;
  String _currentText = "";
  List<String> _history = [];
  int _historyIndex = -1;

  TextEditor() {
    // TODO: Initialize the state
  }

  // TODO: Add a method to set the state
  void setState(TextEditorState state) {
    // TODO: Implement this method
  }

  // TODO: Implement methods to handle text input and formatting
  void enterText(String newText) {
    // TODO: Delegate to state object
  }

  void bold() {
    // TODO: Delegate to state object
  }

  void italic() {
    // TODO: Delegate to state object
  }

  void underline() {
    // TODO: Delegate to state object
  }

  void undo() {
    // TODO: Delegate to state object
  }

  void redo() {
    // TODO: Delegate to state object
  }
}

void main() {
  TextEditor editor = TextEditor();

  // TODO: Add some sample usage here
}

import 'dart:io';

class FileAuditManager {
  static FileAuditManager? _instance;

  static const _fileName = 'logTwo.txt';
  static File _file = File(_fileName);
  static IOSink _fileSink = _file.openWrite();

  FileAuditManager._internal() {
    _instance = this;
  }

  factory FileAuditManager() => FileAuditManager._internal();

  void writeMesssage(String message) {
    _fileSink.write('${message}\n');
  }
}

void main() {
  FileAuditManager fileManager = FileAuditManager();
  fileManager.writeMesssage('Message one');

  FileAuditManager anotherFileManager = FileAuditManager();
  anotherFileManager.writeMesssage('Message two');
}

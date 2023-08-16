import 'dart:io';

class FileAuditManager {
  static final FileAuditManager _instance = FileAuditManager._internal();

  static const _fileName = 'log.txt';
  static File _file = File(_fileName);
  static IOSink _fileSink = _file.openWrite();

  FileAuditManager._internal() {}

  factory FileAuditManager() => _instance;

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

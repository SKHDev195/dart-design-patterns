import 'dart:io';

abstract class Singleton {
  Singleton._internal();
}

class FileAuditManager extends Singleton {
  static final FileAuditManager _instance = FileAuditManager._internal();

  static const _fileName = 'log.txt';
  static File _file = File(_fileName);
  static IOSink _fileSink = _file.openWrite();

  FileAuditManager._internal() : super._internal() {}

  factory FileAuditManager() => _instance;

  void writeMesssage(String message) {
    DateTime currentTimeStamp = DateTime.now();
    String currentTSString =
        '${currentTimeStamp.day}/${currentTimeStamp.month}/${currentTimeStamp.year} ${currentTimeStamp.hour}:${currentTimeStamp.minute}:${currentTimeStamp.second}';
    _fileSink.write('${currentTSString} ${message}\n');
  }
}

void main() {
  FileAuditManager fileManager = FileAuditManager();
  fileManager.writeMesssage('Message one');
  sleep(Duration(seconds: 3));
  FileAuditManager anotherFileManager = FileAuditManager();
  anotherFileManager.writeMesssage('Message two');
}

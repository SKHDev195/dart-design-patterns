import 'dart:io';

abstract class Singleton {
  Singleton._internal();
}

class FileAuditManager extends Singleton {
  static FileAuditManager? _instance;

  static String? _fileName;
  static File? _file;
  static IOSink? _fileSink;

  FileAuditManager._internal() : super._internal() {
    _fileName = 'logTwo.txt';
    _file = File(_fileName!);
    _fileSink = _file!.openWrite();
    _instance = this;
  }

  factory FileAuditManager() => _instance ??= FileAuditManager._internal();

  void writeMesssage(String message) {
    DateTime currentTimeStamp = DateTime.now();
    String currentTSString =
        '${currentTimeStamp.day}/${currentTimeStamp.month}/${currentTimeStamp.year} ${currentTimeStamp.hour}:${currentTimeStamp.minute}:${currentTimeStamp.second}';
    _fileSink!.write('${currentTSString} ${message}\n');
  }
}

void main() {
  FileAuditManager fileManager = FileAuditManager();
  fileManager.writeMesssage('Message one');
  sleep(Duration(seconds: 3));
  FileAuditManager anotherFileManager = FileAuditManager();
  anotherFileManager.writeMesssage('Message two');
}

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'models/transaction.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data.txt');
}

Future<File> writeContent(List<Transaction> content) async {
  final file = await _localFile;

  var contentMap = content.map((e){
    return e.toJson();
  }).toList();
  String contentAsJsonString = json.encode(contentMap);
  return file.writeAsString(contentAsJsonString);
}

Future<List<Transaction>> readContent() async {
    final file = await _localFile;
    String content = await file.readAsString();
    List contentMap = json.decode(content);

    List<Transaction> contentList = contentMap.map((e){
      return Transaction.fromJson(e);
    }).toList();

    return contentList;
}

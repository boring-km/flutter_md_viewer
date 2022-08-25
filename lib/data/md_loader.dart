import 'package:flutter/services.dart';

class MdLoader {
  static const errorPage = './pages/error.md';

  Future<Iterable<RegExpMatch>> loadNames() async {
    final str = await rootBundle.loadString('./page_index.md');
    final reg = RegExp(r'\[(.*?)\]');
    return reg.allMatches(str);
  }

  static Future<List<String>> getFiles() async {
    final indexFile = await rootBundle.loadString('./page_index.md');
    final files = _findFiles(indexFile);
    final resultList = <String>[];
    for (final fileString in files) {
      final file = _removeBracket(fileString);
      resultList.add(await rootBundle.loadString(file));
    }
    return resultList;
  }

  static Iterable<RegExpMatch> _findFiles(String indexFile) =>
      RegExp(r'\((.*?)\)').allMatches(indexFile);

  static String _removeBracket(RegExpMatch fileString) =>
      fileString.group(0)?.replaceAll(RegExp('[()]'), '') ?? errorPage;
}

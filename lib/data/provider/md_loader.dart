import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/data/model/page.dart';

class MdLoader {
  static const errorPage = './pages/error.md';

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

  static Future<List<MdPage>> getTestFiles() async {
    final indexFile = await rootBundle.loadString('./page_test_index.md');
    final files = _findFiles(indexFile);
    final resultList = <MdPage>[];
    for (final fileString in files) {
      final file = _removeBracket(fileString);
      final arr = file.split('/');
      final category = arr[arr.length - 2];
      resultList.add(
        MdPage(
          category: category,
          markdownContent: await rootBundle.loadString(file),
        ),
      );
    }
    return resultList;
  }

  static Iterable<RegExpMatch> _findFiles(String indexFile) =>
      RegExp(r'\((.*?)\)').allMatches(indexFile);

  static String _removeBracket(RegExpMatch fileString) =>
      fileString.group(0)?.replaceAll(RegExp('[()]'), '') ?? errorPage;
}

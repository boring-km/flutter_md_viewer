// ignore_for_file: require_trailing_commas

import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/core/file_utils.dart';
import 'package:flutter_md_viewer/data/model/page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('모든 Markdown 파일을 불러와서 테스트 md 파일이 잘 불러와졌는지 테스트', () async {
    final testFiles = await getTestFiles();

    for (var i = 0; i < testFiles.length; i++) {
      final target = testFiles[i];
      var category = 'test';
      if (i > 1) category = 'test2';
      final expected =
          await rootBundle.loadString('./pages/$category/test${i + 1}.md');
      expect(target.pageUrl, expected);
    }
  });

  test('모든 Markdown 파일의 category 확인', () async {
    final testFiles = await getTestFiles();

    for (var i = 0; i < testFiles.length; i++) {
      final target = testFiles[i].category;
      var category = 'test';
      if (i > 1) category = 'test2';
      expect(target, category);
    }
  });

  test('test2 카테고리의 마크다운 호출 테스트', () async {
    final testFiles = await getTestFilesWithCategory('test2');
    for (var i = 0; i < testFiles.length; i++) {
      final target = testFiles[i];
      final expected = await rootBundle.loadString(
        './pages/test2/test${i + 3}.md',
      );
      expect(target.pageUrl, expected);
    }
  });
}

Future<List<MdPage>> getTestFiles() async {
  final indexFile = await rootBundle.loadString('./page_test_index.md');
  final files = findFiles(indexFile);
  final resultList = <MdPage>[];
  for (final fileString in files) {
    final file = removeBracket(fileString);
    final arr = file.split('/');
    final category = arr[arr.length - 2];
    resultList.add(
      MdPage(
        category: category,
        pageUrl: await rootBundle.loadString(file),
      ),
    );
  }
  return resultList;
}

Future<List<MdPage>> getTestFilesWithCategory(String category) async {
  final indexFile = await rootBundle.loadString('./page_test_index.md');
  final files = findFiles(indexFile);
  final resultList = <MdPage>[];
  for (final fileString in files) {
    final file = removeBracket(fileString);
    final arr = file.split('/');
    final tempCategory = arr[arr.length - 2];
    if (tempCategory == category) {
      resultList.add(
        MdPage(
          category: category,
          pageUrl: await rootBundle.loadString(file),
        ),
      );
    }
  }
  return resultList;
}

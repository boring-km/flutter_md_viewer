// ignore_for_file: require_trailing_commas

import 'package:flutter/services.dart';
import 'package:flutter_md_viewer/data/provider/md_loader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('모든 Markdown 파일을 불러와서 테스트 md 파일이 잘 불러와졌는지 테스트', () async {
    final testFiles = await MdLoader.getTestFiles();

    for (var i = 0; i < testFiles.length; i++) {
      final target = testFiles[i];
      var category = 'test';
      if (i > 1) category = 'test2';
      final expected =
          await rootBundle.loadString('./pages/$category/test${i + 1}.md');
      expect(target.markdownContent, expected);
    }
  });

  test('모든 Markdown 파일의 category 확인', () async {
    final testFiles = await MdLoader.getTestFiles();

    for (var i = 0; i < testFiles.length; i++) {
      final target = testFiles[i].category;
      var category = 'test';
      if (i > 1) category = 'test2';
      expect(target, category);
    }
  });
}

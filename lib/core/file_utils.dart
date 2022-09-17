const errorPage = './pages/error.md';

Iterable<RegExpMatch> findCategories(String indexFile) =>
    RegExp(r'\*\*.*?\*\*').allMatches(indexFile);

String removeStars(RegExpMatch fileData) =>
    fileData.group(0)?.replaceAll('*', '') ?? '';

Iterable<RegExpMatch> findFiles(String indexFile) =>
    RegExp(r'\((.*?)\)').allMatches(indexFile);

String removeBracket(RegExpMatch fileString) =>
    fileString.group(0)?.replaceAll(RegExp('[()]'), '') ?? errorPage;

String getCategory(String page) {
  final arr = page.split('/');
  final category = arr[arr.length - 2];
  return category;
}
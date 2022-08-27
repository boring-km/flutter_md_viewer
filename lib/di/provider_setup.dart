import 'package:flutter_md_viewer/views/markdown/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final markdownViewModel = MarkdownViewModel();

  return [
    ChangeNotifierProvider(create: (_) => markdownViewModel),
  ];
}

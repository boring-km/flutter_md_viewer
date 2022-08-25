import 'package:flutter_md_viewer/views/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final homeViewModel = HomeViewModel();

  return [
    ChangeNotifierProvider(create: (_) => homeViewModel),
  ];
}

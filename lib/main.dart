import 'package:flutter/material.dart';
import 'package:flutter_md_viewer/di/provider_setup.dart';
import 'package:flutter_md_viewer/routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // 플랫폼 채널이 위젯 바인딩을 보장
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: await getProviders(),
      child: MaterialApp(
        title: 'Markdown Viewer Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 12),
          ),
        ),
        initialRoute: Pages.home,
        routes: Routes.routes,
      ),
    ),
  );
}

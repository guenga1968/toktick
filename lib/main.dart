import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktick/config/theme/app_theme.dart';
import 'package:toktick/presentation/providers/discover_provider.dart';
import 'package:toktick/presentation/screen/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/chat_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/database.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

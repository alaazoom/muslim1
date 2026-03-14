import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:masbaha/home.dart';
import 'package:masbaha/morrningPrayers.dart';
import 'package:masbaha/night.dart';
import 'package:masbaha/quranDuaas.dart';
import 'package:masbaha/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); // تهيئة Hive
  await Hive.openBox('zekrBox');
  await Hive.openBox('zekrBox2');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('zekrBox');
    bool seen = box.get("seenWelcome", defaultValue: false);
    return MaterialApp(
      
       home: seen ? HomeScreen(name: "",) : WelcomePage(),
    
    );
  }
}

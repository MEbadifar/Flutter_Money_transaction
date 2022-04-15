import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mony_transaction/models/money.dart';
import 'package:mony_transaction/screens/home_screen.dart';
import 'package:mony_transaction/screens/main_screen.dart';
import 'package:mony_transaction/screens/new_transaaction_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MoneyAdapter());
  await Hive.openBox<Money>('moneyBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static void getData() {
    HomeScreen.moneys.clear();
    Box<Money> hiveBox = Hive.box<Money>('moneyBox');
    for (var value in hiveBox.values) {
      HomeScreen.moneys.add(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //theme: ThemeData(fontFamily:''),
      debugShowCheckedModeBanner: false,
      title: 'اپلیکیشن مدیریت مالی',
      home: MainScreen(),
    );
  }
}

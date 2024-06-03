import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testapplication/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDmnEhCGkcXTvJ5KVqH7jd4460pr73nyf0',
      appId: '1:632673999951:android:db812bd74b8ffc31d6de3a',
      messagingSenderId: '632673999951',
      projectId: 'e-commerce-task-307cd',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}


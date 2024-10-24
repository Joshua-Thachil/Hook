import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/components/Globals.dart';
import 'package:musicapp/firebase_options.dart';
import 'package:musicapp/screens/InitScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://bvtkzsxrphxzfaszilab.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ2dGt6c3hycGh4emZhc3ppbGFiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg2NDkwMTYsImV4cCI6MjA0NDIyNTAxNn0.gnFPJ9aiJDYD1Fz11-KMmGFPP9RUI_ZPxs29l1yqjFk',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Globals().initialize(context);
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Music App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const InitScreen(),
        );
      },
      designSize: const Size(430, 932),
      minTextAdapt: true, // Optional, adapts text size
      splitScreenMode: true, // Optional, handles multi-screen layouts
    );
  }
}
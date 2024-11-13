// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_screen.dart';
import 'screens/get_started.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart'; // Import the Provider package
import 'providers/saved_food_provider.dart'; // Import SavedFoodProvider
import 'providers/shopping_list_provider.dart'; // Import ShoppingListProvider
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'firebase_options.dart';  // Generated by Firebase setup


void main(dynamic DefaultFirebaseOptions) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();  // Load the .env file
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedFoodProvider()), // Provide SavedFoodProvider
        ChangeNotifierProvider(create: (_) => ShoppingListProvider()), // Provide ShoppingListProvider
      ],
      child: MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home', // Set the initial screen (login screen)
        routes: {
          '/': (context) => GetStartedScreen(), // Login screen route
          //'/home': (context) => HomeScreen(), // Home screen route
        },
      ),
    );
  }
}

# FlutterB-WTheme

A Basic Flutter project with black and white theme and firebase authentication with login setup.

## Fonts Used

 ```yaml

 GoogleFonts.syne().fontFamily

 ```

## Packages Used

```yaml

  google_fonts: ^3.0.1
  velocity_x: ^3.5.1
  animated_splash_screen: ^1.2.0
  provider: ^6.0.3
  firebase_auth: ^3.3.20
  firebase_core: ^1.18.0
  cloud_firestore:
  firebase_storage:
  get:
  
```

## Basic Implementation

- Theme

```dart
class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        fontFamily: GoogleFonts.syne().fontFamily,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(),
        primaryColor: blueColor,
        secondaryHeaderColor: Colors.grey[500],
        cardColor: blackColor,
        canvasColor: Colors.grey,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        textTheme: TextTheme(
          displayLarge: TextStyle(backgroundColor: Colors.grey[500]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(blackColor),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: blackColor,
          selectionColor: purpleColor,
          selectionHandleColor: navyColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.black)));
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        fontFamily: GoogleFonts.syne().fontFamily,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.grey[100],
        cardColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(backgroundColor: Colors.white60),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: creamColor,
          selectionHandleColor: darkThemeFontColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.white)));
  }
}
```

- Firebase Authentication

```dart
class AuthController extends GetxController {
  static AuthController instance =
      Get.find(); // auth controller instance; will be called in other widgets
  // user instance
  late Rx<User?> _user;
  // get user data like name, email, password etc
  FirebaseAuth auth = FirebaseAuth.instance; // firebase auth instance

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); // getting current user
    _user.bindStream(
      auth.userChanges(),
    ); //notifies app about user login and logout

    ever(_user, _initialScreen); //this function will make sure user gets to correct screen
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  Future<void> register(
      BuildContext context, String email, username, password) async {}

  Future<void> login(BuildContext context, String username, password) async {}

  Future<void> logOut(BuildContext context) async {}
}
```

## Runner Code

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const TutorialTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        MyRoutes.homeRoute: (context) => const HomeScreen(),
        MyRoutes.loginRoute: (context) => const LoginScreen(),
        MyRoutes.signupRoute: (context) => const SignupScreen(),
        MyRoutes.profileRoute: (context) => const ProfileScreen(),
      },
    );
  }
}
```

## License

- This Project does not have any license.

## Collaboration

- This project is not open for collaboration

## Bugs & Issue

- For bugs, feature requests, and discussion please use [GitHub Issues](https://github.com/uditrajmr3/FlutterB-WTheme/issues)
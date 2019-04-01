import 'import.dart';

void main() {
  Data.request();
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Quicksand",
        primaryColor: Color.fromARGB(255, 149, 27, 57),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
  );
}

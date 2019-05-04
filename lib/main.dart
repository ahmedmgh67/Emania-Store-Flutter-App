import 'import.dart';

void main() {
  //makereq();
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

/*void makereq () async {
  await Data.request();
}*/
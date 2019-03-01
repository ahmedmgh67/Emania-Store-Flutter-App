import 'package:emania/import.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: MyApp(),
      image: Image.asset(
        "media/emania-40.png",
        height: 200.0,
        width: 200.0,
        fit: BoxFit.fill,
        scale: 60,
        alignment: Alignment.center,
      ),
    );
  }
}

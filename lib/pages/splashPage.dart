import 'package:emania/import.dart';
import 'package:http/http.dart' as http;

/*class SplashPage extends StatelessWidget {
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
}*/

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState ()  {
    super.initState();
    a();
  }

  void a() async {
    await Data.request(context);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyApp(),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(149, 27, 57, 100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40.0,right: 50.0,left: 50.0),
            child: Image.asset("media/emania-40.png"),
          ),
          Container(
            child: CircularProgressIndicator(

            ),
          )
        ],
      ),
    );
  }
}


/*class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static List<dynamic> products;



  void a () async {
    await Data.request(context);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(149, 27, 57, 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("media/emania-40.png"),
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 180,
            ),
            Container(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(240, 106, 105, 100),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/
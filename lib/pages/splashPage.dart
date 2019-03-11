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
}

*/

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static List<dynamic> products;

  @override
  void initState()  {
    
    super.initState();
    //dynamic b = await request();
    a();
    print("Done");
    print("Ahmed");

  }
  void a() async{
    var c= await request();
    Navigator.of(context).push(MaterialPageRoute(builder: (context )=> MyApp()));
    print(products.length.toString());
  }
//https://emania.000webhostapp.com/wp-json/wc/v3/products?consumer_key=ck_196b5a3683683f2f41a27d8fbc668b771b7a4ee5&consumer_secret=cs_724d274fcbc12eccb4043848af53a7514a019690
  Future<List<dynamic>> request() async {
    var _json = await http.get("https://emania.000webhostapp.com/wp-json/wc/v3/products?consumer_key=ck_196b5a3683683f2f41a27d8fbc668b771b7a4ee5&consumer_secret=cs_724d274fcbc12eccb4043848af53a7514a019690");
    var str =jsonDecode(_json.body);
    products = str;
    int a = str["name"].length;

    for (var i = 0; i < a; i++) {
      products.add(
        Product("",str[i]["name"],str[i]["price"],"",Category("name", Icons.ac_unit),2));
    }

    return str;
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
}
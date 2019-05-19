import 'package:emania/import.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

MyAppState appState;

class MyApp extends StatefulWidget {
  static ShoppingBasket shoppingBasket = ShoppingBasket();
  static WishList wishList = WishList();

  @override
  MyAppState createState() {
    appState = MyAppState();
    return appState;
  }
}

class MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String searchTerm = "";
  bool isLoaded = false;

  List<Product> pL;
  List<Category> cL;

  @override
  void initState() {
    super.initState();
    request();
    //Timer(Duration(seconds: 3),() => setState(() {isLoaded = true;}) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: cL == null
          ? Center(
              child: SpinKitFoldingCube(color: Theme.of(context).primaryColor))
          : Container(
              padding: EdgeInsets.only(left: 16.0, top: 32.0),
              width: 250.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ),
                ]..addAll(cL.map((c) => Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => CategoryPage(c)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  c.name,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
              ),
            ),
      key: scaffoldKey,
      appBar: CustomAppBar((s) {
        setState(() {
          searchTerm = s;
        });
      }, scaffoldKey),
      body: pL == null
          ? Center(
              child: SpinKitFoldingCube(color: Theme.of(context).primaryColor))
          : searchTerm == ""
              ? ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text(
                        "Category",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Color(0xff444444)),
                      ),
                    ),
                    CategoryCardScroller(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Hot Items",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Color(0xff444444)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 0.798,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        /*children: Data.products
                        //.where((p) => p.id < 4)
                        .map((p) => ProductCard(p))
                        .toList(),*/
                        /*children: 
                      pL
                      .where((p) => p.id < 10)
                      .map((p) => ProductCard(p))
                      .toList(),*/
                        children: hotProducts(),
                        shrinkWrap: true,
                      ),
                    )
                  ],
                )
              : Container(
                  child: ListView.builder(
                    itemCount: pL
                        .where(
                          (p) => p.name.toLowerCase().contains(
                                searchTerm.toLowerCase(),
                              ),
                        )
                        .length,
                    itemBuilder: (ctx, index) {
                      return ProductListItem(
                        getProducts()
                            .where(
                              (p) => p.name.toLowerCase().contains(
                                    searchTerm.toLowerCase(),
                                  ),
                            )
                            .toList()[index],
                      );
                    },
                  ),
                ),
    );
  }

  List<Widget> hotProducts() {
    List<Widget> a = [];
    for (var i = 0; i < pL.length; i++) {
      a.add(ProductCard(pL[i]));
    }

    return a;
  }
}

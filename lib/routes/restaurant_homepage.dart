import 'dart:math';
import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:cocoliebe/models/tryModel.dart';
import 'package:cocoliebe/routes/basket_page.dart';
import 'package:cocoliebe/routes/maindrawerlb.dart';
import 'package:cocoliebe/routes/short_description.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';

import '../api_service.dart';
// import '../models/menu_categoried_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:html/parser.dart';
import 'package:flutter/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:random_color/random_color.dart';
import 'package:visibility_detector/visibility_detector.dart';
import './inform_page.dart';
import 'contact.dart';

// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:connectivity/connectivity.dart';
//var tryModel = TryModel();
class RestaurantPage extends StatefulWidget {
  // RestaurantPage({Key key}) : super(key: key);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

final _tryModel = TryModel();
bool refreshDataOne = false, refreshDataTwo = false;
List displayList = [];
List testList = [];
var myList;
var productItem;
int countList = 0;
int count = 0;
int countTwo = 0;
int splashColorIndex = 0;
final GlobalKey<ScaffoldState> _scaffoldKeyOne = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _scaffoldKeyTwo = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _scaffoldKeyThree = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _scaffoldKeyFour = GlobalKey<ScaffoldState>();
int cartBadge;
var catName = 'try';
bool basketPageIsPressed = false;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//for FAb
// var controller = IndexedScrollController();
double p = 0;
//bool selected=true;
Future<List<dynamic>> post;
bool showBasketBar = true;

class MyColorNotifier extends ChangeNotifier {
  Color myColor = Colors.grey;
  Random _random = new Random();

  // void changeColor() {
  //   int randomNumber = _random.nextInt(30);
  //   myColor = Colors.primaries[randomNumber % Colors.primaries.length];
  //   notifyListeners();
  // }
}

// int _pressed;
int itemspressed;

var a;
var b;

// var controller =
//     IndexedScrollController(initialIndex: 75, initialScrollOffset: 30.0);

Future<List<dynamic>> postTwo;
ScrollController scrollControllerOne;
ScrollController scrollControllerTwo;
LinkedScrollControllerGroup _controllers;

ScrollController _numbers;
TabController _tabControllerOne;
TabController _tabControllerTwo;
final Map<int, bool> _visibleItems = {0: true};
var selectedSlide;
var slideValue = 0;
var result;
bottomNavBar([context, tryM]) {
  //print(tryM.il[0].itemCount.toString());
  //if(countDataForSearch.isEmpty && basketDataForSearch.isEmpty){
  // if (tryM.il[0].itemCount == 0) {
  // return Container(
  //   height: 0,
  // );
  //}else{
  //  tryModel = tryM;
  return ButtonTheme(
    buttonColor: Color(0xff010101),
    height: 50.0,
    minWidth: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Badge(
                  badgeColor: Colors.white,
                  toAnimate: true,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  badgeContent:
                      Text(countDataForSearch[0].itemCount.toString())),
              // badgeContent: Text(Provider.of<TryModel>(context, listen: true).il[0].itemCount.toString())),
              Text(
                "Basket",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Icon(null),
            ],
          ),
          onPressed: () {
            _navigateAndDisplaySelection(
                context, countDataForSearch, basketDataForSearch, tryM);
          }),
    ),
  );
}

//   );
//   }
//}
// }
// if {

//}

_navigateAndDisplaySelection(
    BuildContext context, countDataForSearch, basketDataForSearch, tryM) async {
  // Navigator.push returns a Future that completes after calling
  // Navigator.pop on the Selection Screen.

  result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Basket(countDataForSearch, basketDataForSearch, tryM.pstCod)));

// setState(() {
//     tryM = result;
//   });
  Consumer<TryModel>(
    builder: (context, tryM, child) =>
        Provider.of<TryModel>(context, listen: false).addpstCode(result[1]),
  );
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Shimmer.fromColors(
                highlightColor: Colors.grey,
                baseColor: Color(0xffedf1ff),
                child: ShimmerLayout()),
          );
        },
      ),
    );
  }
}

class ShimmerListTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.grey,
                baseColor: Color(0xffedf1ff),
                child: ShimmerLayoutTabBar(),
              ),
            );
          },
        ),
      );
}

class ShimmerLayoutTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerHeight = 50;
    double containerWidth = 280;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 30,
            width: 180,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            width: 280,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 30,
            width: 180,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation1;
  Animation animation2;
  // IndexedScrollController _autoScrollController;
  //final scrollDirection = Axis.vertical;

  // void _gotoElement(int index) {
  //   _controller.animateTo((1000.0 * index),
  //       duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  // }

  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpanded = true;
  // bool get _isAppBarExpanded {
  //   return _autoScrollController.hasClients &&
  //       _autoScrollController.offset > (160 - kToolbarHeight);
  // }

  bool _isAppBarExpanded(BuildContext context) {
    if (!_autoScrollController.hasClients) return false;
    print(
        "The offset scrolled now is ${_autoScrollController.offset} and the height is now ${(MediaQuery.of(context).size.height / 1.6 - kToolbarHeight)}");

    return _autoScrollController.offset >
        (MediaQuery.of(context).size.height / 1.6 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();

    post = fetchWpCategoriesList();
    postTwo = fetchWpPosts(context);
    scrollControllerOne = ScrollController();
    scrollControllerTwo = ScrollController();
    // _controllers = LinkedScrollControllerGroup();
    // scrollControllerOne = _controllers.addAndGet();
    // scrollControllerTwo = _controllers.addAndGet();
    // if(post!=null){
    //   scrollController.addListener(changeSelector);
    //   setState(() {
    //     selectedSlide = category[0];
    //   });
    // }

    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    // ..addListener(() {
    //     if (_isAppBarExpanded(context)) {
    //       if (isExpanded) {
    //         setState(
    //           () {
    //             isExpanded = false;
    //             print('setState is called');
    //           },
    //         );
    //       }
    //     } else if (!isExpanded) {
    //       setState(() {
    //         print('setState is called');
    //         isExpanded = true;
    //       });
    //     }
    //   });
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    animation1 = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animation2 = Tween<double>(begin: 0, end: 20.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

//for FAB
  final _colorNotifier = MyColorNotifier();

  // void _onPressed() {
  //   _colorNotifier.changeColor()
  // }

  // Pass this method to the child page.
  void _update(int splashColorI) {
    setState(() => splashColorIndex = splashColorI);
  }

  //List data=["One","Two","Three","Four","Five","Six","Seven"];
  //AutoScrollController _autoScrollController;
  bool showFlushBar = false;

  String selectedParent = "(109)";

  _buildSliverAppbarFirst(list) {
    return SliverAppBar(
      brightness: Brightness.light,
      // leading: Container(),
      pinned: true,
      expandedHeight: 0.0,
      backgroundColor: Color(0xff010101),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        //  background: BackgroundSliverAppBar(),
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: FutureBuilder(
              future: post,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null &&
                    snapshot.hasData &&
                    refreshDataOne == false &&
                    snapshot.requireData != null) {
                  // if(snapshot.data[0]=="SocketException"){
                  //    setState(() {
                  //      showFlushBar=true;
                  //     });
                  // }

                  if (count == 0) {
                    count = 1;
                    _tabControllerOne = TabController(
                      length: list.length,
                      vsync: this,
                    );
                  }

                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: //isExpaned ? 0.0 :
                        1,
                    child: DefaultTabController(
                      length: list.length,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Container(
                            color: Color(0xff010101),
                            child: Row(
                              children: [
                                Container(
                                    width: 44,
                                    child: Icon(
                                      Icons.menu_book,
                                      color: Colors.white,
                                    )),
                                Expanded(
                                  child: TabBar(
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    unselectedLabelColor: Colors.white,
                                    labelColor: Colors.black,
                                    indicator: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      color: Color(0xffffffff), //ed878a
                                      // gradient: LinearGradient(colors: [
                                      //   Color(0xffc52e2e),
                                      //   Color(0xfff4c2c2).withOpacity(0.6),
                                      // ]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    controller: _tabControllerOne,
                                    isScrollable: true,
                                    onTap: (index) async {
                                      //_scrollToIndex(index);
                                      print(index);
                                      if (index == 0) {
                                        setState(() {
                                          selectedParent = "(109)";

                                          //index = 0;
                                          // _index=0;
                                        });
                                      } else if (index == 1) {
                                        setState(() {
                                          selectedParent = "(VORSPEISEN)";
                                          //index = 1;
                                          // _index=1;
                                        });
                                      } else if (index == 2) {
                                        setState(() {
                                          selectedParent = "(SUSHI BURGER COMBO)";
                                          //index = 2;
                                          // _index=2;
                                        });
                                      } else if (index == 3) {
                                        setState(() {
                                          selectedParent = "(SUSHI BURGER)";
                                          //index = 3;
                                          // _index=3;
                                        });
                                      } else if (index == 4) {
                                        setState(() {
                                          selectedParent = "(PIZZA)";
                                          //index = 4;
                                          //_index=4;
                                        });
                                      } else if (index == 5) {
                                        setState(() {
                                          selectedParent = "(HAUPTGERICHTE)";
                                          //index = 4;
                                          //_index=4;
                                        });
                                      } else if (index == 6) {
                                        setState(() {
                                          selectedParent = "(BEILAGEN)";
                                          //index = 4;
                                          //_index=4;
                                        });
                                      }
                                      else if (index == 7) {
                                        setState(() {
                                          selectedParent =
                                              "(NACHTISCH)";
                                          //index = 4;
                                          //_index=4;
                                        });
                                      }
                                       else if (index == 8) {
                                        setState(() {
                                          selectedParent =
                                              "(ALKOHOLFREIE GETRÄNKE)";
                                          //index = 4;
                                          //_index=4;
                                        });
                                      }
                                       else if (index == 9) {
                                        setState(() {
                                          selectedParent =
                                              "(ALKOHOLISCHE GETRÄNKE)";
                                          //index = 4;
                                          //_index=4;
                                        });
                                      }
                                    },
                                    tabs: List.generate(
                                      list.length,
                                      (i) {
                                        return Tab(
                                            text: (() {
                                          if (parse(list[i])
                                                  .documentElement
                                                  .text ==
                                              'Beilagens') {
                                            return 'Beilagen';
                                          }
                                          // else if (parse(list[i])
                                          //         .documentElement
                                          //         .text ==
                                          //     'Vorspeise') {
                                          //   return 'Vorspeisen';
                                          // }

                                          else {
                                            return parse(list[i])
                                                .documentElement
                                                .text;
                                          }
                                        }()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                        ConnectionState.waiting ||
                    snapshot.data == null) {
                  return Container(
                    height: 55,
                    child: ShimmerListTabBar(),
                    color: Color(0xffedf1ff),
                  );
                }
                return Container(
                  height: 55,
                  child: ShimmerListTabBar(),
                  color: Color(0xffedf1ff),
                );
              })),
    );
  }

  bool change = true;
  _buildSliverAppbarSecond(list) {
    //displayList;

    return SliverAppBar(
        brightness: Brightness.light,
        //  leading: Container(),
        pinned: true,
        expandedHeight: 1.0,
        backgroundColor: Color(0xff010101),
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          //  background: BackgroundSliverAppBar(),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: change
                ? FutureBuilder(
                    //edit from here
                    future: post,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data != null &&
                          snapshot.hasData &&
                          refreshDataOne == false &&
                          snapshot.requireData != null) {
                        change = false;
                        displayList = [];
                        for (var i = 0; i < list.length; i++) {
                          String replaceChar = list[i].values.toString();

                          print(replaceChar);
                          if (replaceChar == selectedParent) {
                            // print("Hello");

                            displayList.add(parse(list[i].keys.toString())
                                .documentElement
                                .text);
                          }
                          //print(list[i].keys);
                        }

                        for (var i = 0; i < displayList.length; i++) {
                          String disp = displayList[i];
                          String strNew = disp.replaceAll(
                              disp[0], ""); //remove ( from result.
                          strNew = strNew.replaceAll(disp[disp.length - 1],
                              ""); //remove ) from result.
                          print(strNew);
                          displayList[i] = strNew;
                        }

                        if (displayList[0] == "PAKORAS") {
                          displayList[0] = "SUPPEN";
                          displayList[1] = "SALATE";
                          displayList[2] = "PAKORAS";
                        }

                        if (displayList[0] == "ENTE-SPEZIALITÄTEN") {
                          displayList[0] = "VEGETARISCHE GERICHTE";
                          displayList[1] = "HÜHNERFLEISCHGERICHTE";
                          displayList[2] = "LAMMFLEISCHGERICHTE";
                          displayList[3] = "ENTE-SPEZIALITÄTEN";
                          displayList[4] = "FISCHGERICHTE";
                          displayList[5] = "SCAMPIGERICHTE";
                          displayList[6] = "SPEZIALITÄTEN VOM GRILL";
                          displayList[7] = "REISGERICHTE";
                        }

                        if (displayList[0] == "COCKTAILS") {
                          displayList[0] = "ERFRISCHUNGSGETRÄNKE";
                          displayList[1] = "FLASCHENBIER";
                          // displayList[2] = "FLASCHENWEINE";
                          displayList[2] = "JOGHURTGETRÄNKE";
                          displayList[3] = "COCKTAILS";
                        }

                           if (displayList[0] == "FLASCHENBIER") {
                          displayList[0] = "ERFRISCHUNGSGETRÄNKE";
                          displayList[1] = "FLASCHENBIER";
                          displayList[2] = "FLASCHENWEINE";
                          displayList[3] = "JOGHURTGETRÄNKE";
                          displayList[4] = "COCKTAILS";
                        }

                                if (displayList[0] == "COCKTAILS") {
                          displayList[0] = "ERFRISCHUNGSGETRÄNKE";
                          displayList[1] = "FLASCHENBIER";
                          displayList[2] = "JOGHURTGETRÄNKE";
                          displayList[3] = "FLASCHENWEINE";
                          displayList[4] = "COCKTAILS";
                        }

                        countList = 1;
                        _tabControllerTwo = TabController(
                          length: displayList.length,
                          vsync: this,
                        );

                        return AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: //isExpaned ? 0.0 :
                              1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: DefaultTabController(
                              length: displayList.length,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Container(
                                  color: Color(0xff010101),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.search,
                                            color: Colors.white),
                                        onPressed: () async {
                                          // var model = Provider.of<TryModel>(context,listen: false);

                                          var searchReturnData =
                                              await showSearch(
                                                  context: context,
                                                  delegate: DataSearch());

                                          // if (searchReturnData != null) {
                                          //   try {
                                          //     Provider.of<TryModel>(context, listen: false)
                                          //       .addItem(searchReturnData);

                                          //   //left from here
                                          //   Provider.of<TryModel>(context, listen: false)
                                          //       .addBasketData(
                                          //           0, null, null, null, null, null);
                                          //   } catch (e) {
                                          //     print("go ya! too");

                                          //   }

                                          // }
                                        },
                                      ),
                                      Expanded(
                                        child: TabBar(
                                          indicatorSize:
                                              TabBarIndicatorSize.tab,
                                          unselectedLabelColor: Colors.white,
                                          labelColor: Colors.black,
                                          indicator: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            color: Color(0xffaaaaaa),
                                            // gradient: LinearGradient(colors: [
                                            //   // Colors.greenAccent,
                                            //   // Colors.green
                                            //   Color(0xff902326),
                                            //   Color(0xff902326).withOpacity(0.6),
                                            // ]),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          controller: _tabControllerTwo,
                                          isScrollable: true,
                                          onTap: (index) async {
                                            _scrollToIndex(index);
                                          },
                                          tabs: List.generate(
                                            displayList.length,
                                            (i) {
                                              return Tab(
                                                  text: parse(displayList[i]
                                                          .toString())
                                                      .documentElement
                                                      .text);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.connectionState ==
                              ConnectionState.waiting ||
                          snapshot.data == null) {
                        return Container(
                          height: 55,
                          child: ShimmerListTabBar(),
                          color: Color(0xffedf1ff),
                        );
                      }
                      return Container(
                        height: 55,
                        child: ShimmerListTabBar(),
                        color: Color(0xffedf1ff),
                      );
                    })
                : secondCall(list)));
  }

  secondCall(list) {
    if (refreshDataOne == false) {
      // if(snapshot.data[0]=="SocketException"){
      //    setState(() {
      //      showFlushBar=true;
      //     });
      // }
      //  change=false;
      displayList = [];
      // print(list.toString());
      for (var i = 0; i < list.length; i++) {
        String replaceChar = list[i].values.toString();
        String varForKandG = list[i].keys.toString();
        print(replaceChar);
        if (replaceChar == selectedParent) {
          print("Hello");
          displayList.add(parse(list[i].keys.toString()).documentElement.text);
        } else if (varForKandG == selectedParent) {
          displayList.add(parse(list[i].keys.toString()).documentElement.text);
        }
      }

      for (var i = 0; i < displayList.length; i++) {
        String disp = displayList[i];
        String strNew = disp.replaceAll(disp[0], "");
        strNew = strNew.replaceAll(disp[disp.length - 1], "");
        // print(strNew);
        displayList[i] = strNew;
      }

      // setState(() {
      //                   displayList=displayList;
      //                   });
      // setState(() {
      testList = displayList;

      // });
      //displayList = displayList.reversed.toList();

      if (displayList[0] == "PAKORAS") {
        displayList[0] = "SUPPEN";
        displayList[1] = "SALATE";
        displayList[2] = "PAKORAS";
      }
      if (displayList[0] == "ENTE-SPEZIALITÄTEN") {
        displayList[0] = "VEGETARISCHE GERICHTE";
        displayList[1] = "HÜHNERFLEISCHGERICHTE";
        displayList[2] = "LAMMFLEISCHGERICHTE";
        displayList[3] = "ENTE-SPEZIALITÄTEN";
        displayList[4] = "FISCHGERICHTE";
        displayList[5] = "SCAMPIGERICHTE";
        displayList[6] = "SPEZIALITÄTEN VOM GRILL";
        displayList[7] = "REISGERICHTE";
      }

      if (displayList[0] == "COCKTAILS") {
        displayList[0] = "ERFRISCHUNGSGETRÄNKE";
        displayList[1] = "FLASCHENBIER";
        // displayList[2] = "FLASCHENWEINE";
        displayList[2] = "JOGHURTGETRÄNKE";
        displayList[3] = "COCKTAILS";
      }

      //    if (displayList[0] == "FLASCHENBIER") {
      //   displayList[0] = "ERFRISCHUNGSGETRÄNKE";
      //   displayList[1] = "FLASCHENBIER";
      //   displayList[2] = "FLASCHENWEINE";
      //   displayList[3] = "JOGHURTGETRÄNKE";
      //   displayList[4] = "COCKTAILS";
      // }

      countList = 1;
      _tabControllerTwo = TabController(
        length: displayList.length,
        vsync: this,
      );

      return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: //isExpaned ? 0.0 :
            1,
        child: DefaultTabController(
          length: displayList.length,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(
                color: Color(0xff010101),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        // var model = Provider.of<TryModel>(context,listen: false);
                        var searchReturnData = await showSearch(
                            context: context, delegate: DataSearch());
                        // if (searchReturnData != null) {
                        //   Provider.of<TryModel>(context, listen: false)
                        //       .addItem(searchReturnData);

                        //   //left from here
                        //   Provider.of<TryModel>(context, listen: false)
                        //       .addBasketData(
                        //           0, null, null, null, null, null);
                        // }
                      },
                    ),
                    Expanded(
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.black,
                        indicator: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          color: Color(0xffd3d4d3),
                          // gradient: LinearGradient(colors: [
                          //   Color(0xff902326),
                          //   Color(0xff902326).withOpacity(0.6),
                          //   // Colors.greenAccent,
                          //   // Colors.green,
                          // ]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        controller: _tabControllerTwo,
                        isScrollable: true,
                        onTap: (index) async {
                          _scrollToIndex(index);
                        },
                        tabs: List.generate(
                          displayList.length,
                          (i) {
                            return Tab(
                                text: parse(displayList[i].toString())
                                    .documentElement
                                    .text);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 55,
        child: ShimmerListTabBar(),
        color: Color(0xffedf1ff),
      );
    }
    // return Container(height: 55, child: ShimmerListTabBar());
  }

  void _scrollToIndex(int index) {
    // print(
    //     "The offset scrolled now is before updating ${_autoScrollController.offset} and the height is now ${(MediaQuery.of(context).size.height / 1.6 - kToolbarHeight)}");

    // print("The index to scroll to item is this $index");
    _autoScrollController.scrollToIndex(index,
        // duration: Duration(seconds: 2),
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  //Method for generating random color
  // getRandomColor() {
  //   RandomColor randomColor = RandomColor();
  //   Color color = randomColor.randomColor();
  //   return color;
  // }
  //

  Future<Null> _refresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    setState(() {
      refreshDataOne = true;
      refreshDataTwo = true;
    });

    fetchWpPosts(context).then((_s) {
      setState(() {
        refreshDataTwo = false;
      });
    });

    Future.delayed(const Duration(seconds: 10), () {
      fetchWpCategoriesList().then((_first) {
        setState(() {
          refreshDataOne = false;
        });
      });
    });
    return null;
  }

  bool showOfflineOnline = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          top: true,
          child: Scaffold(
            drawer: MainDrawer(),
            // drawerScrimColor: Color(0xff902326),
            key: _scaffoldKey,
            //  appBar: AppBar(),
            bottomNavigationBar: Consumer<TryModel>(
              builder: (context, tryM, child) =>
                  countDataForSearch[0].itemCount == 0
                      ? Container(height: 0.0, child: Text(''))
                      : bottomNavBar(context, tryM),
            ),
            extendBodyBehindAppBar: false,
            body: RefreshIndicator(
              onRefresh: _refresh,
              child: CustomScrollView(
                controller: _autoScrollController,
                physics: new ClampingScrollPhysics(),
                shrinkWrap: false,
                slivers: <Widget>[
                  //SliverAppBar(),
                  SliverAppBar(
                    iconTheme: IconThemeData(color: Color(0xff010101)),
                    backgroundColor: Colors.white,
                    expandedHeight: MediaQuery.of(context).size.height / 3,
                    pinned: false,
                    floating: false,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.27,
                            width: MediaQuery.of(context).size.width * 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              child: Image.asset(
                                'images/cocoliebe.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.bottomCenter,
                            //  color: Colors.yellow,
                            // height: 60,
                            padding: EdgeInsets.symmetric(
                                // top: 25,

                                horizontal: 5,
                                vertical: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TweenAnimationBuilder(
                                  child: Text(
                                    'Cocoliebe Restaurant',
                                    style: TextStyle(
                                        color: Color(0xff950b1b),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  curve: Curves.easeInCubic,
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: Duration(milliseconds: 1200),
                                  builder: (BuildContext context, double _val,
                                      Widget child) {
                                    return Opacity(
                                      opacity: _val,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: _val *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6.8),
                                        child: child,
                                      ),
                                    );
                                  },
                                ),
                                ScaleTransition(
                                  scale: CurvedAnimation(
                                      parent: animationController,
                                      curve: Curves.bounceInOut),
                                  child: Opacity(
                                    opacity: (animation1.value),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 18.0, top: 2),
                                      child: Container(
                                        // alignment: Alignment.center,
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Color(0xff010101),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(2, 5),
                                                blurRadius: 20,
                                                spreadRadius: 0.01)
                                          ],
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                            iconSize: 20,
                                            icon: Icon(
                                              Icons.perm_contact_cal,
                                              color: Color(0xffffffff),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 500),
                                                    pageBuilder: (context,
                                                        animation,
                                                        secondAnimation) {
                                                      return Information();
                                                    },
                                                    transitionsBuilder:
                                                        (context,
                                                            animation,
                                                            secondaryAnimation,
                                                            child) {
                                                      return Material(
                                                        elevation: 12,
                                                        child: SlideTransition(
                                                          position: animation.drive(Tween(
                                                                  begin: Offset(
                                                                      1, 0),
                                                                  end: Offset(
                                                                      0, 0))
                                                              .chain(CurveTween(
                                                                  curve: Curves
                                                                      .easeOutCubic))),
                                                          child:
                                                              ScaleTransition(
                                                            scale: animation,
                                                            child: child,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  _buildSliverAppbarFirst(parents),
                  _buildSliverAppbarSecond(category),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SingleChildScrollView(
                      child: FutureBuilder(
                          future: postTwo,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.hasData &&
                                refreshDataTwo == false &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              // if(snapshot.data.isNostEmpty){
                              //   if(snapshot.data[0]=="SocketException"){

                              //      return Container(
                              //      height: 1000, child: ShimmerList());
                              // }
                              // }

                              return ListView(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  for (var i = 0; i < displayList.length; i++)
                                    VisibilityDetector(
                                      key: Key(i.toString()),
                                      onVisibilityChanged: (info) {
                                        // if (!_autoScrollController.isAutoScrolling) return;
                                        var visiblePercentage =
                                            info.visibleFraction * 100;
                                        if (visiblePercentage > 20) {
                                          _visibleItems.putIfAbsent(
                                              i, () => true);
                                        } else {
                                          _visibleItems.remove(i);
                                        }
                                        _calculateIndexAndJumpToTabOne(
                                            _visibleItems);
                                      },
                                      child: _wrapScrollTag(
                                        index: i,
                                        child: Container(
                                          color: Colors.white,
                                          child: Padding(
                                            // controller: _autoScrollController,
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: Container(
                                                    height: 60,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        //  color: Color(0xff902326),
                                                        // border: Border.all(
                                                        //   color:
                                                        //       Color(0xFFF8F5F2),
                                                        // ),
                                                        ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: RichText(
                                                        text: TextSpan(
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18.0,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text:
                                                                  "${parse(displayList[i].toString()).documentElement.text}\n",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      18.0,
                                                                  color: Color(
                                                                      0xffc72e2e),  
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextSpan(
                                                              text: categorydescription[
                                                                          i] ==
                                                                      null
                                                                  ? ''
                                                                  : "\n${categorydescription[i]}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black87),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                for (var j = 0;
                                                    j < product.length - 1;
                                                    j++)
                                                  for (var k = 0;
                                                      k < product[j].length;
                                                      k++)
                                                    if (product[j][k]
                                                                ['categories']
                                                            [0]['name'] ==
                                                        displayList[i])
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 6.0),
                                                        child: Card(
                                                          color:
                                                              Color(0xffefeff5),
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 4,
                                                            right: 4,
                                                            bottom: 6,
                                                            top: 2,
                                                          ),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          elevation: 3,
                                                          child: InkWell(
                                                            // splashColor: Colors
                                                            //     .grey[300],
                                                            onTap: () {
                                                              if (product[j][k][
                                                                          'categories']
                                                                      [
                                                                      0]['name']
                                                                  .contains(
                                                                      'Salate')) {
                                                                //for displyaing more details of Vegetarisch
                                                                print(
                                                                    'yesssssssssss');

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            _context) {
                                                                      return AlertDialog(

                                                                          // insetPadding: EdgeInsets.symmetric(vertical: 300),
                                                                          // title: Text('Hi'),
                                                                          content:
                                                                              Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            'Wählen Beilagen:',
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          TextButton(
                                                                              // focusNode: FocusNode(),
                                                                              onPressed: () {
                                                                                // product[j][k]['name'] = '${(product[j][k]['name'])} \n with Mit Basmati-Reis';
                                                                                Provider.of<TryModel>(context, listen: false).addItem();
                                                                                Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Mit Hausgemachtem Joghurtdressing');
                                                                                Navigator.pop(_context);
                                                                              },
                                                                              child: Text("Mit Hausgemachtem Joghurtdressing")),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                //  product[j][k]['name'] = '${(product[j][k]['name'])} \n with Mit Brot (Bhatura)';
                                                                                Provider.of<TryModel>(context, listen: false).addItem();
                                                                                Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Mit Essigöl,Kräuterdressing');

                                                                                Navigator.pop(_context);
                                                                              },
                                                                              child: Text("Mit Essigöl,Kräuterdressing")),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                //  product[j][k]['name'] = '${(product[j][k]['name'])} \n with Ohne Beilage';
                                                                                Provider.of<TryModel>(context, listen: false).addItem();
                                                                                Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Ohne Anziehen');

                                                                                Navigator.pop(_context);
                                                                              },
                                                                              child: Text("Ohne Dressing")),
                                                                        ],
                                                                      ));
                                                                    });
                                                              } else if (product[j][k]['categories'][0]['name']
                                                                          .contains(
                                                                              'HAUPTGERICHTE') ||
                                                                      // product[j][k]['categories'][0]['name']
                                                                      //     .contains(
                                                                      //         'Singapurische Vegetarische Gerichte') || //for displyaing more details of ente
                                                                      // product[j][k]['categories'][0]['name']
                                                                      //     .contains(
                                                                      //         'Indische Huhngerichte') || //for displyaing more details of fisch
                                                                      // product[j][k]['categories'][0]['name']
                                                                      //     .contains(
                                                                      //         'Singapurische Huhngerichte') || //for displyaing more details of lamm
                                                                      // product[j][k]['categories'][0]['name']
                                                                      //     .contains(
                                                                      //         'Indische Entengerichte') || //for displyaing more details of lamm
                                                                      // product[j][k]['categories'][0]
                                                                      //         ['name']
                                                                      //     .contains('Singapurische Entengerichte') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]['name']
                                                                          .contains(
                                                                              'VEGETARISCHE GERICHTE') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]['name']
                                                                          .contains(
                                                                              'VEGANE GERICHTE') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]['name']
                                                                          .contains(
                                                                              'LAMM-GERICHTE') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]['name']
                                                                          .contains(
                                                                              'HÜHNERFLEISCHGERICHTE') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]
                                                                              ['name']
                                                                          .contains('FISCHGERICHTE') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]['name'].contains('ENTENGERICHTE') || //for displyaing more details of lamm
                                                                      product[j][k]['categories'][0]['name'].contains('SPEZIALITÄTEN DES HAUSES')
                                                                  // || //for displyaing more details of lamm
                                                                  // product[j][k]['categories'][0]['name'].contains('Vegetarisch') || //for displyaing more details of lamm
                                                                  // product[j][k]['categories'][0]['name'].contains('Hähnchen') || //for displyaing more details of lamm
                                                                  // product[j][k]['categories'][0]['name'].contains('Lamm') || //for displyaing more details of lamm
                                                                  // product[j][k]['categories'][0]['name'].contains('Ente') || //for displyaing more details of lamm
                                                                  // product[j][k]['categories'][0]['name'].contains('Fisch')
                                                                  ) {
                                                                //for displyaing more details of Vegetarisch
                                                                print(
                                                                    'yesssssssssss');

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            _context) {
                                                                      return AlertDialog(

                                                                          // insetPadding: EdgeInsets.symmetric(vertical: 300),
                                                                          // title: Text('Hi'),
                                                                          content:
                                                                              Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            ' BEILAGEN*',
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                //  product[j][k]['name'] = '${(product[j][k]['name'])} \n with Ohne Beilage';
                                                                                Provider.of<TryModel>(context, listen: false).addItem();
                                                                                Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Mit Basmati-Reis');

                                                                                Navigator.pop(_context);
                                                                              },
                                                                              child: Text(" Mit Basmati-Reis")),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                //  product[j][k]['name'] = '${(product[j][k]['name'])} \n with Mit Brot (Bhatura)';
                                                                                Provider.of<TryModel>(context, listen: false).addItem();
                                                                                Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Mit Brot(Bhatura)');

                                                                                Navigator.pop(_context);
                                                                              },
                                                                              child: Text(" Mit Brot(Bhatura)")),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                //  product[j][k]['name'] = '${(product[j][k]['name'])} \n with Ohne Beilage';
                                                                                Provider.of<TryModel>(context, listen: false).addItem();
                                                                                Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Ohne Beilage');

                                                                                Navigator.pop(_context);
                                                                              },
                                                                              child: Text(" Ohne Beilage")),
                                                                          // TextButton(
                                                                          //     onPressed: () {
                                                                          //       //  product[j][k]['name'] = '${(product[j][k]['name'])} \n with Ohne Beilage';
                                                                          //       Provider.of<TryModel>(context, listen: false).addItem();
                                                                          //       Provider.of<TryModel>(context, listen: false).addBasketDatas(1, product[j][k]['name'], double.tryParse(product[j][k]['price']), product[j][k]['id'], product[j][k]['tax_class'], product[j][k]['short_description'], 'Sehr scharf');

                                                                          //       Navigator.pop(_context);
                                                                          //     },
                                                                          //     child: Text("Sehr scharf")),
                                                                        ],
                                                                      ));
                                                                    });
                                                              } else {
                                                                Provider.of<TryModel>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .addItem();
                                                                Provider.of<TryModel>(context, listen: false).addBasketData(
                                                                    1,
                                                                    product[j]
                                                                            [k][
                                                                        'name'],
                                                                    double.tryParse(
                                                                        product[j][k]
                                                                            [
                                                                            'price']),
                                                                    product[j]
                                                                            [k]
                                                                        ['id'],
                                                                    product[j]
                                                                            [k][
                                                                        'tax_class'],
                                                                    product[j]
                                                                            [k][
                                                                        'short_description']);
                                                              }
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5,
                                                                      right: 5,
                                                                      bottom:
                                                                          12,
                                                                      top: 5),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Row(
                                                                          // crossAxisAlignment:
                                                                          //     CrossAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                parse(product[j][k]['name']).documentElement.text,
                                                                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            // Expanded(
                                                                            //   child: Container(
                                                                            //     margin: EdgeInsets.only(left: 0.0),
                                                                            //     child: IconButton(
                                                                            //       onPressed: () {
                                                                            //         Navigator.push(
                                                                            //             context,
                                                                            //             MaterialPageRoute(
                                                                            //                 builder: (context) => ShortDescritption(
                                                                            //                       productName: parse(product[j][k]['name']).documentElement.text,
                                                                            //                       description: parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                                                            //                     )));
                                                                            //       },
                                                                            //       icon: Icon(
                                                                            //         Icons.info_outline_rounded,
                                                                            //         // color: Colors,
                                                                            //         color: Color(0xff902326),
                                                                            //       ),
                                                                            //     ),
                                                                            //   ),
                                                                            // ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            40,
                                                                        width:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
                                                                          border:
                                                                              Border.all(color: Color(0xffe45c5c)),
                                                                          // color: itemspressed == index
                                                                          // ? Colors.grey[350]
                                                                          // : null,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              Color(0xffc72e2e),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  parse(("${product[j][k]['short_description']}").toString())
                                                                              .documentElement
                                                                              .text ==
                                                                          ""
                                                                      ? Container()
                                                                      : IntrinsicHeight(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder: (context) => ShortDescritption(
                                                                                            productName: parse(product[j][k]['name']).documentElement.text,
                                                                                            description: parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                                                                          )));
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 100,
                                                                                  child: Text(
                                                                                    // wppost[j]['description'],
                                                                                    parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                                                                    style: TextStyle(fontSize: 14, color: Colors.black),
                                                                                    maxLines: 1,
                                                                                    overflow: TextOverflow.clip,
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                    // width:
                                                                                    //     10.0,
                                                                                    child: Icon(Icons.more_horiz, color: Color(0xffc72e2e))),

                                                                                // if{(TextField(maxLines: 2))}
                                                                                // if(TextBaseline=2){},else{}

                                                                                // Flexible(
                                                                                //   flex: 1,
                                                                                //   fit: FlexFit
                                                                                //       .loose,
                                                                                //   child:
                                                                                //       Container(
                                                                                //     margin:
                                                                                //         EdgeInsets.only(left: 0.0),
                                                                                //     child:
                                                                                //         IconButton(
                                                                                //       onPressed:
                                                                                //           () {
                                                                                //         Navigator.push(
                                                                                //             context,
                                                                                //             MaterialPageRoute(
                                                                                //                 builder: (context) => ShortDescritption(
                                                                                //                       productName: parse(product[j][k]['name']).documentElement.text,
                                                                                //                       description: parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                                                                //                     )));
                                                                                //       },
                                                                                //       icon:
                                                                                //           Icon(
                                                                                //         Icons.more_horiz_sharp,
                                                                                //         // color: Colors,
                                                                                //         color: Color(0xff902326),
                                                                                //       ),
                                                                                //     ),
                                                                                //   ),
                                                                                // ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                  SizedBox(
                                                                      height:
                                                                          5.0),
                                                                  Text(
                                                                    // wppost[j]['price'],
                                                                    parse(("${product[j][k]['price']} €")
                                                                            .toString())
                                                                        .documentElement
                                                                        .text,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Color(
                                                                            0xffc72e2e),
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                SizedBox(
                                                  height: 10,
                                                  child: const DecoratedBox(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                snapshot.data == null) {
                              return Container(
                                  height: 1000, child: ShimmerList());
                            } else {
                              return Container(
                                  height: 1000, child: ShimmerList());
                            }
                          }),
                    ),
                    Wrap(children: [
                      Contact(),
                    ]),
                  ]))
                ],
              ),
            ),
          )),
    );
  }

  getHeight() {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        showOfflineOnline = false;
      });
    });
  }
}

void _calculateIndexAndJumpToTabOne(Map<int, bool> visibleItems) async {
  List<int> indexes = List.from(_visibleItems.keys.toList());
  indexes.sort();
  int topMostVisibleItem = indexes.first;
  _tabControllerTwo.animateTo(topMostVisibleItem);
}

class DataSearch extends SearchDelegate<String> {
  final ValueChanged<List> updateBasketNavBar;
  DataSearch({this.updateBasketNavBar});
  List productPriceAndName = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    // context= this.context;
    //actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return WillPopScope(
      onWillPop: () async => false,
      child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            close(context, "hello");

            //print("haha!gotya");
            // if(model[0]!=null){
            //   updateBasketNavBar(model);
            // }

            //Navigator.pop(context,"Hello");
          }),
    );
  }

  @override
  // ignore: missing_return

  //-------------------------------------------------> displayList[0] = search results when user search  specific products <-----------------------------------------------------
  Widget buildResults(BuildContext context) {
    // show some result based on the selection

    showBasketBar = true;

    return WillPopScope(
        onWillPop: () async => false,
        child: Center(
            child: myList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 80.0,
                      ),
                      Text('Oops! no such products',
                          style: TextStyle(color: Colors.grey, fontSize: 15.0)),
                    ],
                  )
                : ChangeNotifierProvider(
                    create: (context) => TryModel(),
                    child: Consumer<TryModel>(
                      builder: (context, tryM, child) => Scaffold(
                        key: _scaffoldKeyTwo,
                        bottomNavigationBar:
                            // Consumer<TryModel>(builder: (context, tryM, child) {
                            // if (countDataForSearch.isNotEmpty ||
                            //     basketDataForSearch.isNotEmpty) {
                            // if (showBasketBar == true) {
                            //   Provider.of<TryModel>(context, listen: false)
                            //       .addItem("yelo");
                            //   Provider.of<TryModel>(context, listen: false)
                            //       .addBasketData(
                            //           0, null, null, null, null, null);
                            //   if (basketPageIsPressed == true) {
                            //     Provider.of<TryModel>(context, listen: false)
                            //         .addpstCode(result[1]);
                            //     Provider.of<TryModel>(context, listen: false)
                            //         .il = result[0];
                            //     basketPageIsPressed = true;
                            //   }
                            //   showBasketBar = true;
                            // }
                            //   }

                            countDataForSearch[0].itemCount == 0
                                ? Container(height: 0.0, child: Text(''))
                                : bottomNavBar(context, tryM),
                        // }),
                        //     Consumer<TryModel>(builder: (context, tryM, child) {
                        //                   if ( Provider.of<TryModel>(context, listen: true).il.isNotEmpty ||
                        // Provider.of<TryModel>(context, listen: true).basketData.isNotEmpty) {
                        // if (showBasketBar == true) {
                        //   Provider.of<TryModel>(ctx, listen: false)
                        //       .addItem();
                        //   Provider.of<TryModel>(ctx, listen: false)
                        //       .addBasketData(
                        //           0, null, null, null, null, null);
                        //   if (basketPageIsPressed == true) {
                        //     Provider.of<TryModel>(ctx, listen: false)
                        //         .addpstCode(result[1]);
                        //     Provider.of<TryModel>(ctx, listen: false)
                        //         .il= result[0];
                        //     basketPageIsPressed = true;
                        //   }
                        //   showBasketBar = true;
                        // }
                        // }
                        // bottomNavBar(),
                        ////   }),
                        //  return bottomNavBar(context);}),
                        body: ListView.builder(
                            itemCount: myList.length,
                            itemBuilder: (ctx, index) {
                              productItem = myList[index];
                              //print(productItem);
                              return Column(children: [
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      showBasketBar = false;
                                      //second call
                                      Provider.of<TryModel>(ctx, listen: false)
                                          .addItem("secondpage");
                                      Provider.of<TryModel>(ctx, listen: false)
                                          .addBasketData(
                                              1,
                                              myList[index]['name'],
                                              double.tryParse(
                                                  myList[index]['price']),
                                              myList[index]['id'],
                                              myList[index]['tax_class'],
                                              myList[index]
                                                  ['short_description'],
                                              "pageSecond");
                                    },
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(productItem['name'].toString()),
                                        SizedBox(height: 10.0),
                                        // Row(
                                        //   children: [
                                        //     Flexible(
                                        //       fit: FlexFit.loose,
                                        //       flex: 4,
                                        //       child: Text(
                                        //           // wppost[j]['description'],
                                        //           // parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                        //           (parse((productItem[
                                        //                       'short_description'])
                                        //                   .toString())
                                        //               .documentElement
                                        //               .text),
                                        //           style: TextStyle(
                                        //               fontSize: 14,
                                        //               color: Colors.black),
                                        //           maxLines: 1,
                                        //           softWrap: false,
                                        //           overflow: TextOverflow.fade),
                                        //     ),
                                        //     // if{(TextField(maxLines: 2))}
                                        //     // if(TextBaseline=2){},else{}
                                        //     Flexible(
                                        //       fit: FlexFit.tight,
                                        //       flex: 1,
                                        //       child: RichText(
                                        //         text: TextSpan(
                                        //           style: TextStyle(
                                        //               // color: Color(0xff902326),
                                        //               fontSize: 30.0),
                                        //           children: <TextSpan>[
                                        //             TextSpan(
                                        //               text: ' ...',
                                        //               style: TextStyle(
                                        //                   color: Colors
                                        //                           .orangeAccent[
                                        //                       700]),
                                        //               recognizer:
                                        //                   TapGestureRecognizer()
                                        //                     ..onTap = () {
                                        //                       Navigator.push(
                                        //                         context,
                                        //                         MaterialPageRoute(
                                        //                           builder:
                                        //                               (context) =>
                                        //                                   ShortDescritption(
                                        //                             productName: (parse(
                                        //                                     (productItem['name']).toString())
                                        //                                 .documentElement
                                        //                                 .text),
                                        //                             description: (parse(
                                        //                                     (productItem['short_description']).toString())
                                        //                                 .documentElement
                                        //                                 .text),
                                        //                           ),
                                        //                         ),
                                        //                       );
                                        //                     },
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        parse(("${myList[index]['short_description']}")
                                                        .toString())
                                                    .documentElement
                                                    .text ==
                                                ""
                                            ? Container()
                                            : IntrinsicHeight(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ShortDescritption(
                                                                  productName: parse(
                                                                          myList[index]
                                                                              [
                                                                              'name'])
                                                                      .documentElement
                                                                      .text,
                                                                  description: parse(
                                                                          ("${myList[index]['short_description']}")
                                                                              .toString())
                                                                      .documentElement
                                                                      .text,
                                                                )));
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 100,
                                                        child: Text(
                                                          // wppost[j]['description'],
                                                          parse(("${productItem['short_description']}")
                                                                  .toString())
                                                              .documentElement
                                                              .text,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black),
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow.clip,
                                                        ),
                                                      ),
                                                      Container(
                                                          // width:
                                                          //     10.0,
                                                          child: Icon(
                                                              Icons.more_horiz,
                                                              color: Colors
                                                                  .amber)),

                                                      // if{(TextField(maxLines: 2))}
                                                      // if(TextBaseline=2){},else{}

                                                      // Flexible(
                                                      //   flex: 1,
                                                      //   fit: FlexFit
                                                      //       .loose,
                                                      //   child:
                                                      //       Container(
                                                      //     margin:
                                                      //         EdgeInsets.only(left: 0.0),
                                                      //     child:
                                                      //         IconButton(
                                                      //       onPressed:
                                                      //           () {
                                                      //         Navigator.push(
                                                      //             context,
                                                      //             MaterialPageRoute(
                                                      //                 builder: (context) => ShortDescritption(
                                                      //                       productName: parse(product[j][k]['name']).documentElement.text,
                                                      //                       description: parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                                      //                     )));
                                                      //       },
                                                      //       icon:
                                                      //           Icon(
                                                      //         Icons.more_horiz_sharp,
                                                      //         // color: Colors,
                                                      //         color: Color(0xff902326),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                        //old files

                                        // Text(parse((productItem[
                                        //             'short_description'])
                                        //         .toString())
                                        //     .documentElement
                                        //     .text),

                                        // parse(("${product[j][k]['description']}")
                                        //                                             .toString())
                                        //                                         .documentElement
                                        //                                         .text,
                                        SizedBox(height: 10.0),

                                        Text(
                                          '${(productItem['price'].toString())}€',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                        // Container(
                                        //                                 height:
                                        //                                     40,
                                        //                                 width:
                                        //                                     40,
                                        //                                 decoration:
                                        //                                     BoxDecoration(
                                        //                                   shape:
                                        //                                       BoxShape.rectangle,
                                        //                                   border:
                                        //                                       Border.all(color: Colors.grey[350]),
                                        //                                   // color: itemspressed == index
                                        //                                   // ? Colors.grey[350]
                                        //                                   // : null,
                                        //                                 ),
                                        //                                 child:
                                        //                                     Icon(
                                        //                                   Icons
                                        //                                       .add,
                                        //                                   color:
                                        //                                       Color(0xff902326),
                                        //                                 ),
                                        //                               ),
                                      ],
                                    ),
                                    trailing: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border:
                                            Border.all(color: Colors.grey[350]),
                                        // color: itemspressed == index
                                        // ? Colors.grey[350]
                                        // : null,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xff902326),
                                      ),
                                    ),
                                  ),
                                )
                              ]);
                            }),
                      ),
                    ))));

    // child: Text(myList[0]['name'].toString())
  }

  //-------------------------------------------------> displayList[0] = search products <-----------------------------------------------------
  @override
  Widget buildSuggestions(BuildContext context) {
    // for(i = 0; i< productItem){}
    myList = query.isEmpty
        ? productItems
        : productItems
            .where((e) =>
                e['name'].toUpperCase().contains(query) ||
                e['name'].toLowerCase().contains(query))
            .toList();
    // print('------------------------>Similar products here!<-------------------------');
    // print(myList);
    return myList.isEmpty
        ? WillPopScope(
            onWillPop: () async => false,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Sorry, no products found',
                  style: TextStyle(color: Colors.grey)),
            ),
          )
        : WillPopScope(
            onWillPop: () async => false,
            child:
                // ChangeNotifierProvider(
                //   create: (context) => TryModel(),
                //  child:
                ChangeNotifierProvider(
              create: (context) => TryModel(),
              child: Consumer<TryModel>(
                builder: (context, tryM, child) => Scaffold(
                  key: _scaffoldKeyOne,
                  bottomNavigationBar:
                      //   Consumer<TryModel>(builder: (context, tryM, child) {
                      // if (countDataForSearch.isNotEmpty ||
                      //     basketDataForSearch.isNotEmpty) {
                      // if (showBasketBar == true) {
                      //   Provider.of<TryModel>(context, listen: false)
                      //       .addItem("lol");

                      //   //left from here
                      //   Provider.of<TryModel>(context, listen: false)
                      //       .addBasketData(0, null, null, null, null, null);
                      //   if (basketPageIsPressed == true) {
                      //     Provider.of<TryModel>(context, listen: false)
                      //         .addpstCode(result[1]);
                      //     Provider.of<TryModel>(context, listen: false).il =
                      //         result[0];
                      //     basketPageIsPressed = true;
                      //   }

                      //   showBasketBar = true;
                      // }
                      countDataForSearch[0].itemCount == 0
                          ? Container(height: 0.0, child: Text(''))
                          : bottomNavBar(context, tryM),
                  body: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      productItem = myList[index];
                      print(productItem);
                      return Column(
                        children: [
                          Card(
                            color: Color(0xfff7e6e6),
                            child: ListTile(
                              onTap: () {
                                showBasketBar = false;
                                //first call
                                Provider.of<TryModel>(context, listen: false)
                                    .addItem("secondpage");
                                Provider.of<TryModel>(context, listen: false)
                                    .addBasketData(
                                  1,
                                  myList[index]['name'],
                                  double.tryParse(myList[index]['price']),
                                  myList[index]['id'],
                                  myList[index]['tax_class'],
                                  myList[index]['short_description'],
                                  "pageSecond",
                                );
                              },
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productItem['name'].toString()),
                                  SizedBox(height: 10.0),
                                  parse(("${myList[index]['short_description']}")
                                                  .toString())
                                              .documentElement
                                              .text ==
                                          ""
                                      ? Container()
                                      : IntrinsicHeight(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShortDescritption(
                                                            productName: parse(
                                                                    myList[index]
                                                                        [
                                                                        'name'])
                                                                .documentElement
                                                                .text,
                                                            description: parse(
                                                                    ("${myList[index]['short_description']}")
                                                                        .toString())
                                                                .documentElement
                                                                .text,
                                                          )));
                                            },
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    // wppost[j]['description'],
                                                    parse(("${productItem['short_description']}")
                                                            .toString())
                                                        .documentElement
                                                        .text,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                                Container(
                                                    // width:
                                                    //     10.0,
                                                    child: Icon(
                                                        Icons.more_horiz,
                                                        color:
                                                            Color(0xffc72e2e))),

                                                // if{(TextField(maxLines: 2))}
                                                // if(TextBaseline=2){},else{}

                                                // Flexible(
                                                //   flex: 1,
                                                //   fit: FlexFit
                                                //       .loose,
                                                //   child:
                                                //       Container(
                                                //     margin:
                                                //         EdgeInsets.only(left: 0.0),
                                                //     child:
                                                //         IconButton(
                                                //       onPressed:
                                                //           () {
                                                //         Navigator.push(
                                                //             context,
                                                //             MaterialPageRoute(
                                                //                 builder: (context) => ShortDescritption(
                                                //                       productName: parse(product[j][k]['name']).documentElement.text,
                                                //                       description: parse(("${product[j][k]['short_description']}").toString()).documentElement.text,
                                                //                     )));
                                                //       },
                                                //       icon:
                                                //           Icon(
                                                //         Icons.more_horiz_sharp,
                                                //         // color: Colors,
                                                //         color: Color(0xff902326),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  // Text(parse((productItem['short_description'])
                                  //         .toString())
                                  //     .documentElement
                                  //     .text),

                                  SizedBox(height: 10.0),
                                  Text(
                                    '${(productItem['price'].toString())}€',
                                    style: TextStyle(color: Color(0xffc72e2e)),
                                  ),
                                  // Container(
                                  //                                       height:
                                  //                                           40,
                                  //                                       width:
                                  //                                           40,
                                  //                                       decoration:
                                  //                                           BoxDecoration(
                                  //                                         shape:
                                  //                                             BoxShape.rectangle,
                                  //                                         border:
                                  //                                             Border.all(color: Colors.grey[350]),
                                  //                                         // color: itemspressed == index
                                  //                                         // ? Colors.grey[350]
                                  //                                         // : null,
                                  //                                       ),
                                  //                                       child:
                                  //                                           Icon(
                                  //                                         Icons
                                  //                                             .add,
                                  //                                         color:
                                  //                                             Color(0xff902326),
                                  //                                       ),
                                  //                                     ),
                                ],
                              ),
                              trailing: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Color(0xffc72e2e)),
                                  // color: itemspressed == index
                                  // ? Colors.grey[350]
                                  // : null,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xffa75264),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ));
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

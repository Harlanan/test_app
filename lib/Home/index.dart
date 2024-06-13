
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Tool/hotel_app_theme.dart';
import '../Tool/hotel_list_data.dart';
import '../Tool/hotel_list_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<HotelListData> hotelList = HotelListData.hotelList;
  final ScrollController _scrollController = ScrollController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  final List<String> images = [
    'assets/hotel/hotel_1.png',
    'assets/hotel/hotel_2.png',
    'assets/hotel/hotel_3.png',
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    // getAppBarUI(),
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: <Widget>[
                                        getTitleImg(),
                                        // getSearchBarUI(),
                                        // getTimeDateUI(),
                                      ],
                                    );
                                  }, childCount: 1),
                            ),
                            // SliverPersistentHeader(
                            //   pinned: true,
                            //   floating: true,
                            //   delegate: ContestTabHeader(
                            //     getFilterBarUI(),
                            //   ),
                            // ),
                          ];
                        },
                        body: Container(
                          color:
                          HotelAppTheme.buildLightTheme().backgroundColor,
                          child: ListView.builder(
                            itemCount: hotelList.length,
                            padding: const EdgeInsets.only(top: 8,bottom: 100),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              final int count =
                              hotelList.length > 10 ? 10 : hotelList.length;
                              final Animation<double> animation =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval(
                                          (1 / count) * index, 1.0,
                                          curve: Curves.fastOutSlowIn)));
                              animationController?.forward();
                              return HotelListView(
                                callback: () {},
                                hotelData: hotelList[index],
                                animation: animation,
                                animationController: animationController!,
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getListUI() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: HotelAppTheme.buildLightTheme().backgroundColor,
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(
  //             color: Colors.grey.withOpacity(0.2),
  //             offset: const Offset(0, -2),
  //             blurRadius: 8.0),
  //       ],
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           height: MediaQuery.of(context).size.height - 156 - 50,
  //           child: FutureBuilder<bool>(
  //             future: getData(),
  //             builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
  //               if (!snapshot.hasData) {
  //                 return const SizedBox();
  //               } else {
  //                 return ListView.builder(
  //                   itemCount: hotelList.length,
  //                   scrollDirection: Axis.vertical,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final int count =
  //                     hotelList.length > 10 ? 10 : hotelList.length;
  //                     final Animation<double> animation =
  //                     Tween<double>(begin: 0.0, end: 1.0).animate(
  //                         CurvedAnimation(
  //                             parent: animationController!,
  //                             curve: Interval((1 / count) * index, 1.0,
  //                                 curve: Curves.fastOutSlowIn)));
  //                     animationController?.forward();
  //
  //                     return HotelListView(
  //                       callback: () {},
  //                       hotelData: hotelList[index],
  //                       animation: animation,
  //                       animationController: animationController!,
  //                     );
  //                   },
  //                 );
  //               }
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget getHotelViewList() {
  //   final List<Widget> hotelListViews = <Widget>[];
  //   for (int i = 0; i < hotelList.length; i++) {
  //     final int count = hotelList.length;
  //     final Animation<double> animation =
  //     Tween<double>(begin: 0.0, end: 1.0).animate(
  //       CurvedAnimation(
  //         parent: animationController!,
  //         curve: Interval((1 / count) * i, 1.0, curve: Curves.fastOutSlowIn),
  //       ),
  //     );
  //     hotelListViews.add(
  //       HotelListView(
  //         callback: () {},
  //         hotelData: hotelList[i],
  //         animation: animation,
  //         animationController: animationController!,
  //       ),
  //     );
  //   }
  //   animationController?.forward();
  //   return Column(
  //     children: hotelListViews,
  //   );
  // }

  Widget getTitleImg() {
    return Column(
        children: <Widget>[
          Container (
            color: HotelAppTheme.buildLightTheme().backgroundColor,
            margin: EdgeInsets.only(
              top: 60,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: images.map((String image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ]
    );
  }

}
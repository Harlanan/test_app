import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'fitness_app_theme.dart';
import 'hotel_app_theme.dart';
import 'hotel_list_data.dart';

class AreaListView extends StatefulWidget {
  const AreaListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<HotelListData> hotelList = HotelListData.hotelList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey)
              // ),
              padding: const EdgeInsets.only(left: 8.0, right: 8,bottom: 140),
              child:  GridView(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 16, bottom: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List<Widget>.generate(
                  hotelList.length,
                      (int index) {
                    final int count = hotelList.length;
                    final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController?.forward();
                    return AreaView(
                      hotelData: hotelList[index],
                      animation: animation,
                      animationController: animationController!,
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 0.95,
                ),
              ),

            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView({
    Key? key,
    this.hotelData,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration:  BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                // border: Border.all(
                //   color: FitnessAppTheme.grey,
                // )
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {},
                child: Column(
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        if (hotelData != null) {
                          print("点击了 ${hotelData!.titleTxt}");
                          // 打印当前的hotelData的其他信息
                        }
                      },
                child: Container(
                decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 16,
                ),
                ],
                ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Image.asset(
                                    hotelData!.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  color: HotelAppTheme.buildLightTheme()
                                      .backgroundColor,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 0, bottom: 0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                hotelData!.titleTxt,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                hotelData!.subTxt,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ),
                                              Text(
                                                '\$${hotelData!.perNight}',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    )],
                ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

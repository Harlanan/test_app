import 'package:flutter/material.dart';

import 'hotel_app_theme.dart';
import 'hotel_list_data.dart';

class CartListView extends StatefulWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {

  List<HotelListData> hotelList = HotelListData.hotelList;


  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 25,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2),
          child: ListView.builder(
            padding: const EdgeInsets.only(
              left: 0,
              right: 0,
              top: 10,
              bottom: 242,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: hotelList.length,
            itemBuilder: (BuildContext context, int index) {
              return AreaView(
                hotelData: hotelList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}


class AreaView extends StatefulWidget {
  const AreaView(
      {Key? key,
        this.hotelData,
        this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final HotelListData? hotelData;


  @override
  _AreaViewState createState() => _AreaViewState();
}

class _AreaViewState extends State<AreaView> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 0, bottom: 16),
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
              Container(
                color: HotelAppTheme.buildLightTheme()
                    .backgroundColor,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 50,
                          child: Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                    Icons.radio_button_off
                                ), onPressed: () {  },
                              )
                          )
                      ),
                    ),

                    SizedBox(
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 8, bottom: 8
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // 设置圆角半径
                            child: Image.asset(
                              widget.hotelData!.imagePath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.grey)
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 1, bottom: 8),

                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.hotelData!.titleTxt,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.hotelData!.titleTxt,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey
                                        .withOpacity(0.8)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$${widget.hotelData!.perNight}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    // decoration:  BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.red,
                    //   )
                    // ),
                    child: Container(
                      width: 120,
                      // padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            width: 20,
                            child: Center(
                              child: Text(
                                '$quantity',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


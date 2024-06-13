import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Tool/fitness_app_theme.dart';
import '../Tool/my_page_list.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  List<OrderStatusListData> orderListData = OrderStatusListData.orderListData;

  List<MyListData> myListData = MyListData.myListData;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
     child: Scaffold(
       body: Column(
         children: <Widget>[
           getAvatarImg(),
           getBody()
         ]
       ),
     ),
    );
  }

  Widget getAvatarImg() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hotel_3.png'),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: CircleAvatar(
          radius: 50, // 设置半径
          backgroundImage: AssetImage('assets/images/hotel_1.png') // 设置头像图片
        ),
      )
    );
  }

  Widget getBody() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          // height: 100,
          margin: EdgeInsets.only(left: 5, right: 5),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin:  EdgeInsets.only(left: 15, top: 10,right: 18),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                      '我的订单',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      ),
                      Text(
                        '全部(10) >',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]
                  )
                ),
                Container(
                  height: 80,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey)
                  // ),
                  child: GridView(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      // mainAxisSpacing: 24.0,
                      // crossAxisSpacing: 24.0,
                      childAspectRatio: 1.0,
                    ),
                    children: List<Widget>.generate(
                      orderListData.length,
                          (int index) {
                        return Container(
                          // height: 100,
                          // decoration: BoxDecoration(
                          //   color: Colors.red,
                          // ),
                          child: Column(
                            children: [
                              Center(
                                  child: Image.asset(
                                    orderListData[index].imagePath,
                                  )

                              ),
                              Center(
                                child: Text(
                                  orderListData[index].titleTxt,
                                )
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            )
        ),
        SizedBox(height: 20),
        Container(
          // height: 100,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin:  EdgeInsets.only(left: 15, top: 10,right: 18),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '我的权益',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]
                    )
                ),
                SizedBox(
                  height: 80,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey)
                  // ),
                  child: GridView(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      // mainAxisSpacing: 24.0,
                      // crossAxisSpacing: 24.0,
                      childAspectRatio: 1.0,
                    ),
                    children: List<Widget>.generate(
                      myListData.length,
                          (int index) {
                        return Container(
                          // height: 100,
                          // decoration: BoxDecoration(
                          //   color: Colors.red,
                          // ),
                          child: Column(
                            children: [
                              Center(
                                  child: Text(
                                    '1${myListData[index].subTxt}',
                                  )
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                    myListData[index].titleTxt,
                                    style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400
                                    ),
                                  )
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            )
        ),
        SizedBox(height: 20),
        Container(
          // height: 100,
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.grey)
                  // ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Image.asset(
                          'assets/images/set.png',
                        ),
                        SizedBox(width: 10),
                        Text(
                          '我的设置',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18
                          )
                        )
                      ]
                    )
                  ),
                ),

              ],
            )
        )
      ]
    );
  }
}
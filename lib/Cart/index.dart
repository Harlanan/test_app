import 'package:flutter/material.dart';

import '../Tool/cart_list_view.dart';
import '../Tool/fitness_app_theme.dart';


class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();  //初始化页面列表数据
    super.initState();
  }

  void addAllListData() {
    const int count = 5;
    listViews.add(
      CartListView(),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),

            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 54,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: false, // 根据你的业务逻辑确定是否全选
                        onChanged: (bool? value) {
                          // 处理全选的逻辑
                        },
                        shape: CircleBorder(),
                      ),
                      Text(
                        '全选',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 120),
                      Text(
                        '合计:',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          '¥',
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '100',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                      SizedBox(width: 20), // 调整按钮和文本之间的间距
                      ElevatedButton(
                        onPressed: () {
                          // 处理结算按钮的点击事件
                        },
                        child: Text('结算'),
                      ),
                    ],
                  )

              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(), // 禁止滚动
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  18,
              // bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: FitnessAppTheme.white.withOpacity(topBarOpacity),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: FitnessAppTheme.grey
                      .withOpacity(0.4 * topBarOpacity),
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16 - 8.0 * topBarOpacity,
                    bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8,left: 8),
                        child: Text(
                          '购物车',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 20 ,
                            letterSpacing: 1.2,
                            color: FitnessAppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.calendar_today,
                              color: FitnessAppTheme.grey,
                              size: 18,
                            ),
                          ),
                          Text(
                            '管理',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              letterSpacing: -0.2,
                              color: FitnessAppTheme.darkerText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

}

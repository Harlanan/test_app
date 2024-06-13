class OrderStatusListData {
  OrderStatusListData({
    this.imagePath = '',
    this.titleTxt = '',
  });

  String imagePath;
  String titleTxt;

  static List<OrderStatusListData> orderListData = [
    // OrderStatusListData(
    //   imagePath: 'assets/hotel/hotel_1.png',
    //   titleTxt: '全部订单',
    // ),
    OrderStatusListData(
      imagePath: 'assets/order/order_01.png',
      titleTxt: '待付款',
    ),
    OrderStatusListData(
      imagePath: 'assets/order/order_02.png',
      titleTxt: '待发货',
    ),
    OrderStatusListData(
      imagePath: 'assets/order/order_03.png',
      titleTxt: '待收货',
    ),
    OrderStatusListData(
      imagePath: 'assets/order/order_04.png',
      titleTxt: '待评价',
    ),
    OrderStatusListData(
      imagePath: 'assets/order/order_05.png',
      titleTxt: '退款/售后',
    ),
  ];
}


class MyListData {
  MyListData({
    this.subTxt = '',
    this.titleTxt = '',
  });

  String subTxt;
  String titleTxt;

  static List<MyListData> myListData = [
    MyListData(
      subTxt: '元',
      titleTxt: '余额',
    ),
    MyListData(
      subTxt: '张',
      titleTxt: '优惠卷',
    ),
    MyListData(
      subTxt: '个',
      titleTxt: '红包',
    ),
    MyListData(
      subTxt: '',
      titleTxt: '等级',
    ),
  ];
}

class MyOperate {
  MyOperate({
    this.imagePath = '',
    this.titleTxt = '',
  });

  String imagePath;
  String titleTxt;

  static List<MyOperate> myOperateData = [
    MyOperate(
      imagePath: '元',
      titleTxt: '余额',
    ),
    MyOperate(
      imagePath: '张',
      titleTxt: '优惠卷',
    ),
    MyOperate(
      imagePath: '个',
      titleTxt: '红包',
    ),
    MyOperate(
      imagePath: '',
      titleTxt: '等级',
    ),
  ];
}

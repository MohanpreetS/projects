import 'package:flutter/material.dart';

import '../models/dish_item.dart';
import '../models/order_item.dart';

class Order with ChangeNotifier {
  List<OrderItem> _orderItems = [
    OrderItem(
      dish: DishItem(
        title: 'Hummus',
        description:
            'Pureed chick peas, oil, and garlic spread, served with pita',
        price: 4.95,
        category: 'Appetizers',
      ),
      quantity: 3,
      orderItemId: 'o1',
    ),
    OrderItem(
      dish: DishItem(
        title: 'Hummus',
        description:
            'Pureed chick peas, oil, and garlic spread, served with pita',
        price: 4.95,
        category: 'Appetizers',
      ),
      quantity: 4,
      orderItemId: 'o2',
    ),
    OrderItem(
      dish: DishItem(
        title: 'Hummus',
        description:
            'Pureed chick peas, oil, and garlic spread, served with pita',
        price: 4.95,
        category: 'Appetizers',
      ),
      quantity: 5,
      orderItemId: 'o3',
    ),
    OrderItem(
      dish: DishItem(
        title: 'Hummus',
        description:
            'Pureed chick peas, oil, and garlic spread, served with pita',
        price: 4.95,
        category: 'Appetizers',
      ),
      quantity: 2,
      orderItemId: 'o4',
    )
  ];
  String orderId;

  Order(this.orderId);

  List<OrderItem> get orderItems {
    return [..._orderItems];
  }

  void increaseCount(String orderItemId) {
    int index =
        orderItems.indexWhere((element) => element.orderItemId == orderItemId);
    orderItems[index].quantity++;
    notifyListeners();
  }

  void decreaseCount(String orderItemId) {
    int index =
        orderItems.indexWhere((element) => element.orderItemId == orderItemId);
    orderItems[index].quantity--;
    notifyListeners();
  }
}

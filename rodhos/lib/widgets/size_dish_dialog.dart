import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart';
import '../models/dish_item.dart';

class SizeDishDialog extends StatefulWidget {
  final DishItem dishItem;

  SizeDishDialog({
    required this.dishItem,
  });
  @override
  _SizeDishDialogState createState() => _SizeDishDialogState();
}

class _SizeDishDialogState extends State<SizeDishDialog> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    var order = Provider.of<Order>(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: mQuery.size.height * 0.45,
        width: mQuery.size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(),
            _buildDescription(),
            _buildSpecialRequest(),
            _buildSizePicker(),
            _buildPlusMinus(),
            _buildAddButton(order),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Text(
        widget.dishItem.title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 3,
        ),
      ),
      margin: EdgeInsets.only(
        top: 20,
        left: 6,
        right: 6,
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3),
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        widget.dishItem.description,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.black,
        //   width: 1,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildSpecialRequest() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(
        //vertical: 2,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Special Request',
            border: InputBorder.none,
          ),
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          onFieldSubmitted: (_) {},
        ),
      ),
    );
  }

  Widget _buildSizePicker() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.dishItem.size == Size.small
              ? RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.dishItem.changeSize(Size.small);
                    });
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: Text(
                    "S",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              : RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.dishItem.changeSize(Size.small);
                    });
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Text(
                    "S",
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
          widget.dishItem.size == Size.medium
              ? RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.dishItem.changeSize(Size.medium);
                    });
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              : RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.dishItem.changeSize(Size.medium);
                    });
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
          widget.dishItem.size == Size.large
              ? RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.dishItem.changeSize(Size.large);
                    });
                  },
                  elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: Text(
                    "L",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              : RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      widget.dishItem.changeSize(Size.large);
                    });
                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Text(
                    "L",
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
        ],
      ),
    );
  }

  Widget _buildPlusMinus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Price'),
            Text('\$${widget.dishItem.price}'),
          ],
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  //order.decreaseCount(widget.orderItem.orderItemId);
                  setState(() {
                    if (qty > 1) {
                      qty--;
                    }
                  });
                },
                icon: Icon(Icons.remove_circle_outline_rounded),
                color: Colors.red,
              ),
              Container(
                child: Center(
                  child: Text(
                    qty.toString(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  //order.increaseCount(widget.orderItem.orderItemId);
                  setState(() {
                    qty++;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Text('Total'),
            Text('\$${(widget.dishItem.price * qty).toStringAsFixed(2)}'),
          ],
        ),
      ],
    );
  }

  Widget _buildAddButton(order) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: ElevatedButton(
          onPressed: () {
            order.addToOrder(widget.dishItem, qty);
            Navigator.of(context).pop();
          },
          child: Text(
            'Add to cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'models/items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.border_all, color: Colors.black),
                onPressed: () {},
              ),
            ],
            backgroundColor: Colors.white,
            title: Text('Cart',
                style: TextStyle(color:Colors.black)),
            centerTitle: true,
          ),
          body: HomePage(),
          floatingActionButton: Container(
            alignment: Alignment.center,
            height: 50.0,
            width: double.infinity,
            child: Center(
              child: FittedBox(
                child: FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text('Settlement',
                      style: TextStyle(fontSize: 20,)),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ),
        )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 1.5;

    return SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height,
              child: ListView(
                children: <Widget>[
                  for (var foodItem in fooditemList.foodItems)
                    ItemCard(foodItem: foodItem),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding:EdgeInsets.fromLTRB(0,25,20,0),
              child:RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black54, fontSize: 18),
                    children: [
                      TextSpan(text: "A total of: "),
                      TextSpan(
                          text: "\$181.16",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.orange,
                              fontSize: 30))
                    ]),
              ),
            ),
          ],
        ),
    );
  }
}


class ItemCard extends StatelessWidget {
  ItemCard({
    @required this.foodItem,
  });
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Items(
        description: foodItem.description,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.description,
  });

  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String description;
  int quantity = 1;
  double total = 0.0;
  @override
  Widget build(BuildContext context) {
    final double card_height = 120;
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                padding:EdgeInsets.fromLTRB(6,6,6,4),
                width: double.infinity,
                height: 137,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(4),
                          width:110,
                          height:120,
                          child: Image.asset(imgUrl,
                              fit: BoxFit.contain)
                      ), // image container
                      Container(
                          padding: EdgeInsets.all(2),
                          width:278,
                          height:card_height,
                          child:Column(
                            children: <Widget>[
                              Container(
                                  height: card_height/1.8,
                                  padding: EdgeInsets.all(2),
                                  child:Text(description,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ))
                              ),
                              Container(
                                  child:Row(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child:Text("\$$itemPrice",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                                color: Colors.orange
                                            )),
                                      ),
                                      Container(
                                          width:90
                                      ),
                                      Container(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                child:IconButton(
                                                  icon: Icon(Icons.indeterminate_check_box, color: Colors.grey[400]),
                                                  onPressed: () {
                                                    quantity = quantity - 1;
                                                    total = total - itemPrice;
                                                  },
                                                ),
                                              ),
                                              Container(
                                                  child:Text(quantity.toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 18,
                                                          color: Colors.black
                                                      ))
                                              ),
                                              Container(
                                                child:IconButton(
                                                  icon: Icon(Icons.add_box, color: Colors.grey[400]),
                                                  onPressed: () {
                                                    quantity = quantity + 1;
                                                    total = total + itemPrice;
                                                    print(total);
                                                    print(quantity);
                                                  },
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                    ],
                                  )
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

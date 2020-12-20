import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:warung/constant.dart';
import 'package:warung/models/grocery_model.dart';

class DetailScreen extends StatefulWidget {
  final GroceryModel currentData;
  DetailScreen({Key key, @required this.currentData}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  var rng;
  var tag;
  int currentCount = 1;
  @override
  void initState() {
    super.initState();
    rng = new Random();
    tag = widget.currentData.id;
    print(tag);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    Get.back(result: null);
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children:[
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            margin: EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black
                              ),
                              onPressed:(){}
                            ),
                          ),
                          Container(
                            child : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    child: Hero(
                                      tag: tag,
                                      child: CachedNetworkImage(
                                        imageUrl: widget.currentData.urlImage,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                     ),
                                    )
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children : [
                                      Text(
                                        widget.currentData.name,
                                        style : Theme.of(context).textTheme.headline4.copyWith(color: colorText, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${widget.currentData.weightGram}g",
                                        style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              border: Border.all(color: colorText.withOpacity(0.3))
                                            ),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(Icons.remove, color: Colors.black),
                                                  onPressed: (){
                                                    setState((){
                                                        currentCount > 1 ? currentCount-- : 1;
                                                    });
                                                  }
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "$currentCount",
                                                  style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: colorText, fontWeight: FontWeight.normal),
                                                ),
                                                SizedBox(width: 10),
                                                IconButton(
                                                  icon: Icon(Icons.add, color: Colors.black),
                                                  onPressed: (){
                                                    setState((){
                                                        currentCount++;
                                                    });
                                                  }
                                                )
                                              ]
                                            )
                                          ),
                                          Text(
                                            "Rp ${widget.currentData.price}",
                                            style : Theme.of(context).textTheme.headline5.copyWith(fontSize: 30,color: colorText, fontWeight: FontWeight.w800),
                                          ),
                                        ]
                                      ),
                                      SizedBox(height: 40),
                                      Text(
                                        "About the product",
                                        style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: colorText, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        widget.currentData.desc,
                                        style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.normal),
                                      ),
                                    ]
                                  )
                                )
                              ]
                            )
                          ),
                        ]
                      )
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.90)
                            ]
                          ),
                        ),
                      ),
                    )
                  ]
                )
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: colorText.withOpacity(0.3))
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite_outline, color: Colors.black),
                        onPressed: (){}
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                            setState((){
                              tag = widget.currentData.idCart;
                            });
                            Get.back(result: widget.currentData);
                        },
                        color: colorSecondary,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal : 20, vertical: 20),
                          child: Text(
                            "Add to cart",
                            style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: colorText, fontWeight: FontWeight.normal),
                          ),
                        )
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}



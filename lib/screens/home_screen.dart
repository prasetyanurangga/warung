import 'package:flutter/material.dart';
import 'package:warung/screens/detail_screen.dart';
import 'package:warung/models/grocery_model.dart';

import 'package:warung/constant.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ScrollController scrollController;
  double cartHeight = -100;
  Animation<double> translateAnimation;
  AnimationController controller; 
  Animation<double> cartAnimation;
  Animation<double> detailAnimation;
  AnimationController cartController; 
  List<GroceryModel> listCart = [];
  GroceryModel currentData;
  int currentCatergory = 0;
  int totalPrice = 0;



  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    controller = AnimationController( duration: Duration(milliseconds: 500), vsync: this);

    translateAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.100, 0.150,
          curve: Curves.ease,
        ),
      ),
    );
    translateAnimation..addStatusListener((status) {
       if (status == AnimationStatus.completed) {

                                print(currentData);
        onMove();
       }
    });

    cartController = AnimationController( duration: Duration(milliseconds: 400), vsync: this);
    cartAnimation = Tween<double>(begin: 1, end: 0).animate(cartController);
    detailAnimation = Tween<double>(begin: 0, end: 1).animate(cartController);
  }

  void onMove() async{
    var data = await Get.to(DetailScreen(currentData: currentData));
    print(data);    
    if(data != null) {
      translateAnimation = Tween<double>(begin: cartHeight, end: 0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.500, 0.750,
            curve: Curves.ease,
          ),
        ),
      );
      listCart.add(data);
    }

    if(listCart.length > 0){
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          controller: scrollController,
          child: Column(
            children: [
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: heightScreen,
                child: Stack(
                  children: [

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onPanUpdate: (details) {

                          print("Y : ${details.delta.dy}");
                          print("X : ${details.delta.dx}");
                          if (details.delta.dy < 0) {
                            print("up");
                            cartController.forward();
                            setState((){
                              totalPrice = 0;
                            });
                            for(var i = 0; i < listCart.length; i++){
                              setState((){
                                totalPrice += listCart[i].price;
                              });
                            }
                            scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 100,
                          padding: EdgeInsets.all(20),
                          child: Row(
                              children: [
                                AnimatedBuilder(
                                  animation: cartAnimation,
                                  child: Text(
                                    "Cart",
                                    style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w800),
                                  ),
                                  builder: (context, child) {
                                    return FadeTransition(
                                      opacity: cartAnimation,
                                      child: child
                                    );
                                  }
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: AnimatedBuilder(
                                    animation: cartAnimation,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listCart.length,
                                      itemBuilder: (context, index){
                                        return Hero(
                                          tag: listCart[index].idCart,
                                          child: CachedNetworkImage(
                                            imageUrl: listCart[index].urlImage,
                                            imageBuilder: (context, imageProvider) =>  Container(
                                              margin: EdgeInsets.symmetric(horizontal: 5),
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                  )
                                              ),
                                            ),
                                            placeholder: (context, url) => CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                         ),
                                        );
                                      }
                                    ),
                                    builder: (context, child) {
                                      return FadeTransition(
                                        opacity: cartAnimation,
                                        child: child
                                      );
                                    }
                                  )
                                ),
                                SizedBox(width: 10),
                                AnimatedBuilder(
                                  animation: cartAnimation,
                                  child: Text(
                                    "${listCart.length}",
                                    style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20, color: colorText   , fontWeight: FontWeight.w800),
                                  ),
                                  builder: (context, child) {
                                    return ScaleTransition(
                                      scale: cartAnimation,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colorSecondary
                                        ),
                                        child: Center(
                                          child: child
                                        )
                                      )
                                    );
                                  }
                                ),
                                
                              ]
                          )
                        )
                      )
                    ),
                    AnimatedBuilder(
                      animation: controller.view,
                      builder: (context, child) => 
                      Positioned(
                        top : translateAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorBackground,
                            borderRadius: BorderRadius.only(bottomRight:  Radius.circular(translateAnimation.value / -4), bottomLeft:  Radius.circular(translateAnimation.value / -4))
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: heightScreen,
                          child: child
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right:20, top: 5, bottom: 20),
                        child: new StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: listGrocery.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){ 
                                setState((){
                                  currentData = listGrocery[index];
                                });
                                print(currentData);
                                if(listCart.length > 0){
                                controller.forward();

                                }
                                else{
                                  onMove();
                                }
                              },
                              child : Container(
                                padding : EdgeInsets.only(left: 20, right: 20, bottom: index.isEven ? 40 : 20, top: index.isEven ? 40 : 20,),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Hero(
                                        tag: listGrocery[index].id,
                                        child: CachedNetworkImage(
                                          imageUrl: listGrocery[index].urlImage,
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                       ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Rp ${listGrocery[index].price}",
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22, color: colorText, fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      listGrocery[index].name,
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, color: colorText, fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "${listGrocery[index].weightGram}g",
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                                    ),
                                  ]
                                )
                              )
                            );
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        )
                      )
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children : [
                          Container(
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black
                                  ),
                                  onPressed:(){}
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: Text(
                                    "Groceries",
                                    style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20, color: colorText, fontWeight: FontWeight.w800),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.tune,
                                    color: Colors.black
                                  ),
                                  onPressed:(){}
                                ),
                                SizedBox(width: 10),
                              ]
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  colorBackground.withOpacity(0.90),
                                  colorBackground.withOpacity(0.5),
                                  colorBackground.withOpacity(0)
                                ]
                              ),
                            ),
                          ),
                        ]
                      )
                    ),
                  ]
                )
              ),
              GestureDetector(
                onPanUpdate: (details) {

                  print("Y : ${details.delta.dy}");
                  print("X : ${details.delta.dx}");
                  if (details.delta.dy > 0 ) {
                    cartController.reverse();
                    scrollController.animateTo(0, duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(left:30,right:30,bottom: 20),
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height: heightScreen - 180,
                  child: AnimatedBuilder(
                    animation: detailAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text(
                          "Cart",
                          style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: List.generate(listCart.length,(index){
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: listCart[index].urlImage,
                                    imageBuilder: (context, imageProvider) =>  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                          )
                                      ),
                                    ),
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                  SizedBox(width: 30),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "1",
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "X",
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      listCart[index].name,
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Rp ${listCart[index].price}",
                                    style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                                  ),
                                ]
                              )
                            );
                          }),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[900]
                                  ),
                                  child: Center(
                                    child: Icon(Icons.delivery_dining, color: colorSecondary)
                                  )
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: Text(
                                    "Delivery",
                                    style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Rp 20.000",
                                      style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                                    ),
                                  )
                                )
                              ]
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "All orders of Rp 5000 or more qualify for FREE delivery",
                                    style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(height: 15),
                                  LinearProgressIndicator(
                                    backgroundColor: Colors.grey.withOpacity(0.5),
                                    valueColor: new AlwaysStoppedAnimation<Color>(colorSecondary),
                                    value: 0.8,
                                  ),
                                ]
                              )
                            ),
                            
                          ]
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total",
                                style : Theme.of(context).textTheme.headline5.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
                              ),
                            ),
                            Text(
                              "Rp ${totalPrice + 20000}",
                              style : Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                            ),
                          ]
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: () {},
                            color: colorSecondary,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal : 20, vertical: 20),
                              child: Text(
                                "Next",
                                style : Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, color: colorText, fontWeight: FontWeight.normal),
                              ),
                            )
                          )
                        )
                        

                      ]
                    ),
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: detailAnimation,
                        child: child
                      );
                    }
                  ),
                ),
              )
            ]
          )
        ),
      )
    );
  }
}



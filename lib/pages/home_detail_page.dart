import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) :
  // ignore: unnecessary_null_comparison
  assert(catalog!=null), super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red800.make(),
                    ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                    ),
                    shape: MaterialStateProperty.all(const StadiumBorder()),),
                    child: "Buy".text.make()).wh(100, 50)
                    ],
                ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image).p16().h32(context)),
            Expanded(
              child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              // height:context.screenHeight,
              child: SingleChildScrollView(
                  child: Column(
                  children: [
                    catalog.name.text.xl4.bold.color(MyTheme.darkBluishColor).make(),
                    catalog.desc.text.xl.make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ),),)
        ],),
      ),
    );
  }
}

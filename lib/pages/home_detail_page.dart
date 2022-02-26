import 'dart:math';

import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/home_widgets/add_to_cart.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  :
        // ignore: unnecessary_null_comparison
        assert(catalog != null),
        super(key: key);
  final String random =
      "ajsdjhhrbfbnerjherbef j3rf3333mf jhe r evj ewjbe fff ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff rj hjerh jv jvjhe3bf3k vj v3hkhj2 ff k32k23 fk3f 3qklq vk e";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog,)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).p16().h32(context)),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  // height:context.screenHeight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4.bold
                            .color(context.accentColor)
                            .make(),
                        catalog.desc.text.xl.make(),
                        10.heightBox,
                        random.text.caption(context).make().p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

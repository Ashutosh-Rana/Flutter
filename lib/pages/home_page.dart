import 'dart:convert';

import 'package:first_app/models/cart.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/home_widgets/catalog_header.dart';
import 'package:first_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/core/store.dart';
import 'package:first_app/models/catalog.dart';
//import 'package:http/http.dart' as http;
//import 'package:first_app/widgets/drawer.dart';
// import 'package:first_app/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Ashutosh";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsdata = decodedData["products"];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor:context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations:const {AddMutation,RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            // ignore: deprecated_member_use
            backgroundColor: context.theme.buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            )).badge(
              color: context.canvasColor,
              size: 22,
              count: _cart.items.length,
              textStyle: TextStyle(
                color: context.accentColor,
                fontWeight: FontWeight.bold,
              )
            ),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items!.isNotEmpty)
                    CatalogList()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ]),
          ),
        ));
  }
}

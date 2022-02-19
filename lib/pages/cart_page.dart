// import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.color(context.accentColor).make(),
        ),
        body: Column(
          children: [
            _Cartlist().p32().expand(),
            const Divider(),
            _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$999".text.xl5.color(context.accentColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
                      // ignore: deprecated_member_use
                      context.theme.buttonColor)),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _Cartlist extends StatefulWidget {
  @override
  State<_Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<_Cartlist> {
  @override
  Widget build(BuildContext build) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context,index)=>
        ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            onPressed: (){}, 
            icon:const Icon(Icons.remove_circle_outline)),
          title: "Item 1".text.make()
        )
    );
  }
}

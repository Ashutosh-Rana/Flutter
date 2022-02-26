// import 'package:first_app/widgets/themes.dart';
import 'package:first_app/models/cart.dart';
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
    final _cart = CartModel();
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet.".text.make(),
                    ));
                  },
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
  final _cart = CartModel();
  @override
  Widget build(BuildContext build) {
    return _cart.items.isEmpty
        ? "Nothing to display".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.done),
                trailing: IconButton(
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove_circle_outline)),
                title: _cart.items[index].name.text.make()));
  }
}

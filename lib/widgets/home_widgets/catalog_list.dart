import 'package:first_app/models/catalog.dart';
import 'package:first_app/pages/home_detail_page.dart';
import 'package:first_app/widgets/home_widgets/catalog_image.dart';
// import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items?.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items![index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context)=>HomeDetailPage(catalog: catalog)
              )
              ),
            child: CatalogItem(catalog: catalog));
        },
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  :
        // ignore: unnecessary_null_comparison
        assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: VxBox(
          child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.bold.color(context.accentColor).make(),
              catalog.desc.text.size(15).caption(context).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(
                      // ignore: deprecated_member_use
                      context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(const StadiumBorder()),),
                  child: "Add to cart".text.make()).wh(90, 40)
                  ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      )).color(context.cardColor).roundedLg.square(130).make().py16(),
    );
  }
}
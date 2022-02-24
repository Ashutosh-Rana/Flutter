import 'package:first_app/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;
  final List<int> _itemsId = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemsId.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemsId.add(item.id);
  }

  void remove(Item item) {
    _itemsId.remove(item.id);
  }
  
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // Initial Value
  @override
  Set<Product> build() {
    return const {
      Product(
        id: '4',
        title: 'Red Backpack',
        price: 14,
        image: 'assets/products/backpack.png',
      ),
    };
  }

  // Methods to update state
  void addProduct(Product product) {
    // check if product is already in cart
    if (state.contains(product)) {
      // if it is, do nothing
      return;
    }
    // add product to cart
    state = {...state, product};
  }

  void removeProduct(Product product) {
    // check if product is in cart
    if (!state.contains(product)) {
      // if it isn't, do nothing
      return;
    }
    // remove product from cart
    state = {...state}..remove(product);
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

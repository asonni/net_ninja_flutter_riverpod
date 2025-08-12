// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // Initial Value
  @override
  Set<Product> build() {
    return const {};
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

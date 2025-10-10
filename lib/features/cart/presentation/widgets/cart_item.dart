import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/features/product/presentation/widgets/star_rating.dart';
import 'package:blink/shared/widgets/svg_card.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final commonController = GetIt.instance<CommonController>();

    return Container(
      height: 118,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              gradient: LinearGradient(
                colors: [
                  Colors.blueGrey.withValues(alpha: 0.3),
                  Colors.blueGrey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(imageUrl: product.image ?? ""),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: product.title ?? "",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              maxLines: 2,
                            ),
                            Row(
                              children: [
                                StarRating(rating: product.rating?.rate ?? 0),
                                TextView(
                                  text: (product.price ?? 0).toString(),
                                  showCurrency: true,
                                  prefix: '(',
                                  suffix: ')',
                                  fontSize: 16,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SvgCard(
                        asset: kDelete,
                        onTap: () =>
                            commonController.removeProductFromCart(product),
                      ),
                    ],
                  ),

                  ValueListenableBuilder<List<Product>>(
                    valueListenable:
                        GetIt.instance<CommonController>().cartNotifier,
                    builder: (context, cartItem, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            showCurrency: true,
                            text:
                                (((product.price ?? 0) *
                                        (product.orderQuantity ?? 0)))
                                    .toString(),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

                          Row(
                            children: [
                              SvgCard(
                                asset: kSub,
                                onTap: () =>
                                    commonController.removeFromCart(product),
                              ),
                              Container(
                                width: 22,
                                margin: const EdgeInsets.only(left: 15),
                                child: TextView(
                                  textAlign: TextAlign.center,
                                  text: product.orderQuantity.toString(),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SvgCard(
                                asset: kAdd,
                                onTap: () =>
                                    commonController.addToCart(product),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

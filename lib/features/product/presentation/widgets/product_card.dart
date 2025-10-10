import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/shared/widgets/custom_dialogs.dart';
import 'package:blink/shared/widgets/svg_card.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    final common = GetIt.instance<CommonController>();
    final theme = Theme.of(context);
    final imageUrl = product.image ?? "";
    final availableQty = common.availableQuantity(product);
    final isOutOfStock = availableQty <= 0;

    Widget cardContent = Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image, size: 40),
                      ),
                      placeholder: (context, url) => Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2.5,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported, size: 40),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: product.title ?? '',
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 15,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextView(
                          text: "Stock: $availableQty",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: isOutOfStock ? Colors.red : null,
                        ),
                        TextView(
                          showCurrency: true,
                          text: product.price?.toString() ?? '0',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    ValueListenableBuilder<List<Product>>(
                      valueListenable: common.cartNotifier,
                      builder: (context, cartItems, _) {
                        final isAdded = cartItems.any(
                          (e) => e.id == product.id,
                        );

                        return isOutOfStock
                            ? const SizedBox.shrink()
                            : SvgCard(
                                asset: isAdded ? kCart : kAdd,
                                borderRadius: 18,
                                onTap: () {
                                  if (!isAdded) {
                                    common.addToCart(product);
                                    CustomDialogs.showSuccessDialog(
                                      context: context,
                                      text: "Added to cart",
                                    );
                                  } else {
                                    common.removeProductFromCart(product);
                                    CustomDialogs.showErrorDialog(
                                      text: "Removed from cart",
                                    );
                                  }
                                },
                              );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return isOutOfStock
        ? Banner(
            message: "Out of Stock",
            location: BannerLocation.topEnd,
            color: Colors.red,
            child: cardContent,
          )
        : cardContent;
  }
}

part of 'package:blink/features/product/presentation/bloc/product_bloc.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.image ?? "";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffdfbfb),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.grey.withValues(alpha: 0.5),
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Stack(
                    children: [
                      imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              width: double.infinity,
                              fit: BoxFit.fitHeight,
                              errorWidget: (context, url, error) => Container(
                                color: Colors.grey[200],
                                child: const Icon(Icons.broken_image, size: 40),
                              ),
                              placeholder: (context, url) => Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    strokeWidth: 4.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 40,
                              ),
                            ),
                      CustomAppBar(
                        backgroundColor: Colors.transparent,
                        shadow: false,
                        hasBack: true,
                        showCart: true,
                        title: "",
                        onCartClick: (){
                          context.pushRoute( HomeRoute(selectedIndex: 2));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              DraggableScrollableSheet(
                maxChildSize: 0.6,
                expand: true,
                initialChildSize: 0.5,
                minChildSize: 0.5,
                builder: (BuildContext context, ScrollController scrollController) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),

                    child: Container(
                      color: const Color(0xfffdfbfb),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: product.category ?? "",
                                fontSize: 16,
                                bottom: 5,
                              ),
                              TextView(
                                text: product.title ?? "",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              // Row(
                              //   children: [
                              // TextView(
                              //   text: widget.product! <= 0
                              //       ? " (Out of Stock)"
                              //       : " (In Stock)",
                              //   color: widget.product.stock! <= 0
                              //       ? Colors.grey
                              //       : Colors.blue,
                              //   fontSize: 16,
                              //   fontWeight: FontWeight.bold,
                              // ),
                              //   ],
                              // ),
                              const SizedBox(height: 8),
                              TextView(
                                text: product.description ?? "",
                                top: 5,
                                maxLines: 5,
                                lineHeight: 1.7,
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),

                              TextView(
                                text: "Ratings & Reviews",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                top: 16,
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 22,
                                    color: Colors.amber,
                                  ),
                                  TextView(
                                    text:
                                        "${(product.rating?.rate ?? 0).toString()} ( ${product.rating?.count})",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,

                                    color: Colors.grey[700],
                                  ),
                                ],
                              ),
                              SizedBox(height: 80),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: ValueListenableBuilder<List<Product>>(
                    valueListenable:
                        GetIt.instance<CommonController>().cartNotifier,
                    builder: (context, cartItems, _) {
                      final Product? inCartProduct = cartItems.firstWhereOrNull(
                        (item) => item.id == product.id,
                      );

                      if (inCartProduct == null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Expanded(
                              child: TextView(
                                showCurrency: true,
                                text: product.price?.toString() ?? '0',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: CommonButton(
                                borderRadius: 25,
                                icon: kCart,
                                text: 'Add to Cart',
                                onTap: () {
                                  GetIt.instance<CommonController>().addToCart(
                                    product,
                                  );
                                },
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        );
                      } else {
                        final int quantity = inCartProduct.orderQuantity ?? 1;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    showCurrency: true,
                                    text: product.price?.toString() ?? '0',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextView(
                                    showCurrency: true,
                                    text: ((product.price?? 0) * (inCartProduct.orderQuantity ?? 0)).toString(),
                                    fontSize: 25,
                                    prefix: "Total ",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgCard(
                                    margin: EdgeInsets.only(right: 15),

                                    asset: kSub,
                                    onTap: () {
                                      GetIt.instance<CommonController>()
                                          .removeFromCart(product);
                                    },
                                  ),
                                  TextView(
                                    text: quantity.toString(),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SvgCard(
                                    height: 40,
                                    width: 40,

                                    asset: kAdd,
                                    onTap: () {
                                      GetIt.instance<CommonController>()
                                          .addToCart(product);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

part of 'package:blink/features/cart/presentation/bloc/cart_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.instance<CommonController>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          ValueListenableBuilder<List<Product>>(
            valueListenable: controller.cartNotifier,
            builder: (context, cartItems, _) {
              if (cartItems.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NoDataWidget(),
                    CommonButton(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      text: "Browse Products",
                      onTap: () {
                        context.pushRoute(HomeRoute());
                      },
                    ),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => context.pushRoute(
                        ProductDetailRoute(product: cartItems[index]),
                      ),
                      child: CartItem(product: cartItems[index]),
                    );
                  },
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<List<Product>>(
              valueListenable: controller.cartNotifier,
              builder: (context, cartItems, _) {
                final total = cartItems.fold<double>(
                  0,
                  (sum, item) =>
                      sum + ((item.price ?? 0) * (item.orderQuantity ?? 0)),
                );

                return Visibility(
                  visible: cartItems.isNotEmpty,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextView(text: "Total", fontSize: 18),
                              TextView(
                                showCurrency: true,
                                text: total.toStringAsFixed(2),
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CommonButton(
                            borderRadius: 25,
                            icon: kOrder,
                            text: 'Checkout',
                            onTap: () {
                              final order = Order(
                                id: UniqueKey().hashCode,
                                items: controller.cartNotifier.value,
                              );
                              controller.addOrder(order);
                              controller.cartNotifier.value = [];
                              NotificationService.showOrderSuccessNotification(
                                orderId: order.id,
                                totalAmount: total,
                              );
                              _showSuccessBottomSheet(context, order.id, () {
                                context.pop();
                                context.pushRoute(HomeRoute(selectedIndex: 0));
                              });
                            },
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessBottomSheet(
    BuildContext context,
    int id,
    VoidCallback onComplete,
  ) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              child: Lottie.asset(kSuccess, fit: BoxFit.contain, repeat: true),
            ),
            TextView(
              text: "#${id.toString()}",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            TextView(
              text: 'Order Placed Successfully!',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            const TextView(
              text: 'Your order has been confirmed',

              fontSize: 16,
              color: Colors.grey,
            ),

            const SizedBox(height: 30),
            CommonButton(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              text: "Continue Shopping",
              onTap: () {
                onComplete();
              },
            ),
          ],
        ),
      ),
    );
  }
}

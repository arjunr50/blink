part of 'package:blink/features/product/presentation/bloc/product_bloc.dart';

@RoutePage()
class ProductPage extends StatelessWidget implements AutoRouteWrapper {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (_, state) {
          if (state.productListSuccess &&
              state.products != null &&
              state.products!.isNotEmpty) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Category(
                      offers: [
                        OfferItem(
                          title: "Super Sale!",
                          description: "Flat 40% off for all electronics!",
                          buttonText: "Shop Now",
                          backgroundColor: Colors.purple,
                          onTap: () {},
                        ),
                        OfferItem(
                          title: "Mega Deal",
                          description: "Buy 1 Get 1 Free on fashion!",
                          buttonText: "Grab it",
                          backgroundColor: Colors.teal,
                          onTap: () {},
                        ),
                        OfferItem(
                          title: "Flash Offer",
                          description: "Only today: 30% off groceries!",
                          buttonText: "Order Now",
                          backgroundColor: Colors.deepOrange,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(15),
                    child: GestureDetector(
                      onTap: () => context.pushRoute(
                        ProductSearchRoute(products: state.products ?? []),
                      ),
                      child: CustomTextField(
                        hintText: "Search products ...",
                        enabled: false,
                        controller: TextEditingController(),
                        prefixIcon: kSearch,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Trending Products',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const TextView(
                            text: 'See All',
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = state.products![index];
                      return GestureDetector(
                        onTap: () {
                          context.pushRoute(
                            ProductDetailRoute(product: product),
                          );
                        },
                        child: ProductCard(
                          key: ValueKey(product.id),
                          product: product,
                        ),
                      );
                    }, childCount: state.products!.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.7,
                        ),
                  ),
                ),
              ],
            );
          }

          if ((state.productListSuccess &&
                  (state.products == null || state.products!.isEmpty) ||
              state.productListFailed != null)) {
            return Center(child: NoDataWidget(text: "No products available"));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.7,
            ),
            itemCount: 12,
            itemBuilder: (_, __) => ProductShimmer(),
          );
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<ProductBloc>(), child: this);
  }
}

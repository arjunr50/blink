import 'package:auto_route/auto_route.dart';
import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:blink/features/order/presentation/pages/order_page.dart';
import 'package:blink/features/product/presentation/bloc/product_bloc.dart';
import 'package:blink/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper{
  const HomePage({super.key, this.selectedIndex});

  final int? selectedIndex;

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => GetIt.instance<ProductBloc>()..add(ProductEvent.getProducts()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => GetIt.instance<CartBloc>(),
        ),
      ],
      child: this,
    );
  }

}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier(0);

  final List<Widget> _pages = [ProductPage(), OrderPage(), CartPage()];

  void _onTabTapped(int index) {
    if (index == 0) {
      context.read<ProductBloc>().add(ProductEvent.getProducts());
    }

    _currentIndexNotifier.value = index;
  }


  @override
  void initState() {
    super.initState();
    _currentIndexNotifier.value = widget.selectedIndex ?? 0;
  }

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, currentIndex, _) {
        final titles = ['Products', 'Orders', 'Cart'];

        return Scaffold(
          appBar: CustomAppBar(
            backgroundColor: const Color(0xfffdfbfb),
            title: currentIndex != 0 ? titles[currentIndex] : null,
            hasBack: currentIndex != 0,
              showNotifications: true,
            onBackPressed: () => _onTabTapped(0),
            onCartClick: ()=> _onTabTapped(2),
            showCart: currentIndex != 2 ?true : false,
          ),
          body: IndexedStack(index: currentIndex, children: _pages),
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: _onTabTapped,
            elevation: 15,

            backgroundColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  kHome,
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  kHome,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  kOrder,
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  kOrder,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'Orders',
              ),
              NavigationDestination(
                selectedIcon: SvgPicture.asset(
                  kCart,
                  colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  kCart,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                label: 'Cart',
              ),
            ],
          ),
        );
      },
    );
  }
}

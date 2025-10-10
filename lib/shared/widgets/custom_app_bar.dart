import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/shared/widgets/svg_card.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.hasBack = false,
    this.showLeading = true,

    this.onBackPressed,
    this.onProfileTapped,
    this.trailingWidget,
    this.showCart = false,
    this.showNotifications = false,
    this.backgroundColor = Colors.white,
    this.shadow = true,
    this.onCartClick,
  });

  final String? title;
  final bool hasBack;
  final Widget? trailingWidget;
  final bool showCart;
  final bool showNotifications;
  final bool showLeading;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartClick;
  final VoidCallback? onProfileTapped;
  final Color? backgroundColor;
  final bool shadow;

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: preferredSize.height,
        decoration: BoxDecoration(
          color: backgroundColor,

          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withAlpha(25),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showLeading)
              hasBack
                  ? GestureDetector(
                      onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade300,
                        ),
                        child: SvgPicture.asset(kBack, fit: BoxFit.scaleDown),
                      ),
                    )
                  : Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(1),

                      child: Image.asset(kLogo, fit: BoxFit.cover),
                    ),

            const SizedBox(width: 10),

            Expanded(
              child: title != null
                  ? Center(
                      child: TextView(
                        text: title!,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextView(
                          text: "Welcome to Blink",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        const TextView(
                          text: "Let's shop something!",
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
            ),

            if (trailingWidget != null) trailingWidget!,
            showCart
                ? ValueListenableBuilder<List<Product>>(
                    valueListenable:
                        GetIt.instance<CommonController>().cartNotifier,
                    builder: (context, cartItems, _) {
                      return Badge(
                        backgroundColor: const Color(0xffff2216),
                        isLabelVisible: cartItems.isNotEmpty,
                        label: Text(
                          cartItems.length.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        child: SvgCard(
                          asset: kCart,
                          margin: const EdgeInsets.only(left: 10),
                          onTap: () => onCartClick?.call(),
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),

          ],
        ),
      ),
    );
  }
}

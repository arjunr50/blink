import 'package:blink/core/utils/images_helper.dart';
import 'package:blink/shared/widgets/common_button.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final List<OfferItem> offers;

  Category({super.key, required this.offers});

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            height: 155.0,
            autoPlay: true,
          ),
          items: offers.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      item.backgroundColor.withValues(alpha: 0.4),
                      item.backgroundColor,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: item.title,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          TextView(
                            text: item.description,
                            color: Colors.white,
                            fontSize: 16,
                            maxLines: 2,
                          ),
                          IntrinsicWidth(
                            child: CommonButton(
                              borderRadius: 20,
                              fontSize: 15,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              height: 35,
                              text: item.buttonText,
                              onTap: item.onTap,
                              backgroundColor: Colors.white,
                              textColor: item.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -70,
                            right: -70,
                            child: Container(
                              height: 160,
                              width: 160,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 30,
                                  color: Colors.white.withValues(alpha: 0.15),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -50,
                            right: -50,
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 20,
                                  color: Colors.white.withValues(alpha: 0.25),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Image.asset(
                                kShopping,
                                height: 180,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _currentIndex,
          builder: (context, current, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                offers.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: current == i ? 18 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: current == i ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class OfferItem {
  final String title;
  final String description;
  final String buttonText;
  final Color backgroundColor;
  final VoidCallback onTap;

  OfferItem({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.backgroundColor,
    required this.onTap,
  });
}

import 'package:auto_route/auto_route.dart';
import 'package:blink/core/controller/common_controller.dart';
import 'package:blink/features/product/domain/entities/response/product.dart';
import 'package:blink/shared/widgets/text_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class OrderPage extends StatelessWidget {
  OrderPage({super.key});

  final commonController = GetIt.instance<CommonController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ValueListenableBuilder<List>(
          valueListenable: commonController.orders,
          builder: (context, orders, _) {
            if (orders.isEmpty) {
              return const Center(
                child: TextView(
                  text: "No orders yet",
                  fontSize: 18,
                  color: Colors.grey,
                ),
              );
            }

            final allItems = orders.expand((o) => o.items ?? []).toList();
            final Map<String, int> productCount = {};

            for (var item in allItems) {
              final orderQtyDynamic = item.orderQuantity ?? 1;
              int qty;
              if (orderQtyDynamic is int) {
                qty = orderQtyDynamic;
              } else if (orderQtyDynamic is double) {
                qty = orderQtyDynamic.toInt();
              } else {
                qty = int.tryParse(orderQtyDynamic.toString()) ?? 1;
              }

              productCount[item.title ?? 'Unnamed'] =
                  (productCount[item.title ?? 'Unnamed'] ?? 0) + qty;
            }

            final total = productCount.values.fold<int>(0, (a, b) => a + b);

            final chartSections = productCount.entries.map((entry) {
              final percent = (entry.value / total) * 100;
              return PieChartSectionData(
                color:
                Colors.primaries[productCount.keys.toList().indexOf(
                  entry.key,
                ) %
                    Colors.primaries.length],
                value: entry.value.toDouble(),
                title: "${percent.toStringAsFixed(1)}%",
                radius: 60,
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            }).toList();

            final barGroups = productCount.entries.map((entry) {
              return BarChartGroupData(
                x: productCount.keys.toList().indexOf(entry.key),
                barRods: [
                  BarChartRodData(
                    toY: entry.value.toDouble(),
                    color: Colors.primaries[productCount.keys.toList().indexOf(
                      entry.key,
                    ) %
                        Colors.primaries.length],
                    width: 20,
                  ),
                ],
              );
            }).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextView(
                    text: "Order Summary",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 220,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 40,
                        sections: chartSections,
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextView(
                    text: "Product Quantity",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        barGroups: barGroups,
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index < productCount.keys.length) {
                                  final productName = productCount.keys.elementAt(index);
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      productName.length > 8
                                          ? '${productName.substring(0, 8)}...'
                                          : productName,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Text(value.toInt().toString());
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 4,
                    children: productCount.entries.map((entry) {
                      final color =
                      Colors.primaries[productCount.keys.toList().indexOf(
                        entry.key,
                      ) %
                          Colors.primaries.length];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(child: TextView(text: entry.key, fontSize: 12)),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 30, thickness: 1),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orders.length,
                    itemBuilder: (_, index) {
                      final order = orders[index];
                      final totalPrice =
                          order.items?.fold<double>(
                            0.0,
                                (double sum, Product item) =>
                            sum +
                                ((item.price ?? 0) * (item.orderQuantity ?? 0)),
                          ) ??
                              0.0;

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        elevation: 3,
                        child: ListTile(
                          title: TextView(
                            text: "Order #${order.id}",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: TextView(
                            text: "${order.items?.length ?? 0} items",
                            fontSize: 15,
                          ),
                          trailing: TextView(
                            showCurrency: true,
                            text: "${totalPrice.toStringAsFixed(2)}",
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shoply_app/core/model/order/response_order.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});
  final OrderResponse order;
  static const Color primaryGreen = Color(0xFF0A5C43);
  static const Color lightGreen = Color(0xFFD9F5EB);
  static const Color textColor = Color(0xFF10213D);
  static const Color secondaryText = Color(0xFF718096);
  static const Color borderColor = Color(0xFFDDE8EF);
  // static const Color backgroundColor = Color(0xFFF7FAF9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              isCenterTitle: false,

              title: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Order details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '#${order.id?.substring(0, 5)}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              leading: IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                child: Column(
                  children: [
                    _buildOrderHeader(),
                    const SizedBox(height: 16),
                    _buildOrderTimeline(),
                    const SizedBox(height: 16),
                    _buildShippingInformation(),
                    const SizedBox(height: 16),
                    _buildOrderItems(),
                    const SizedBox(height: 16),
                    _buildOrderSummary(),
                    const SizedBox(height: 20),
                    // _buildTrackOrderButton(),
                    const SizedBox(height: 12),
                    // _buildContactSupportButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // App bar
  // Widget _buildAppBar(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [Color(0xFF0B654C), Color(0xFF07523D)],
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
  //     ),
  //     child: Row(
  //       children: [
  //         IconButton(
  //           onPressed: () => Navigator.maybePop(context),
  //           icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
  //         ),
  //         const SizedBox(width: 12),
  //         const Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Order Details',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 25,
  //                   fontWeight: FontWeight.w700,
  //                 ),
  //               ),
  //               SizedBox(height: 4),
  //               Text(
  //                 '#SH1023',
  //                 style: TextStyle(color: Colors.white, fontSize: 15),
  //               ),
  //             ],
  //           ),
  //         ),
  //         IconButton(
  //           onPressed: () {},
  //           icon: const Icon(Icons.more_vert, color: Colors.white, size: 28),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Order status summary
  Widget _buildOrderHeader() {
    return _card(
      color: const Color(0xFFF3FAF7),
      child: Row(
        children: [
          _iconCircle(Icons.inventory_2_outlined, size: 76, iconSize: 38),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 6),
                      Text(
                        (order.status ?? 'pending').toUpperCase(),
                        style: TextStyle(
                          color: primaryGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Order #${order.id?.substring(0, 5)}',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${order.cart!.length} items',
                  style: TextStyle(color: secondaryText, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '\$${order.subTotal!.toStringAsFixed(2)}',
            style: TextStyle(
              color: primaryGreen,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // Order progress timeline
  Widget _buildOrderTimeline() {
    final status = (order.status ?? 'pending').toLowerCase().trim();
    final isDelivered = status == 'delivered';
    final isShipped = status == 'shipped' || isDelivered;

    final steps = [
      _OrderStep(
        title: 'Pending',
        completed: isShipped,
        active: status == 'pending',
        icon: isShipped ? Icons.check : Icons.pending,
      ),
      _OrderStep(
        title: 'Shipped',
        completed: isDelivered,
        active: status == 'shipped',
        icon: isDelivered ? Icons.check : Icons.local_shipping_outlined,
      ),
      _OrderStep(
        title: 'Delivered',
        completed: isDelivered,
        active: false,
        icon: isDelivered ? Icons.check : Icons.inventory_2_outlined,
      ),
    ];

    return _card(
      child: Column(
        children: [
          Row(
            children: List.generate(steps.length, (index) {
              final step = steps[index];

              return Expanded(
                child: SizedBox(
                  height: 52,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (index > 0)
                        Positioned(
                          left: 0,
                          right: 25,
                          child: Container(
                            height: 2,
                            color:
                                steps[index - 1].completed &&
                                    (step.completed || step.active)
                                ? primaryGreen
                                : const Color(0xFFD5DDE3),
                          ),
                        ),
                      if (index < steps.length - 1)
                        Positioned(
                          left: 25,
                          right: 0,
                          child: Container(
                            height: 2,
                            color:
                                step.completed &&
                                    (steps[index + 1].completed ||
                                        steps[index + 1].active)
                                ? primaryGreen
                                : const Color(0xFFD5DDE3),
                          ),
                        ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: step.active
                                ? const Color(0xFF07885E)
                                : step.completed
                                ? primaryGreen
                                : const Color(0xFFE9EEF1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            step.icon,
                            color: step.completed
                                ? Colors.white
                                : step.active
                                ? Colors.white
                                : const Color(0xFF7A8795),
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: steps.map((step) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Column(
                    children: [
                      Text(
                        step.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: step.active
                              ? primaryGreen
                              : step.completed
                              ? textColor
                              : secondaryText,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Text(
                      //   step.date,
                      //   textAlign: TextAlign.center,
                      //   style: const TextStyle(
                      //     color: secondaryText,
                      //     fontSize: 10,
                      //   ),
                      // ),
                      // if (step.time.isNotEmpty) ...[
                      //   const SizedBox(height: 4),
                      //   Text(
                      //     step.time,
                      //     textAlign: TextAlign.center,
                      //     style: const TextStyle(
                      //       color: secondaryText,
                      //       fontSize: 10,
                      //     ),
                      //   ),
                      // ],
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Shipping information
  Widget _buildShippingInformation() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _iconCircle(
                Icons.local_shipping_outlined,
                size: 58,
                iconSize: 30,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Information',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      order.fullName ?? 'No Name',
                      style: TextStyle(
                        color: Color(0xFF39485B),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),
                    _InfoRow(
                      icon: Icons.location_on,
                      text: order.address ?? 'No Address',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: OutlinedButton.icon(
          //     onPressed: () {},
          //     icon: const Icon(Icons.location_on_outlined),
          //     label: const Text('View Address'),
          //     style: OutlinedButton.styleFrom(
          //       foregroundColor: primaryGreen,
          //       side: const BorderSide(color: primaryGreen),
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 16,
          //         vertical: 12,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(28),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Products
  Widget _buildOrderItems() {
    return _card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Items (${order.cart?.length ?? 0})',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // TextButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(Icons.local_shipping_outlined, size: 20),
              //   label: const Text('Track Package'),
              //   style: TextButton.styleFrom(
              //     foregroundColor: primaryGreen,
              //     padding: const EdgeInsets.symmetric(horizontal: 4),
              //   ),
              // ),
              const Icon(Icons.chevron_right, color: secondaryText),
            ],
          ),
          const Divider(color: Color(0xFFEBF0F3)),
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: order.cart?.length ?? 0,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              final item = order.cart![index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 112,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F1F0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CustomCachedImageNetwork(
                      image: item.images![0],
                      width: 100,
                      height: 112,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name!,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Qty: ${item.quantity}',
                          style: TextStyle(color: secondaryText, fontSize: 13),
                        ),
                        SizedBox(height: 14),
                        Text(
                          '\$${item.price}',
                          style: TextStyle(
                            color: primaryGreen,
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Icon(
                      Icons.chevron_right,
                      color: secondaryText,
                      size: 28,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // Price breakdown
  Widget _buildOrderSummary() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          _priceRow(
            'Subtotal (${order.cart?.length ?? 0} item)',
            '\$${order.subTotal?.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 14),
          _priceRow('Shipping Fee', '\$0'),
          const SizedBox(height: 18),
          const Divider(color: Color(0xFFEBF0F3)),
          const SizedBox(height: 8),
          _priceRow(
            'Total',
            '\$${order.subTotal?.toStringAsFixed(2)}',
            bold: true,
          ),
        ],
      ),
    );
  }

  // Main action
  // Widget _buildTrackOrderButton() {
  //   return SizedBox(
  //     width: double.infinity,
  //     height: 58,
  //     child: ElevatedButton.icon(
  //       onPressed: () {},
  //       icon: const Icon(Icons.inventory_2_outlined, size: 25),
  //       label: const Text(
  //         'Track Order',
  //         style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: primaryGreen,
  //         foregroundColor: Colors.white,
  //         elevation: 0,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // // Support action
  // Widget _buildContactSupportButton() {
  //   return SizedBox(
  //     width: double.infinity,
  //     height: 54,
  //     child: OutlinedButton.icon(
  //       onPressed: () {},
  //       icon: const Icon(Icons.headset_mic_outlined),
  //       label: const Text(
  //         'Contact Support',
  //         style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
  //       ),
  //       style: OutlinedButton.styleFrom(
  //         foregroundColor: primaryGreen,
  //         side: const BorderSide(color: primaryGreen, width: 1.2),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Reusable card
  Widget _card({required Widget child, Color color = Colors.white}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

  // Reusable circular icon
  Widget _iconCircle(IconData icon, {double size = 64, double iconSize = 30}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: lightGreen,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: iconSize, color: primaryGreen),
    );
  }

  Widget _priceRow(String label, String amount, {bool bold = false}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: bold ? primaryGreen : secondaryText,
              fontSize: bold ? 17 : 14,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: bold ? primaryGreen : textColor,
            fontSize: bold ? 23 : 15,
            fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _OrderStep {
  final String title;
  final bool completed;
  final bool active;
  final IconData icon;

  const _OrderStep({
    required this.title,
    required this.completed,
    this.active = false,
    required this.icon,
  });
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 19, color: OrderDetailsScreen.primaryGreen),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: OrderDetailsScreen.secondaryText,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

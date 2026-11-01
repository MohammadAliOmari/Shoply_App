import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';

/// Image-only carousel for announcements (banners).
class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final bool autoPlay;
  final Duration interval;
  final void Function(int index)? onTap;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    this.height = 160,
    this.autoPlay = true,
    this.interval = const Duration(seconds: 4),
    this.onTap,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _controller;
  Timer? _timer;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.9);
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer?.cancel();
    if (!widget.autoPlay || widget.imageUrls.length < 2) return;
    _timer = Timer.periodic(widget.interval, (_) {
      if (!_controller.hasClients) return;
      final next = (_current + 1) % widget.imageUrls.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: Listener(
            // Pause auto-play while the user touches the carousel.
            onPointerDown: (_) => _timer?.cancel(),
            onPointerUp: (_) => _startAutoPlay(),
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.imageUrls.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: widget.onTap == null
                        ? null
                        : () => widget.onTap!(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CustomCachedImageNetwork(
                        image: widget.imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(widget.imageUrls.length, (i) {
        //     final active = i == _current;
        //     return AnimatedContainer(
        //       duration: const Duration(milliseconds: 250),
        //       margin: const EdgeInsets.symmetric(horizontal: 3),
        //       height: 8,
        //       width: active ? 22 : 8,
        //       decoration: BoxDecoration(
        //         color: active
        //             ? Theme.of(context).colorScheme.primary
        //             : Colors.grey.shade400,
        //         borderRadius: BorderRadius.circular(4),
        //       ),
        //     );
        //   }),
        // ),
      ],
    );
  }
}

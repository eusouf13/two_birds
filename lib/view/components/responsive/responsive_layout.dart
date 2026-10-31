import 'package:flutter/material.dart';

/// Keeps screen contents clear of system insets and readable on tablets.
class ResponsiveBody extends StatelessWidget {
  const ResponsiveBody({super.key, required this.child, this.maxWidth = 700});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}

/// A native logical-pixel target for custom tappable controls.
class TouchTarget extends StatelessWidget {
  const TouchTarget({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.behavior = HitTestBehavior.opaque,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final HitTestBehavior behavior;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: behavior,
      onTap: onTap,
      onLongPress: onLongPress,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
        child: child,
      ),
    );
  }
}

/// Fills the available viewport, and scrolls when content needs more height.
/// Children use natural heights rather than Expanded inside the scroll view.
class ResponsiveScrollView extends StatelessWidget {
  const ResponsiveScrollView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: child,
        ),
      ),
    );
  }
}

/// A single scroll surface for a header and a phone/tablet card collection.
/// The header can scroll away when the keyboard reduces the available height.
class ResponsiveCollectionView extends StatelessWidget {
  const ResponsiveCollectionView({
    super.key,
    required this.header,
    required this.itemCount,
    required this.itemBuilder,
    required this.empty,
    required this.onRefresh,
    this.isLoading = false,
  });

  final Widget header;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget empty;
  final Future<void> Function() onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth - 40;
        final minCardWidth = width >= 600 ? 220.0 : 140.0;
        final columns = width < 600
            ? 2
            : ((width + 15) / (minCardWidth + 15)).floor().clamp(2, 4);
        final cardWidth = (width - (columns - 1) * 15) / columns;
        final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(child: header),
              ),
              if (isLoading || itemCount == 0)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : empty,
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: cardWidth / 1.25 + 130 * textScale,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      itemBuilder,
                      childCount: itemCount,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

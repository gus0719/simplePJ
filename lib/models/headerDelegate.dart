// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  final TabBar tabBar;

  MySliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => 50;//tabBar.preferredSize.height;
  @override
  double get maxExtent => 50;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
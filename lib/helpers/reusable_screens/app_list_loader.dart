import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:shimmer/shimmer.dart';

class AppListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          ProfileShimmer(
            colors: [
              bWhite
            ],
          ),
          ProfileShimmer(
            colors: [
              bWhite
            ],
          ),
          ProfileShimmer(
            colors: [
              bWhite
            ],
          )
        ]
    ) ;
  }
}

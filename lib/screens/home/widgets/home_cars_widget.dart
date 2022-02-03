import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_styles.dart';
import '../../../models/comment/comment.dart';

class HomeCarsWidget extends StatelessWidget {
  final List<Comment> cars;

  const HomeCarsWidget({
    required this.cars,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 80.h,
        ),
        itemCount: cars.length,
        itemBuilder: (BuildContext context, int index) {
          final car = cars[index];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Text(
              '${car.id} ${car.postId} is a ${car.email} car with a top speed of',
              style: QappTextStyles.carTextStyle,
            ),
          );
        },
      );
}

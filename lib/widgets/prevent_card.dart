import 'package:flutter/material.dart';
import 'package:flutter_covidui/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreventCard extends StatelessWidget {
  final String SvgSrc;
  final String title;

  const PreventCard({
    Key key,
    this.SvgSrc,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(SvgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covidui/constant.dart';
import 'package:flutter_covidui/widgets/linear_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;

  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
    this.press
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          return GestureDetector(
            onTap: press,
            child: Container(
              width: constraints.maxWidth / 2 -10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: iconColor.withOpacity(0.12),
                                  shape: BoxShape.circle
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/running.svg",
                                  height: 12,
                                  width: 12,
                                  color: iconColor,
                                ),
                              ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: kTextColor),
                                children: [
                                  TextSpan(
                                    text: "$effectedNum \n",
                                    style: Theme.of(context).textTheme.headline6.copyWith(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: "People",
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 2
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: LineReportChart(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

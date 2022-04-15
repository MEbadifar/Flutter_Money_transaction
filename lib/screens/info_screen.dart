import 'package:flutter/material.dart';
import 'package:mony_transaction/utils/calculate.dart';
import 'package:mony_transaction/utils/extention.dart';
import 'package:mony_transaction/widgets/chart_widget.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, top: 15.0, left: 5.0),
                child: Text(
                  'مدیریت تراکنش ها به تومان',
                  style: TextStyle(
                    fontSize: ScreenSize(context).screenWidth < 1004
                        ? 14
                        : ScreenSize(context).screenWidth * 0.01,
                  ),
                ),
              ),
              MoneyInfoWidget(
                firstText: ' : دریافتی امروز',
                firstPrice: Calculate.dToday().toString(),
                secondText: ' : پرداختی امروز',
                secondPrice: Calculate.pToday().toString(),
              ),
              MoneyInfoWidget(
                firstText: ' : دریافتی این ماه',
                firstPrice: Calculate.dMonth().toString(),
                secondText: ' : پرداختی این ماه',
                secondPrice: Calculate.pMonth().toString(),
              ),
              MoneyInfoWidget(
                firstText: ' : دریافتی امسال',
                firstPrice: Calculate.dYear().toString(),
                secondText: ' : پرداختی امسال',
                secondPrice: Calculate.pYear().toString(),
              ),
              const SizedBox(
                height: 50,
              ),
              Calculate.dYear() == 0 && Calculate.pYear() == 0
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 200,
                      child: const BarChartWidget(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

//!Money Info Widget
class MoneyInfoWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String firstPrice;
  final String secondPrice;
  const MoneyInfoWidget({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.firstPrice,
    required this.secondPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20.0,
        top: 20.0,
        left: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              secondPrice,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: ScreenSize(context).screenWidth < 1004
                    ? 14
                    : ScreenSize(context).screenWidth * 0.01,
              ),
            ),
          ),
          Expanded(
            child: Text(
              secondText,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: ScreenSize(context).screenWidth < 1004
                    ? 14
                    : ScreenSize(context).screenWidth * 0.01,
              ),
            ),
          ),
          Expanded(
            child: Text(
              firstPrice,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: ScreenSize(context).screenWidth < 1004
                    ? 14
                    : ScreenSize(context).screenWidth * 0.01,
              ),
            ),
          ),
          Expanded(
            child: Text(
              firstText,
              style: TextStyle(
                fontSize: ScreenSize(context).screenWidth < 1004
                    ? 14
                    : ScreenSize(context).screenWidth * 0.01,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          children: [
            BudgetSection(),
            CustomBudgetTile(
              assetImagePath: 'assets/images/kids.png',
              budgetEquation: "\$ 2,000 from \$ 2,556",
              percentage: 0.8,
              remaining: "556 \$",
              textBesideTitle: " and 1 more",
              title: "Kids",
            ),
            CustomBudgetTile(
              assetImagePath: 'assets/images/health.png',
              budgetEquation: "\$ 2,000 from \$ 5,223",
              percentage: 0.4,
              remaining: "3,223 \$",
              textBesideTitle: " and 2 more",
              title: "Health and Beauty",
            ),
            CustomBudgetTile(
              assetImagePath: 'assets/images/home.png',
              budgetEquation: "\$ 0 from \$ 8,744",
              percentage: 0.8,
              remaining: "8,744 \$",
              textBesideTitle: " and 2 more",
              title: "Domiciliary",
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  MySeparator(
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Out of budget",
                        style: TextStyle(
                            fontSize: 20),
                      ),
                      Text(
                        "\$ 7,444",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.redAccent.shade200,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class CustomBudgetTile extends StatelessWidget {
  const CustomBudgetTile({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.textBesideTitle,
    required this.remaining,
    required this.budgetEquation,
    required this.percentage,
  });

  final String assetImagePath;
  final String title;
  final String textBesideTitle;
  final String remaining;
  final String budgetEquation;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(assetImagePath, height: 50),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              textBesideTitle,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          "Remaining",
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          budgetEquation,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          remaining,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.greenAccent.shade400,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 115,
                      lineHeight: 8.0,
                      percent: percentage,
                      padding: EdgeInsets.zero,
                      barRadius: Radius.circular(5),
                      progressColor: Colors.lightBlue.shade400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BudgetSection extends StatelessWidget {
  const BudgetSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Budget",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Remaining",
                style: TextStyle(fontSize:17, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ 4,000 from \$ 16,523",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "\$ 12,523",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 52,
            lineHeight: 8.0,
            percent: 0.3,
            padding: EdgeInsets.zero,
            barRadius: Radius.circular(5),
            progressColor: Colors.blue.shade700,
          ),
          SizedBox(
            height: 32,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Budget categories",
                style: TextStyle(fontSize: 18),
              )),
        ],
      ),
    );
  }
}

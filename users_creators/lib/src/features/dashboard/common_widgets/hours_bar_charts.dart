import 'package:components/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/sepatator.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_hours.dart';

class HoursBarChards extends StatefulWidget {
  const HoursBarChards({
    Key? key,
    required this.hours,
  }) : super(key: key);
  final List<HoursData> hours;

  @override
  _HoursBarChardsState createState() => _HoursBarChardsState();
}

class _HoursBarChardsState extends State<HoursBarChards> {
  void addingBarChars() {
    if (widget.hours.isNotEmpty) {
      for (int index = 0; index < widget.hours.length; index++) {
        chartData.add(ChartData(
            xAxis: index == 0 || index == widget.hours.length - 1
                ? DateFormat.yMd()
                    .format(DateTime.parse(widget.hours[index].date!))
                : ' ',
            yAxis: widget.hours[index].hours?.toDouble()));
      }
    }
  }

  final List<ChartData> chartData = [];

  @override
  void initState() {
    addingBarChars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.r,
      width: 1.sw,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                6,
                (index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 13.5.r, horizontal: 30.r),
                      child: const MySeparator(
                        color: ColorsLimitless.greyLight,
                      ),
                    )),
          ),
          chartData.isNotEmpty
              ? Align(
                  alignment: const Alignment(0, 2.3),
                  child: SizedBox(
                    height: 155.r,
                    child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      backgroundColor: Colors.transparent,
                      primaryXAxis: CategoryAxis(
                        name: 'XAxis',
                        isInversed: true,
                        axisLine: const AxisLine(color: Colors.white, width: 1),
                        majorGridLines:
                            const MajorGridLines(color: Colors.white, width: 0),
                        minorGridLines:
                            const MinorGridLines(color: Colors.white, width: 0),
                        majorTickLines:
                            const MajorTickLines(color: Colors.white, size: 0),
                        labelStyle: TextStyle(
                            color: ColorsLimitless.textColor, fontSize: 11.sp),
                      ),
                      primaryYAxis: NumericAxis(
                        labelFormat: '{value}h',
                        axisLine: const AxisLine(color: Colors.white, width: 1),
                        majorGridLines:
                            const MajorGridLines(color: Colors.white, width: 0),
                        minorGridLines:
                            const MinorGridLines(color: Colors.white, width: 0),
                        majorTickLines:
                            const MajorTickLines(color: Colors.white, size: 0),
                        labelStyle: const TextStyle(
                            color: ColorsLimitless.greyMedium, fontSize: 11),
                      ),
                      axes: <ChartAxis>[
                        NumericAxis(
                          opposedPosition: true,
                          name: 'YAxis',
                          axisLine:
                              const AxisLine(color: Colors.white, width: 1),
                          majorGridLines: const MajorGridLines(
                              color: Colors.white, width: 0),
                          minorGridLines: const MinorGridLines(
                              color: Colors.white, width: 0),
                          majorTickLines: const MajorTickLines(
                              color: Colors.white, size: 0),
                          labelStyle: const TextStyle(
                              color: ColorsLimitless.greyMedium, fontSize: 0),
                        ),
                      ],
                      series: <ChartSeries<ChartData, String>>[
                        ColumnSeries<ChartData, String>(
                            spacing: 0.3,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3.r),
                                topRight: Radius.circular(3.r)),
                            color: ColorsLimitless.brandColor,
                            dataSource: chartData,
                            xValueMapper: (ChartData sales, _) => sales.xAxis,
                            yValueMapper: (ChartData sales, _) => sales.yAxis,
                            xAxisName: 'XAxis',
                            yAxisName: 'YAxis'),
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Text('No data'),
                )
        ],
      ),
    );
  }
}

class ChartData {
  ChartData({
    required this.xAxis,
    required this.yAxis,
  });
  final String xAxis;
  final double? yAxis;
}

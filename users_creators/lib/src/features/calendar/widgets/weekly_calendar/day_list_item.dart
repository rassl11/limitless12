
import 'package:components/theme/colors.dart';
import 'package:components/theme/fonts.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.onTap,
    required this.weekDay,
    required this.day,
    required this.isSelected,
    required this.mySessionsCount,
    required this.creatorSessionsCount,
  }) : super(key: key);

  final Function onTap;
  final String weekDay;
  final String day;
  final bool isSelected;
  final int mySessionsCount;
  final int creatorSessionsCount;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsLimitless.greyDark
                : Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    weekDay,
                    style: FontsLimitless.textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                        color: isSelected ? Colors.white : ColorsLimitless.greyLight),
                  ),
                ),
                Text(
                  day,
                  style: FontsLimitless.textStyle.copyWith(
                      fontSize: 20,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                      color: isSelected ? Colors.white : ColorsLimitless.greyLight),
                ),
                Center(
                  child: SizedBox(
                    height: 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mySessionsCount,
                            itemBuilder: (context, index) =>  Card(
                              shape:  const CircleBorder(),
                              color: isSelected ? Colors.white : ColorsLimitless.greyDark,
                              child: const Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2),

                              ),
                            )),
                            ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: creatorSessionsCount,
                            itemBuilder: (context, index) => const Card(
                              shape:   CircleBorder(),
                              color: ColorsLimitless.brandColor,
                              child:  Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2),

                              ),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}

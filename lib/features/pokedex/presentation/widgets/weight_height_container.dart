import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/text_helper.dart';

class WeightHeightContainer extends StatelessWidget {
  final double height;
  final double weight;
  const WeightHeightContainer({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xAA3E4047),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "$weight Kg (${TextHelper.kilogramToPoundsConverter(weight)} lbs)",
                style: TextStyle(
                  color: Color(0xFFB8B6B3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Weight",
                style: TextStyle(
                  color: Color(0xFFB8B6B3),
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 24,
            color: Color(0x22B8B6B3),
          ),
          Column(
            children: [
              Text(
                '$height m (${TextHelper.metersToInches(height)}")',
                style: TextStyle(
                  color: Color(0xFFB8B6B3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Height",
                style: TextStyle(
                  color: Color(0xFFB8B6B3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

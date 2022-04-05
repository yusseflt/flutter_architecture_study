import 'package:flutter/material.dart';
import 'package:testing_ddd/features/pokedex/domain/models/stat.dart';

class StatProgress extends StatelessWidget {
  final Stat stat;
  const StatProgress({Key? key, required this.stat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            child: Text(
              stat.stat!.name!,
              style: TextStyle(
                color: Color(0xFFB8B6B3),
              ),
            ),
          ),
          SizedBox(width: 16),
          Flexible(
            flex: 1,
            child: Text(
              stat.baseStat!.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
          Flexible(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: stat.baseStat! / 120,
                color: Color(0xFFB8B6B3),
                backgroundColor: Color(0xFF3E4047),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

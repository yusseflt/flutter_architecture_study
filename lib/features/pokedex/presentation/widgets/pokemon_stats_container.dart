import 'package:flutter/material.dart';
import 'package:testing_ddd/features/pokedex/domain/models/stat.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/stat_progress.dart';

class PokemonStatsContainer extends StatelessWidget {
  final List<Stat> stats;
  const PokemonStatsContainer({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stats",
              style: TextStyle(
                color: Color(0xFFB8B6B3),
              ),
            ),
            Text(
              "Total: ${stats.fold<int>(0, (statA, statB) => statA + statB.baseStat!)}",
              style: TextStyle(
                color: Color(0xFFB8B6B3),
              ),
            )
          ],
        ),
        SizedBox(height: 8),
        for (Stat stat in stats) StatProgress(stat: stat),
      ],
    );
  }
}

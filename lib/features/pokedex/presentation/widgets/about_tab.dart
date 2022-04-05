import 'package:flutter/material.dart';
import 'package:testing_ddd/features/pokedex/domain/models/stat.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/pokemon_stats_container.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/weight_height_container.dart';

class AboutTab extends StatelessWidget {
  final List<Stat>? stats;
  final double weight;
  final double height;
  final String description;

  const AboutTab({
    Key? key,
    required this.stats,
    required this.weight,
    required this.height,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            description.replaceAll("\n", " "),
            style: TextStyle(color: Color(0xFFB8B6B3), height: 1.8),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          WeightHeightContainer(height: height, weight: weight),
          SizedBox(height: 24),
          PokemonStatsContainer(stats: stats!)
        ],
      ),
    );
  }
}

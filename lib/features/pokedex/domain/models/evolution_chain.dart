import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class EvolutionChain extends Equatable {
  EvolutionChain({
    this.url,
  });

  String? url;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };

  @override
  List<Object?> get props => [url];
}

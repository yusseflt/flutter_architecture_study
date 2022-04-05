import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GrowthRate extends Equatable {
  GrowthRate({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory GrowthRate.fromJson(Map<String, dynamic> json) => GrowthRate(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  @override
  List<Object?> get props => [name, url];
}

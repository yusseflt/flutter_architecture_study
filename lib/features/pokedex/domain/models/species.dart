import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Species extends Equatable {
  Species({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
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

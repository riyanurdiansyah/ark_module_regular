import 'package:ark_module_regular/src/domain/entities/coin_entity.dart';

class CoinDTO extends CoinEntity {
  CoinDTO({
    required super.coins,
    required super.isCompleted,
    required super.createdAt,
    required super.updatedAt,
    required super.isOldUser,
  });

  factory CoinDTO.fromJson(Map<String, dynamic> json) => CoinDTO(
        coins: json["coins"] ?? 0,
        isCompleted: json["isCompleted"],
        isOldUser: json["isOldUser"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}

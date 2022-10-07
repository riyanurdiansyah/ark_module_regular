import 'package:cloud_firestore/cloud_firestore.dart';

class CoinEntity {
  CoinEntity({
    this.coins,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
    this.isOldUser,
  });

  int? coins;
  bool? isCompleted;
  Timestamp? createdAt;
  Timestamp? updatedAt;
  bool? isOldUser;
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int totalProducts;
  final int limit;
  final int currentOffset;
  const Pagination({
    this.totalProducts = 0,
    this.limit = 0,
    required this.currentOffset,
  });

  @override
  List<Object> get props => [totalProducts, limit, currentOffset];

  Pagination copyWith({
    int? totalProducts,
    int? limit,
    int? currentOffset,
  }) {
    return Pagination(
      totalProducts: totalProducts ?? this.totalProducts,
      limit: limit ?? this.limit,
      currentOffset: currentOffset ?? this.currentOffset,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'totalProducts': totalProducts});
    result.addAll({'limit': limit});
    result.addAll({'currentOffset': currentOffset});

    return result;
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      totalProducts: map['totalProducts']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
      currentOffset: map['currentOffset']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source));

  @override
  String toString() =>
      'Pagination(totalProducts: $totalProducts, limit: $limit, currentOffset: $currentOffset)';
}

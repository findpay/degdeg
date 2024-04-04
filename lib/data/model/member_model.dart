// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MemberModel extends Equatable {
   final int id;
  final String phone;
  final String firstName;
  final String lastName;
  final String createdAt;
  final String updatedAt;

  const MemberModel({required this.id, required this.phone, required this.firstName, required this.lastName, required this.createdAt, required this.updatedAt});

  @override
  String toString() {
    return 'memberModel(id: $id, phone: $phone, firstName: $firstName, lastName: $lastName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  MemberModel copyWith({
    int? id,
    String? phone,
    String? firstName,
    String? lastName,
    String? createdAt,
    String? updatedAt,
  }) {
    return MemberModel(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
  
  @override
  List<Object?> get props => [id,phone,firstName,lastName,createdAt,updatedAt];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: (map["id"] ?? 0) as int,
      phone: (map["phone"] ?? '') as String,
      firstName: (map["firstName"] ?? '') as String,
      lastName: (map["lastName"] ?? '') as String,
      createdAt: (map["createdAt"]?? '') as String,
      updatedAt: (map["createdAt"]?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) => MemberModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

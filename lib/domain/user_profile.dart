import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_profile.freezed.dart';

part 'user_profile.g.dart';

@freezed
@JsonSerializable()
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    String? userId,
    String? firstName,
    String? lastName,
    String? username,
    String? displayName,
    String? email,
    int? gender,
    DateTime? dateOfBirth,
    List<String>? profilePaths,
    List<String>? headerPaths,
  }) = _UserProfile;

  factory UserProfile.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final Map<String, dynamic> json = snapshot.data() ?? {};
    return _$UserProfileFromJson(json);
  }

  Map<String, dynamic> toFirestore() => _$UserProfileToJson(this);
}

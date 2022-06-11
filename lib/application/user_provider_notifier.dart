import 'package:bonsai_network/domain/user_profile.dart';
import 'package:bonsai_network/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserProfileNotifier extends StateNotifier<UserProfile> {
  UserProfileNotifier() : super(const UserProfile());

  void updateUserId(String? userId) {
    state = state.copyWith(userId: userId);
  }

  void updateUsername(String? username) {
    state = state.copyWith(username: username);
  }

  void updateDisplayName(String? displayName) {
    state = state.copyWith(displayName: displayName);
  }

  void updateEmail(String? email) {
    state = state.copyWith(email: email);
  }

  void updateFirstName(String? firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void updateLastName(String? lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void updateGender(int? genderIndex) {
    state = state.copyWith(gender: genderIndex);
  }

  void updateDateOfBirth(DateTime? dateOfBirth) {
    state = state.copyWith(dateOfBirth: dateOfBirth);
  }

  void updateProfilePath(String? profilePath) {
    state = state.copyWith(
      profilePaths: [...?state.profilePaths, profilePath ?? ''],
    );
  }

  void updateHeaderPath(String? headerPath) {
    state = state.copyWith(
      headerPaths: [...?state.headerPaths, headerPath ?? ''],
    );
  }

  void signInUser() async {}
}

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile>(
  (ref) {
    return getIt<UserProfileNotifier>();
  },
);

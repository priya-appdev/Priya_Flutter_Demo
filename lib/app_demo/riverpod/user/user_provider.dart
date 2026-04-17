import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_notifier.dart';
import 'user_state.dart';

final userProvider =  StateNotifierProvider<UserNotifier,UserState>((ref){
      return UserNotifier()..loadUser();
});

final userNameProvider = Provider<String>((ref){
  final user = ref.watch(userProvider);
  return user.firstName;
});


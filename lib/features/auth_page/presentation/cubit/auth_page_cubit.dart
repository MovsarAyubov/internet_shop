import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_shop/features/auth_page/domain/entities/account_entity.dart';
import 'package:internet_shop/features/auth_page/presentation/cubit/account_in_system_cubit.dart';

import '../../../../setup.dart';
import 'auth_page_state.dart';

class AuthPageCubit extends HydratedCubit<AuthPageState> {
  AuthPageCubit() : super(const AuthPageState());

  final accountInSystemCubit = getIt<AccountInSystemCubit>();

  bool isUserNameExist(String userName) {
    return state.accounts.any((element) => element.userName == userName);
  }

  bool isUserExist(Account account) {
    return state.accounts.contains(account);
  }

  void signInOrUp() {
    if (state.signInOrUp == SignInOrUp.signUp) {
      emit(state.copyWith(signInOrUp: SignInOrUp.signIn));
    } else {
      emit(state.copyWith(signInOrUp: SignInOrUp.signUp));
    }
  }

  void signUp(Account account) {
    if (!isUserNameExist(account.userName)) {
      final list = List<Account>.from(state.accounts)..add(account);
      emit(AuthPageState(accounts: list));
    }
  }

  void signIn(Account account) {
    if (isUserExist(account)) {
      accountInSystemCubit.signIn(account);
    }
  }

  @override
  AuthPageState? fromJson(Map<String, dynamic> json) =>
      AuthPageState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AuthPageState state) => state.toMap();
}

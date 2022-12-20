import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_shop/features/auth_page/presentation/cubit/account_in_system_state.dart';

import '../../domain/entities/account_entity.dart';

@LazySingleton()
class AccountInSystemCubit extends HydratedCubit<AccountInSystemState> {
  AccountInSystemCubit() : super(const AccountInSystemState());

  void signIn(Account account) {
    emit(AccountInSystemState(accountInSystem: account, logged: true));
  }

  void exitFromSystem() {
    emit(const AccountInSystemState(
        accountInSystem: Account(password: "", userName: "quest"),
        logged: false));
  }

  @override
  AccountInSystemState? fromJson(Map<String, dynamic> json) =>
      AccountInSystemState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(AccountInSystemState state) => state.toMap();
}

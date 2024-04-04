import 'package:degdeg/data/repositories/account_repository.dart';
import 'package:degdeg/logic/cubit/save_accounts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/providers/datasources/local_data_source.dart';
import '../data/providers/datasources/remote_data_source.dart';
import '../data/repositories/member_repository.dart';
import 'cubit/accounts_cubit.dart';
import 'cubit/home_cubit.dart';
import 'cubit/authenticate_cubit.dart';
import 'cubit/member_cubit.dart';

class StateInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProviders = <RepositoryProvider>[
    ///network client
    RepositoryProvider<Client>(
      create: (context) => Client(),
    ),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),

    // ///data source repository
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(
        client: context.read<Client>(),
      ),
    ),

    RepositoryProvider<LocalDataSource>(
      create: (context) => LocalDataSourceImpl(
        sharedPreferences: context.read(),
      ),
    ),

    RepositoryProvider<MemberRepository>(
      create: (context) => MemberRepositoryImp(
          remoteDataSource: context.read<RemoteDataSource>(),
          localDataSource: context.read<LocalDataSource>()),
    ),
    RepositoryProvider<AccountRepository>(
      create: (context) => AccountRepositoryImp(
        remoteDataSource: context.read<RemoteDataSource>(),
      ),
    ),
  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<AuthenticateCubit>(
      create: (BuildContext context) => AuthenticateCubit(),
    ),
    BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(),
    ),
    BlocProvider<NewMemberCubit>(
      create: (BuildContext context) =>
          NewMemberCubit(memberRepository: context.read<MemberRepository>()),
    ),
    BlocProvider<AccountsCubit>(
      create: (BuildContext context) =>
          AccountsCubit(accountRepository: context.read<AccountRepository>()),
    ),
    BlocProvider<SaveAccountsCubit>(
      create: (BuildContext context) => SaveAccountsCubit(
          accountRepository: context.read<AccountRepository>()),
    ),
  ];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:degdeg/data/model/member_model.dart';
import 'package:degdeg/data/repositories/member_repository.dart';

part 'member_state.dart';

class NewMemberCubit extends Cubit<NewMemberState> {
  final MemberRepository _memberRepository;
  NewMemberCubit({required memberRepository})
      : _memberRepository = memberRepository,
        super(NewMemberInitial());

  Future<void> addNewMember(Map<String, dynamic> body) async {
    emit(NewMemberLoadingState());

    final result = await _memberRepository.addMember(body);
    result.fold(
      (failure) {
        var errorState = NewMembeErrorState(
            code: failure.statusCode, message: failure.message);
        emit(errorState);
      },
      (value) {
        emit(NewMemberLoadedState(data: value));
      },
    );
  }
}

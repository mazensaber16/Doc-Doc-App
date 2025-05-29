
import 'package:doc_doc/feature/domain/use_case/get_specia_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/home/get_specialise_entity.dart';
import 'home_state.dart';

class HomeViewModel extends Cubit<HomeState> {
  final GetSpecialiseUseCase getSpecialiseUseCase;

  HomeViewModel({required this.getSpecialiseUseCase}) : super(HomeInitialState());

  List<SpecializationEntity> getSpecializationList = [];

  void getSpecialization() async {
    emit(HomeLoadingState());
    var either = await getSpecialiseUseCase.invoke();
    either.fold(
      (error) { emit(HomeErrorState(errorMessage: error));
        print("Error fetching specialization: ${error.errorMessage}");
        },
      (response) {
        getSpecializationList = response.data ?? [];
        emit(HomeSuccessState(getSpecialization: getSpecializationList));
      },
    );
  }

}
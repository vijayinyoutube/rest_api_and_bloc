import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Models/homepage_model.dart';
import '../../Data/Repository/homepage_repo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HomePageRepo homePageRepo;

  late List<HomepageModel> data;

  HomepageBloc(this.homePageRepo) : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) async {
      if (event is LoadData) {
        emit(HomepageLoading());

        await Future.delayed(const Duration(seconds: 2), () async {
          data = await homePageRepo.fetchDetails();

          emit(HomepageLoaded(data));
        });
      }
    });
  }
}

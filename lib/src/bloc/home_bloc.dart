import 'package:bloc/bloc.dart';
import 'package:website_bengkel_robot/src/model/latestpost/latest_post_response.dart';
import 'package:website_bengkel_robot/src/repository/medium_api_repository.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}

class HomeSuccess extends HomeState {
  final LatestPostResponse latestPostResponse;

  HomeSuccess(this.latestPostResponse);
}

abstract class HomeEvent {}

class HomeLoadData extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MediumApiRepository mediumApiRepository = MediumApiRepository();

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadData) {
      yield HomeLoading();
      LatestPostResponse latestPostResponse = await mediumApiRepository.fetchLatestPost();
      if (latestPostResponse.error != null) {
        yield HomeFailure(latestPostResponse.error);
        return;
      }
      yield HomeSuccess(latestPostResponse);
    }
  }

}
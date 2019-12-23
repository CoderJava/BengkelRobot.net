import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:website_bengkel_robot/src/model/latestpost/latest_post_response.dart';
import 'package:website_bengkel_robot/src/repository/medium_api_repository.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

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

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadData extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MediumApiRepository mediumApiRepository;

  HomeBloc(this.mediumApiRepository);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadData) {
      yield HomeLoading();
      try {
        LatestPostResponse latestPostResponse = await mediumApiRepository.fetchLatestPost();
        if (latestPostResponse.error != null) {
          yield HomeFailure(latestPostResponse.error);
          return;
        }
        yield HomeSuccess(latestPostResponse);
      } catch (error) {
        yield HomeFailure('$error');
      }
    }
  }

}
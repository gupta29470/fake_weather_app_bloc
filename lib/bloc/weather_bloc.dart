import 'package:bloc/bloc.dart';
import 'package:weather_app_bloc/data/repositories/weather_repository.dart';

import '../data/models/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    try {
      if (event is GetWeatherEvent) {
        yield WeatherLoading();
        final weather = await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather: weather);
      }
    } on NetworkException {
      yield WeatherError(
        errorMessage:
            "Couldn't fetch weather, check your internet or try again later.",
      );
    }
  }
}

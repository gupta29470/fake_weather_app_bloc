part of 'weather_bloc.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({
    required this.weather,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherLoaded && other.weather == weather;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError({
    required this.errorMessage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherError && other.errorMessage == errorMessage;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

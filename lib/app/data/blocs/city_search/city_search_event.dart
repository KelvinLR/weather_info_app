abstract class CitySearchEvent {}

class SearchCityDataEvent extends CitySearchEvent {
  final double latitude;
  final double longitude;

  SearchCityDataEvent({required this.latitude, required this.longitude});
}

abstract class CitySearchEvent {}

class SearchCityDataEvent extends CitySearchEvent {
  final String localName;

  SearchCityDataEvent({required this.localName});
}

class SearchCurrentLocationDataEvent extends CitySearchEvent {}

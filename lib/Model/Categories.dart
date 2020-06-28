
import 'Griddata.dart';

class Category {
  final String tab;
  final String datails;

  Category(this.tab, this.datails);
}

List<Category> categories = [
  Category("All" , allWonders),
  Category("Ancient 7 Wonders" , ancientWonders),
  Category("New 7 wonders", newWonders),
  Category("7 natural wonders", naturalWonders),
  Category("New 7 wonders of nature", newNaturalWonders),
  Category("New 7 wonders cities", citiesWonders),
  Category("7 wonders of underwater world", underwaterWonders),
  Category("7 wonders of industrial world", industrialWonders),
  Category("7 wonders of solar system" , solarWonders),
];


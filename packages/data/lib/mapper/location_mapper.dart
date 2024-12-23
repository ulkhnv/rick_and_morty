import 'package:data/models/location_model.dart';
import 'package:domain/entities/character.dart';

abstract class LocationMapper {
  Location toLocation(LocationModel locationModel);
}

class LocationMapperImpl extends LocationMapper {
  @override
  Location toLocation(LocationModel locationModel) {
    return Location(
      name: locationModel.name,
      url: locationModel.url,
    );
  }
}

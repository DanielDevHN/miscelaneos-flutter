import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class PokemonRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  PokemonRepositoryImpl({PokemonsDatasource? datasource})
      : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return await datasource.getPokemon(id);
  }
}

import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

class PokemonMapper {
  static Pokemon pokeApiPokemonToEntity(Map<String, dynamic> json) {
    final pokeApiPokemon = PokeApiPokemonResponse.fromJson(json);

    return Pokemon(
      id: pokeApiPokemon.id,
      name: pokeApiPokemon.name,
      spriteFront: pokeApiPokemon.sprites.frontDefault,
    );
  }
}

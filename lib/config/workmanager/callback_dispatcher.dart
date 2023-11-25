import 'package:workmanager/workmanager.dart';

import 'package:miscelaneos/infrastructure/infrastructure.dart';

const fecthBackgroundTaskKey =
    'com.danielreyes.miscelaneos.fect-background-pokemon';
const fecthPeriodicBackgroundTaskKey =
    'com.danielreyes.miscelaneos.fect-background-pokemon';

// Mandatory if the App is obfuscated or using Flutter 3.1+
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fecthBackgroundTaskKey:
        await loadNextPokemon();
        break;
      case fecthPeriodicBackgroundTaskKey:
        await loadNextPokemon();
        break;
    }

    return true;

    //simpleTask will be emitted here.
    // print("Native: called background task: $task");
    // return Future.value(true);
  });
}

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositoryImpl();
  final pokemonRepository = PokemonRepositoryImpl();

  final lastPokemonId = await localDbRepository.pokemonCount() + 1;

  try {
    final (pokemon, message) =
        await pokemonRepository.getPokemon('$lastPokemonId');

    if (pokemon == null) throw message;

    await localDbRepository.insertPokemon(pokemon);
    print('Pokemonn inserted: ${pokemon.name}');
  } catch (e) {
    print('$e');
  }
}

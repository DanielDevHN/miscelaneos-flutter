import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;

  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return pokemonAsync.when(
      data: (pokemon) => _PokemonView(pokemon: pokemon),
      error: (error, stackTrace) => _ErrorView(message: error.toString()),
      loading: () => const _LoadingView(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () {
              SharePlugin.shareLink(
                  'https://pokemon-deeplinking-website.up.railway.app/${pokemon.id}',
                  'Mira este pokemon');
            },
            icon: const Icon(Icons.share_rounded),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LoadingAnimationWidget.newtonCradle(
        color: Color(Colors.blue.value),
        size: 150,
      )),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokeman_app/models/pokemanmodel.dart';
import 'package:http/http.dart' as http;

class FavoritesScreen extends StatefulWidget {
  final Set<int> _favorites;

  FavoritesScreen(this._favorites);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Pokemon> _favoritedPokemon = [];
  Future<List<Pokemon>> _fetchFavoritedPokemon() async {
  final List<Pokemon> favoritedPokemon = [];

  for (int id in widget._favorites) {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      final pokemon = Pokemon(
        id: id,
        name: data['name'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
      );

      favoritedPokemon.add(pokemon);
    }
  }

  return favoritedPokemon;
}


  @override
  void initState() {
    super.initState();

    _fetchFavoritedPokemon().then((pokemons) {
      setState(() {
        _favoritedPokemon = pokemons;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009946),
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: _favoritedPokemon.length,
        itemBuilder: (context, index) {
          final pokemon = _favoritedPokemon[index];

          return Card(
            child: Column(
              children: [
                Image.network(pokemon.imageUrl),
                Text(pokemon.name),
                
              ],
            ),
          );
        },
      ),
    );
  }
}

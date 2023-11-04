import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokeman_app/models/pokemanmodel.dart';
import 'package:pokeman_app/screens/favscreen.dart';

class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  // List<Pokemon> _pokemon = [];
  Set<int> _favorites = {};

  Future<List<Pokemon>> _fetchPokemon() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      if (results != null) {
        final List<Pokemon> pokemonList = results.map((pokemonData) {
          final id =
              int.tryParse(pokemonData['url'].split('/').reversed.elementAt(1));
          final name = pokemonData['name'];
          return Pokemon(
              id: id!,
              name: name,
              imageUrl:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png');
        }).toList();

        return pokemonList;
      }
    }
    throw Exception('Failed to load data from the API');
  }

  void _addToFavorites(Pokemon pokemon) {
    setState(() {
      _favorites.add(pokemon.id);
    });
  }

  void _removeFromFavorites(Pokemon pokemon) {
    setState(() {
      _favorites.remove(pokemon.id);
    });
  }

  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009946),
        title: Text('Pokedex'),
        actions: [IconButton(onPressed: () {
          Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FavoritesScreen(_favorites);
                                }));
        }, icon: Icon(Icons.favorite_border_sharp))],
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _fetchPokemon(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pokemondata = snapshot.data!;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pokemondata.length,
              itemBuilder: (context, index) {
                final pokemon = pokemondata[index];

                return Card(
                  child: Column(
                    children: [
                      Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png'),
                      Text(pokemon.name),
                      IconButton(
                        icon: Icon(_favorites.contains(pokemon.id)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                        onPressed: () {
                          setState(() {
                            if (_favorites.contains(pokemon.id)) {
                              _favorites.remove(pokemon.id);
                            } else {
                              _favorites.add(pokemon.id);
                            }
                          });
                        },
                        color: _favorites.contains(pokemon.id)
                            ? Colors.red
                            : Colors.black,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
                child: Text('An error occurred while fetching the data.'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

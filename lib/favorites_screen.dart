import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'movie_category.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<MovieCategory> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    setState(() {
      favorites = favoritesJson
          .map((json) => MovieCategory.fromJson(jsonDecode(json)))
          .toList();
    });
  }

  void removeFromFavorites(MovieCategory movie) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    favoritesJson.removeWhere((json) =>
    MovieCategory.fromJson(jsonDecode(json)).id == movie.id
    );
    await prefs.setStringList('favorites', favoritesJson);
    loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: loadFavorites,
          ),
        ],
      ),
      body: favorites.isEmpty
          ? Center(child: Text('Your favorites list is empty.'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final movie = favorites[index];
          return ListTile(
            leading: Image.asset(
              movie.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(movie.name),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => removeFromFavorites(movie),
            ),
          );
        },
      ),
    );
  }
}
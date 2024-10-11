import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'movie_category.dart';
import 'favorites_screen.dart';

class DetailScreen extends StatefulWidget {
  final MovieCategory category;

  DetailScreen({required this.category});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  late MovieCategory currentCategory;
  bool hasRated = false;
  int userRating = 0;

  @override
  void initState() {
    super.initState();
    currentCategory = widget.category;
    checkIfFavorite();
    loadRating();
  }

  void checkIfFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      isFavorite = favorites.any((fav) {
        final favMovie = MovieCategory.fromJson(jsonDecode(fav));
        return favMovie.id == currentCategory.id;
      });
    });
  }

  void loadRating() async {
    final prefs = await SharedPreferences.getInstance();
    final ratingsMap = json.decode(prefs.getString('ratings') ?? '{}');
    final userRatingsMap = json.decode(prefs.getString('userRatings') ?? '{}');

    if (ratingsMap.containsKey(currentCategory.id)) {
      setState(() {
        currentCategory = MovieCategory.fromJson(ratingsMap[currentCategory.id]);
      });
    }

    if (userRatingsMap.containsKey(currentCategory.id)) {
      setState(() {
        hasRated = true;
        userRating = userRatingsMap[currentCategory.id];
      });
    }
  }

  void toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    final movieJson = jsonEncode(currentCategory.toJson());

    setState(() {
      if (isFavorite) {
        favorites.removeWhere((fav) {
          final favMovie = MovieCategory.fromJson(jsonDecode(fav));
          return favMovie.id == currentCategory.id;
        });
      } else {
        favorites.add(movieJson);
      }
      isFavorite = !isFavorite;
    });

    await prefs.setStringList('favorites', favorites);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isFavorite ? 'Added to favorites' : 'Removed from favorites')),
    );
  }

  void rateWebtoon(int rating) async {
    if (hasRated) return;

    setState(() {
      currentCategory.addRating(rating);
      hasRated = true;
      userRating = rating;
    });

    final prefs = await SharedPreferences.getInstance();
    final ratingsMap = json.decode(prefs.getString('ratings') ?? '{}');
    ratingsMap[currentCategory.id] = currentCategory.toJson();
    await prefs.setString('ratings', json.encode(ratingsMap));

    final userRatingsMap = json.decode(prefs.getString('userRatings') ?? '{}');
    userRatingsMap[currentCategory.id] = rating;
    await prefs.setString('userRatings', json.encode(userRatingsMap));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Thank you for rating!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentCategory.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    currentCategory.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Details about ${currentCategory.name}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(currentCategory.description),
                        SizedBox(height: 16),
                        Text(
                          'Average Rating: ${currentCategory.averageRating.toStringAsFixed(1)} (${currentCategory.totalRatings} ratings)',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(hasRated ? 'Your rating:' : 'Rate this webtoon:'),
                        RatingBar(
                          rating: hasRated ? userRating.toDouble() : currentCategory.averageRating,
                          onRatingChanged: hasRated ? null : rateWebtoon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: toggleFavorite,
                    child: Text(isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 50),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(),
                        ),
                      );
                    },
                    child: Text('Go to Favorites'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  final Function(int)? onRatingChanged;

  RatingBar({required this.rating, this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: onRatingChanged != null ? () => onRatingChanged!(index + 1) : null,
        );
      }),
    );
  }
}
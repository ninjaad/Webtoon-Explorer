import 'package:flutter/material.dart';
import 'movie_category.dart';
import 'detail_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MovieCategory> categories = [
    MovieCategory(
      id: '1',
      name: 'Action',
      imageUrl: 'assets/action.jpg',
      description: '''Creator: JMFelic
Genre: Action
Do you believe in supernatural creatures like werewolves, vampires, and witches? How would you feel if one day you were transported to a different realm when you touched a painting? The same thing happened with Serena in The Alpha King’s Claim. One rainy day, she buys an interesting painting while taking shelter in a painting shop. When she touched the painting at her home, she got transported to the realm where werewolves lived. Moreover, she ends up on the bed of the Alpha King Aero, who hates all women.''',
    ),
    MovieCategory(
      id: '2',
      name: 'Comedy',
      imageUrl: 'assets/comedy.jpg',
      description: '''Creator: Sungeun
Genre: Comedy
Do you believe vampires exist? What would your first reaction be if you crossed paths with a vampire? Would you be delighted, terrified, or unsure of how to act? Well, Chae-i certainly had an unusual reaction than the others. Chae-i is an actress who has been in the entertainment industry ever since she can remember. However, she is been having a hard time fitting in with other actors due to the extremely painful headaches she started having a little while ago. As a consequence of this, her professional life started deteriorating.
Everyone started thinking of her as some stuck-up actress. However, one time, she gets bitten by Ijun, a top actor who is a vampire. Surprisingly, her headache vanishes for a week. Hence, she asks him to continue biting her to keep everything going smoothly. To her surprise, Ijun asks for a contractual relationship in return. Read the popular webtoon, Bitten Contract, to find out his motive behind asking Chae-i for a relationship.'''    ),
    MovieCategory(
      id: '3',
      name: 'Documentary',
      imageUrl: 'assets/documentary.jpg',
      description: '''Creator: Domi, Nokdu
Genre: Documentary
Paris is known as the city of love by the whole world. Would you consider going there freshly after a breakup? Jian is a beautiful young woman who works in the fashion industry. One day, she discovers that her new handsome boss is the person she had been hooked up with in France. She dismisses it, thinking that he probably does not remember her since it has been so long. However, she is proved wrong. On top of it all, he is extremely rude to her in the office but too nice when alone. Also, the new gay couple that shifted next door is quite interesting. Scroll the popular webtoon The Runaway to know what happens when Jian's ex tries patching up things with her and why the handsome neighbor is too kind to her.''',
    ),
    MovieCategory(
      id: '4',
      name: 'Drama',
      imageUrl: 'assets/drama.jpg',
      description: '''Creator: HONGDUCK, NEMONE
Genre: Drama
The popular webtoon series Seasons of Blossom is a compilation of several individual stories that are all connected. It contains all four seasons: spring, summer, fall, and winter. Each season contains a different story and a different theme with different endings. It focuses majorly on school bullying and how much it can affect someone's whole life. Despite it being based on high school students, the story has several serious events and a storyline with many variations. Check out this webtoon to learn about each story and their interlinked connections.''',
    ),
    MovieCategory(
      id: '5',
      name: 'Fantasy',
      imageUrl: 'assets/fantasy.jpg',
      description: '''Creator: Hariheen
Genre: Fantasy
How would you feel if one day you woke up in the novel you wrote just after dying in the real world? Would you feel ecstatic to have a chance to live again? Or would you feel scared because of the uncertain possibilities and the danger lurking? Daisy is a woman with a kind yet strong personality. Following her death in the real world, she wakes up in the novel she wrote with her nine other friends just for fun. Unfortunately, her living conditions do not change much. However, one random day, she is arrested by the duke’s soldier for helping her friend out.'''
    ),
    MovieCategory(
      id: '6',
      name: 'Horror',
      imageUrl: 'assets/horror.jpg',
      description: '''Creator: Aengo
Genre: Horror
Do you believe that people judge others based on their outer appearance? Have you ever been judged based on your looks? Kiyo is an ex-idol trainee who wants to live like a normal teenager. In this attempt, he starts living with his grandmother and enrolls in a new school. He even starts wearing ugly-looking glasses to hide his exceptional looks. There, he meets Lily, another victim of the same thing. People fear her and her father just because of their scary features, even though they are nice. However, Kiyu makes the same mistakes as others and judges Lily just like everyone else. Gradually, Kiyu realizes his mistake and the fact that Lily is really nice and kind. Read Your Smile Is A Trap to learn about their blossoming love and the obstacles they face.'''
    ),
    MovieCategory(
      id: '7',
      name: 'Romance',
      imageUrl: 'assets/romance.jpg',
      description: '''Creator: Enjelicious
Genre: Romance
Gwen is a kind and passionate young woman with a tragic backstory. Her mother died when she was young, and her stepmother and stepsister treated her even worse with the demise of her father. Before dying, her father suggests she go on a cruise vacation with her best friend when her partner broke up with her to focus on his career instead. On the vacation, she meets Arthur, a handsome but lonely young man. Things escalate between them when they share their unfortunate fates. They end up hooking up, but Gwen runs away, afraid of the outcome. Fate brings them 2 years later, and they end up in a legal fight when Arthur finds out about his and Gwen's child. Read Hello Baby to learn whether they can solve their differences''',
    ),
    MovieCategory(
      id: '8',
      name: 'Sci-Fi',
      imageUrl: 'assets/scifi.jpg',
      description: '''Creator: Namsoo
Genre: Sci-Fi
Are you an organized person who keeps track of every detail, disregarding how insignificant it may be, or are you a messy person who goes with the flow? Bareum is a very organized person who even maintains a diary detailing all her events and commitments. She has always had great marks and a clear record of what she wants to do in the future. However, one thing that she has not had any luck with is making a boyfriend. She decides to do things a little differently to achieve this goal and hence joins a programming club despite her planner being full. Fate has different plans in store for her. Read the popular webtoon Romance 101 to find out whether or not she was able to achieve this goal.'''
    ),
    MovieCategory(
      id: '9',
      name: 'Thriller',
      imageUrl: 'assets/thriller.jpg',
      description: '''Creator: Hanza Art
Genre: Thriller
The Guy Upstairs follows Rosy, a college undergraduate who is an orphan and barely makes ends meet by working odd jobs. However, her life is not too tough, especially because of her best friend Hawa. She supported and trusted her when nobody else did. However, strangely enough, she hears weird sounds coming from the floor above. One random day she decides to check just for her peace of mind, but wait, why is there a dead body of a woman? Moreover, why is she being dragged by her neighbor upstairs?'''
    ),
    MovieCategory(
      id: '10',
      name: 'Animation',
      imageUrl: 'assets/drama.jpg',
      description: '''Creator: Jaerim, Bulsa, Flada
Genre: Animation
If you ever get a chance to go back and change things you regret now, would you do it? Yeonu is a young and beautiful woman married to Seonjae, a cold and handsome businessman. Her marriage was of convenience and hence there is no love between her and her husband. They tried running the marriage, but ultimately, Yeonu gave up, and they divorced. Due to a series of unfortunate events, Seonjae dies in front of her. However, fate gives her a second chance, and she vows to save Seonjae this time. Read There Must Be Happy Endings to find out whether or not Yeonu was able to save Seonjae and why Seonjae seems to be hiding several secrets.'''
    ),
  ];

  bool _isSearching = false;
  String _searchQuery = "";
  late List<MovieCategory> _filteredCategories;

  @override
  void initState() {
    super.initState();
    _filteredCategories = List.from(categories);
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchQuery = "";
        _filteredCategories = List.from(categories);
      }
    });
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
      _filteredCategories = categories
          .where((category) =>
          category.name.toLowerCase().contains(newQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            border: InputBorder.none,
          ),
          onChanged: _updateSearchQuery,
        )
            : Text('Movie Categories'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: _filteredCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(category: _filteredCategories[index]),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      _filteredCategories[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  _filteredCategories[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
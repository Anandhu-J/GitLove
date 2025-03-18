import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'profiles_end_screen.dart';

// Data model representing a person.
class Person {
  final String name;
  final int age;
  final String pronouns;
  final String jobTitle;
  final String location;
  final String shortBio;
  final List<String?> imageList;

  Person({
    required this.name,
    required this.age,
    required this.pronouns,
    required this.jobTitle,
    required this.location,
    required this.shortBio,
    required this.imageList,
  });
}

class PeopleTab extends StatefulWidget {
  PeopleTab({Key? key}) : super(key: key);

  @override
  _PeopleTabState createState() => _PeopleTabState();
}

class _PeopleTabState extends State<PeopleTab> {
  final List<Person> people = [
    Person(
      name: "Sanika",
      age: 24,
      pronouns: "she/her",
      jobTitle: "Logistics Operative",
      location: "Manchester, UK",
      shortBio: "New here, excited to connect!\nLoves art and travel.",
      imageList: [
        "https://picsum.photos/400/600?random=1",
        "https://picsum.photos/400/600?random=2",
        "https://picsum.photos/400/600?random=3"
      ],
    ),
    Person(
      name: "Abin",
      age: 28,
      pronouns: "he/him",
      jobTitle: "Software Engineer",
      location: "Bangalore, India",
      shortBio: "Coffee lover. Passionate about coding.\nAlways learning.",
      imageList: [
        "https://picsum.photos/400/600?random=2",
        "https://picsum.photos/400/600?random=1",
        "https://picsum.photos/400/600?random=5",
        "https://picsum.photos/400/600?random=4"
      ],
    ),
    Person(
      name: "Rizwana",
      age: 26,
      pronouns: "she/her",
      jobTitle: "Data Analyst",
      location: "Pune, India",
      shortBio: "Data & design enthusiast.\nMusic, movies, and more.",
      imageList: [
        "https://picsum.photos/400/600?random=3",
        "https://picsum.photos/400/600?random=2",
        "https://picsum.photos/400/600?random=1",
        "https://picsum.photos/400/600?random=6",
        "https://picsum.photos/400/600?random=5"
      ],
    ),
    Person(
      name: "Basil",
      age: 24,
      pronouns: "he/him",
      jobTitle: "Logistics Operative",
      location: "Manchester, UK",
      shortBio: "New here, excited to connect!\nLoves art and travel.",
      imageList: ["https://picsum.photos/400/600?random=4"],
    ),
    Person(
      name: "Rinsh",
      age: 28,
      pronouns: "he/him",
      jobTitle: "Software Engineer",
      location: "Bangalore, India",
      shortBio: "Coffee lover. Passionate about coding.\nAlways learning.",
      imageList: [
        "https://picsum.photos/400/600?random=5",
        "https://picsum.photos/400/600?random=1"
      ],
    ),
    Person(
      name: "Alphonsa",
      age: 26,
      pronouns: "she/her",
      jobTitle: "Data Analyst",
      location: "Pune, India",
      shortBio: "Data & design enthusiast.\nMusic, movies, and more.",
      imageList: ["https://picsum.photos/400/600?random=6"],
    ),
  ];

  final TCardController _tCardController = TCardController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double bottomNavBarHeight = kBottomNavigationBarHeight; // Default 56dp
    double windowHeight = screenHeight - bottomNavBarHeight;

    final List<Widget> cards = people
        .map((person) => SingleChildScrollView(
              child: PersonCard(person: person, windowHeight: windowHeight),
            ))
        .toList();

    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(5),
      child: cards.isEmpty
          ? const ProfilesEndScreen()
          : TCard(
              controller: _tCardController,
              size: Size(MediaQuery.of(context).size.width, windowHeight),
              lockYAxis: true,
              slideSpeed: 20,
              delaySlideFor: 200,
              cards: cards,
              onEnd: () {
                setState(() {
                  people
                      .clear(); // ✅ Remove all profiles when last card is swiped
                });
              },
            ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final Person person;
  final double windowHeight;

  const PersonCard({Key? key, required this.person, required this.windowHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var imageUrl in person.imageList) ...[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(
                  imageUrl!!,
                  height: windowHeight * 0.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: windowHeight * 0.5,
                      color: Colors.blue,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${person.name}, ${person.age}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      person.jobTitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      person.location,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      person.shortBio,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

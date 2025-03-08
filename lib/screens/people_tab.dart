import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

// Data model representing a person.
class Person {
  final String name;
  final int age;
  final String pronouns;
  final String jobTitle;
  final String location;
  final String shortBio;
  final String imageUrl;

  Person({
    required this.name,
    required this.age,
    required this.pronouns,
    required this.jobTitle,
    required this.location,
    required this.shortBio,
    required this.imageUrl,
  });
}

class PeopleTab extends StatefulWidget {
  PeopleTab({Key? key}) : super(key: key);

  @override
  _PeopleTabState createState() => _PeopleTabState();
}

class _PeopleTabState extends State<PeopleTab> {
  // Dummy data for demo purposes.
  final List<Person> people = [
    Person(
      name: "Sanika",
      age: 24,
      pronouns: "she/her",
      jobTitle: "Logistics Operative",
      location: "Manchester, UK",
      shortBio: "New here, excited to connect!",
      imageUrl: "https://picsum.photos/400/600?random=1",
    ),
    Person(
      name: "Rahul",
      age: 28,
      pronouns: "he/him",
      jobTitle: "Software Engineer",
      location: "Bangalore, India",
      shortBio: "Loves coding and coffee.",
      imageUrl: "https://picsum.photos/400/600?random=2",
    ),
    Person(
      name: "Aisha",
      age: 26,
      pronouns: "she/her",
      jobTitle: "Data Analyst",
      location: "Pune, India",
      shortBio: "Passionate about data and design.",
      imageUrl: "https://picsum.photos/400/600?random=3",
    ),
  ];

  final TCardController _tCardController = TCardController();

  @override
  Widget build(BuildContext context) {
    // Create a list of cards using our PersonCard widget.
    final List<Widget> cards = people
        .map((person) => PersonCard(person: person))
        .toList();

    return Container(
      color: Colors.grey[300], // Background for the People tab.
      padding: const EdgeInsets.all(10),
      child: cards.isEmpty
          ? const Center(
        child: Text(
          "No more profiles",
          style: TextStyle(fontSize: 24),
        ),
      )
          : TCard(
        controller: _tCardController,
        cards: cards,
        onEnd: () {
          // Optionally, you can show a message when all cards are swiped.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You've seen all profiles")),
          );
        },
        // Uncomment the next lines to handle swipe events if needed:
        // onForward: (index, info) {
        //   print("Card at index $index swiped with info: $info");
        // },
        // onBack: (index) {
        //   print("Reverted to card index $index");
        // },
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the card height to nearly full screen.
    double cardHeight = MediaQuery.of(context).size.height * 0.95;
    double cardWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10), // 10dp padding from all sides.
      child: Card(
        color: Colors.blue, // Blue background for the card.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Well-rounded corners.
        ),
        elevation: 4,
        child: Container(
          height: cardHeight,
          width: cardWidth,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image section – occupies 60% of card height.
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    person.imageUrl,
                    height: cardHeight * 0.6,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: cardHeight * 0.6,
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
                      // Compliment Button.
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Compliment sent to ${person.name}!'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite),
                          label: const Text('Compliment'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

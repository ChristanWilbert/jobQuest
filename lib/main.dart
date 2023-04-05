import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    homePageWidget(),
    Text(
      'Coming Soon...',
    ),
    profileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(173, 170, 216, 1),
        title: customAppBarTitle(),
        toolbarHeight: 200,
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: MySearchDelegate(),
                );
              }),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}

class customAppBarTitle extends StatelessWidget {
  const customAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: const <Widget>[
              Expanded(
                child: Text(
                  'JobQuest',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
                ),
              ),
              //Text('C', textAlign: TextAlign.center),
            ],
          ),
          Row(children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: Text('Welcome back'),
              ),
            )
          ]),
          Row(children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 7),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    label: Text("Search"),
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 253, 253),
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 30, 29, 29)),
                  ),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}

class homePageWidget extends StatelessWidget {
  const homePageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: [
            Row(children: const [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: introCard(),
              ),
            ]),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Explore",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View all",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ]),
          ),
          exploreJob(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const Spacer(),
            ]),
          ),
          exploreCategories(),
        ]);
  }
}

class exploreCategories extends StatelessWidget {
  const exploreCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List features = [
      "Job Search",
      "Resume Builder",
      "Interview Preparation",
      "Internships",
      "Skill Building",
      "Networking",
      "Counselling",
      "Career Statistics",
    ];
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          children: (features.map((feature) {
            return Card(
              color: Color.fromRGBO(173, 170, 216, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.all(8),
              child: SizedBox(
                width: 120,
                height: 90,
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      feature,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          })).toList(),
        ));
  }
}

class exploreJob extends StatelessWidget {
  const exploreJob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List jobs = [
      {
        'title': 'Dentist',
        'icon':
            'https://www.smilesbymyles.com/wp-content/uploads/2022/03/dental-service-900x600.jpg',
        'description':
            "The path to becoming a dentist is pretty straightforward. Because the occupation requires licensure, you must follow specific educational requirements in order to qualify for state certification. Because of this you should become familiar with your state's requirements as well as the general requirements for dental school admission. Most dental schools have minimum grade point average (GPA) standards as well as course prerequisites so you should keep this in mind throughout your college years. College and dental school will each take four years of full-time attendance, so you should make a long-term plan before enrolling in your Bachelor degree program. That way you can customize your curriculum to dental school standards and utilize your time for maximum effectiveness. Here are the basic steps to become a dentist:\nStep 1: - Earn Your Bachelor's Degree \nStep 2: - Pass the Dental Admission Test Step 3: - Complete Dental School Training Step 4: - Pass Licensure Requirements Step 5: - Consider an Area of Specialization",
      },
      {
        'title': 'Pharmacist',
        'icon':
            'https://www.northeastern.edu/graduate/blog/wp-content/uploads/2022/01/what-does-a-pharmacist-do.jpg',
        'description':
            "To become a pharmacist in India, the person should have a valid permit given by the Governing Authority. By acquiring this permit, he/she would be able to begin their pharmaceutical practice. To get this permit, one must finish the required education. Besides, one should also have a diploma degree in Pharmacy or Bachelor in Pharmacy.With the increasing demand for medicines, the need for pharmacy professionals is also high. A pharmacist can find jobs in hospitals, Medical Clinics, Government Drug Research Institutes, etc. The significant job positions they work on include Drug Safety Associate, Clinical Research Associate, Drug Inspector, Pharmaceutical Scientist and other sales positions in pharmacy company like Sun pharmaceutical, Novartis, Cipla, Baxter, Abbott, etc. A pharmacist is a well-known profession among science students. A Pharmacist earns an average salary of INR 3-4.5 Lacs annually initially can go up till INR 12 Lacs depending on the job experience while a pharmacist who practices drawing around INR 8-10 Lacs annually.",
      },
      {
        'title': 'Physician',
        'icon':
            'https://www.smilesbymyles.com/wp-content/uploads/2022/03/dental-service-900x600.jpg',
        'description': 'dghdiugehirghiej'
      },
      {
        'title': 'Lawyer',
        'icon':
            'https://www.smilesbymyles.com/wp-content/uploads/2022/03/dental-service-900x600.jpg',
        'description': 'dghdiugehirghiej'
      },
      {
        'title': 'Accountant',
        'icon':
            'https://www.smilesbymyles.com/wp-content/uploads/2022/03/dental-service-900x600.jpg',
        'description': 'dghdiugehirghiej'
      },
      {
        'title': 'Architect',
        'icon':
            'https://www.smilesbymyles.com/wp-content/uploads/2022/03/dental-service-900x600.jpg',
        'description':
            "Every physical structure sprouted initially from the genius mind of an Architect who transformed the simplest idea into a wonderfully created structure! From the conception of the idea to its formulation as well as construction to enliven it, the architect remains engaged in all the details. If you have a knack for designing and an eye for detail, then you must consider studying Architecture. This blog brings you a comprehensive guide on how to become an architect, including the courses, universities as well as career scope this field has on offer. An architect is involved in planning, designing and overseeing the construction of different structures such as offices, houses, malls, stadiums etc. The task of an architect is not easy, they have to make sure that the constructions adhere to different measures of public safety, quality, functionality and environmental protection. Therefore, the architect needs to have an understanding of all these factors along with a creative streak. Since architects need to work in teams, having great interpersonal and communication skills are a must for them.",
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Wrap(
        children: (jobs.map((job) {
          return Card(
            color: Color.fromRGBO(173, 170, 216, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.all(6),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDescription(
                            job['title'], job['icon'], job['description'])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  job['title'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        })).toList(),
      ),
    );
  }
}

class introCard extends StatelessWidget {
  const introCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color.fromRGBO(173, 170, 216, 1),
        child: SizedBox(
          width: 300,
          height: 200,
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(38.0)),
                    child: Image(
                      image: AssetImage('images/thinking.jpg'),
                      height: 150,
                      width: 150,
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Having trouble picking a career? Take a free test to identify your skills.',
                    style: TextStyle(fontSize: 15),
                    softWrap: true,
                    maxLines: 9,
                    overflow: TextOverflow.fade, //new
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ["Astronaut", "Artist", "Architect"];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Icon(Icons.send_rounded);
  }
}

class JobDescription extends StatelessWidget {
  final String title, desc, image;

  const JobDescription(this.title, this.image, this.desc, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customAppBarTitle(),
        toolbarHeight: 200,
        backgroundColor: Color.fromRGBO(173, 170, 216, 1),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: MySearchDelegate(),
                );
              }),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pharmacist1.jpg'),
            fit: BoxFit.cover,
            opacity: 200,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0, right: 28, left: 28),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      desc,
                      style: TextStyle(fontSize: 15),
                      softWrap: true,
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      //margin: EdgeInsets.only(top: 0),
      child: Card(
        margin: EdgeInsets.only(top: 100),
        child: SizedBox(
          width: 320,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Icon(Icons.account_circle, size: 60),
                  ),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('John Doe ', style: TextStyle(fontSize: 20.0)),
                    Text('johndoe@gmail.com', style: TextStyle(fontSize: 20.0)),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

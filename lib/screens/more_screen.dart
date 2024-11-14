import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/coming_soon_movie.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              'New & Hot',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.blue,
                  height: 27,
                  width: 27,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '  🍿 Coming Soon  ',
                ),
                Tab(
                  text: "  🔥 Everyone's watching  ",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ComingSoonMovie(
                      imageUrl:
                          'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                      overview:
                          'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                      logoUrl:
                          "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                      month: "Jun",
                      date: "19",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovie(
                       imageUrl:
                          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRW8yNeSKFc2ZS1MN5EWcAZdK4R8CF76dQD4R9lP_VxofZNYgpA',
                      overview:
                          'Avinash "Tiger" Singh Rathore is assigned by the new RAW chief Maithili Menon, to rescue Tiger former aid, Gopi Arya, who was captured during a mission in Afghanistan while trying to extract information from the Taliban about a mission being planned in Pakistan.',
                      logoUrl:
                          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRW8yNeSKFc2ZS1MN5EWcAZdK4R8CF76dQD4R9lP_VxofZNYgpA",
                      month: "Mar",
                      date: "07",
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: ComingSoonMovie(
                   imageUrl:
                            'https://m.media-amazon.com/images/M/MV5BNDdkNTY1MDQtY2I5MC00OTFlLTg5OWQtZWE2YzE5NWFiMDgzXkEyXkFqcGc@._V1_FMjpg_UX300_.jpg',
                        overview:
                            'An Indian agent races against a doomsday clock as a ruthless mercenary, with a bitter vendetta, mounts an apocalyptic attack against the country.',
                        logoUrl:
                            "https://m.media-amazon.com/images/M/MV5BNDdkNTY1MDQtY2I5MC00OTFlLTg5OWQtZWE2YzE5NWFiMDgzXkEyXkFqcGc@._V1_FMjpg_UX300_.jpg",
                  month: "Feb",
                  date: "20",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

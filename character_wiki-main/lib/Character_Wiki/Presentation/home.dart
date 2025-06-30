import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Rick & Morty Wiki')),
drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
            'Filters',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('Characters', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu(
              label: Text('Status'),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Alive', label: 'Alive'),
                DropdownMenuEntry(value: 'Dead', label: 'Dead'),
                DropdownMenuEntry(value: 'Unknown', label: 'Unknown'),
              ],
            ),
            SizedBox(height: 10),
            DropdownMenu(
              label: Text('Species'),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Human', label: 'Human'),
                DropdownMenuEntry(value: 'Alien', label: 'Alien'),
                DropdownMenuEntry(value: 'Robot', label: 'Robot'),
              ],
            ),
            SizedBox(height: 10),
            DropdownMenu(
              label: Text('Gender'),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Female', label: 'Female'),
                DropdownMenuEntry(value: 'Male', label: 'Male'),
                DropdownMenuEntry(value: 'Unknown', label: 'Unknown'),
              ],
            ),
          ],
        ),
      ),

      const SizedBox(height: 30),

      // Episode Section
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('Episode', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            DropdownMenu(
              label: Text('Choose'),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Episode 1', label: 'Episode 1'),
                DropdownMenuEntry(value: 'Episode 2', label: 'Episode 2'),
                DropdownMenuEntry(value: 'Episode 3', label: 'Episode 3'),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),

      // Location Section
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            DropdownMenu(
              label: Text('Choose'),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Location 1', label: 'Location 1'),
                DropdownMenuEntry(value: 'Location 2', label: 'Location 2'),
                DropdownMenuEntry(value: 'Location 3', label: 'Location 3'),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),

      const SizedBox(height: 20),

      // Clear Filters Button
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.clear),
          label: Text('Clear Filters'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.redAccent,
          ),
        ),
      ),
    ],
  ),
),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(onPressed: () {}, child: Text('Characters')),
            MaterialButton(onPressed: () {}, child: Text('Episode')),
            MaterialButton(onPressed: () {}, child: Text('Location')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        isSelected = true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          border: Border.all(
                            color: isSelected == true
                                ? Colors.white54
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

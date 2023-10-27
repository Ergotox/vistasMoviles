import 'package:flutter/material.dart';
import 'package:vistas/screens/profile.dart';
import 'package:vistas/screens/successful_payment.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;
  void _navigateToProfile() {
    Navigator.pushNamed(context, '/profile');
  }

  final List<Widget> _children = [
    SuccessfulPayment(),
    Center(child: Text('Events')),
    Center(child: Text('About')),
    Profile()

  ];

  void _navigateBottomNavBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget createPaddedText(String text, double fontSize, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }

  PopupMenuItem<int> buildMenuItem(IconData icon, String text, int value) {
    return PopupMenuItem<int>(
      child: Row(
        children: [
          Icon(icon, color: Colors.black,),
          SizedBox(width: 10),
          Text(text),
        ],
      ),
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset('assets/images/logo.png', height: 80),
            SizedBox(width: 15),
            TextButton (
              onPressed:(){Center(child: Text('Menu'));}, 
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('AllEvents', style: TextStyle(color: Colors.white, fontSize: 20))
                ),
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.white, width: 1)
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(color: Colors.white)
                  )
                ),
              ),
            ),
          ],
        ),
        actions:<Widget> [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return[
                buildMenuItem(Icons.person, 'Profile', 0),
                buildMenuItem(Icons.question_mark, 'FAQ\'s', 1),
              ];
            },
             onSelected: (int value) {
              if (value == 0) {
                Navigator.pushNamed(context, '/profile');
              } 
            },
            
            
          )
        ],
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 83, 17, 92)
      ),
      

      body: _children[_selectedIndex], 

      
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _selectedIndex,
       onTap: _navigateBottomNavBar,
       type: BottomNavigationBarType.fixed,
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
         BottomNavigationBarItem(icon: Icon(Icons.event), label: 'My Events'),
         BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About Us'),
        ],
      ),
  

    );
  }
}
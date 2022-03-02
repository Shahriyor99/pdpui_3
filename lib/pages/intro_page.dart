import 'package:flutter/material.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/utils/strings.dart';

class IntroPage extends StatefulWidget {
  static final String id='IntroPage';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController _pageController=PageController();
  int _currentIndex=0;

  @override
  void initState() {
    _pageController=PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [

            PageView(
              onPageChanged: (int page){
                setState(() {
                  _currentIndex=page;
                });
              },
              controller: _pageController,
              children: [
                makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                ),

                makePage(
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                ),

                makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),

            _controllSkip(),

          ],
        ),
      ),
    );
  }

  Widget makePage({image, title, content}){
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.red, fontSize: 35, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(content, style: TextStyle(color: Colors.grey, fontSize: 20,), textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

 Widget _controllSkip() {
    if(_currentIndex==2){
      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 40),
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
          child: Text('skip', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
        ),
      );
    }else{
      return Container();
    }
  }

}

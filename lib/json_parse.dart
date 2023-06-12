import 'package:connect/review.dart';
import 'package:flutter/material.dart';
import 'service.dart';

class JsonParse extends StatefulWidget {
   const JsonParse({Key? key}) : super(key: key);
  @override
  State<JsonParse> createState() =>_JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  bool _isFavoriteClicked = false;
  int _count = 0;
  List<Review> review = <Review>[];
  bool loading = false;
 /* late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  */
  @override
  void initState() {
    super.initState();
    Services.getInfo().then((value){
      setState(() {
        review = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? '리뷰오더' : 'Loading...'),   //앱바에 적힐 이름
        centerTitle: true,  //중앙정렬
      ),
      body:
        ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Image.network("https://cdn.pixabay.com/photo/2019/11/23/15/30/ramen-4647411_960_720.jpg"),
            ListTile(
              leading: IconButton(    //좌측 좋아요아이콘버튼-클릭시 숫자 증가
                icon: Icon(
                  _isFavoriteClicked ? Icons.favorite_border : Icons.favorite,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: () {
                  print('IconButton()');
                  changeIconStatus();
                },

              ),

              trailing: const Icon(   //우측 아이콘 별점 추가하기
                Icons.star,

                color: Colors.yellow,
              ),

            ),

            Text(
              '     $_count',
              style: TextStyle(fontSize: 24),
            ),
            const ListTile(
              subtitle: Text(
              '주문한 가게',
                style: TextStyle(fontSize: 20),
            ),
            ),
            const ListTile(
              subtitle: Text(
                '주문한 메뉴'
              ),
            )
          ]
        ),
        drawer: Drawer(  // 내비게이션 바 열기
    child: ListView(
    padding: EdgeInsets.zero,
        children: <Widget>[
           const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/profile2.jpg'),
              backgroundColor: Colors.white,
            ),
            accountName: Text('QUANZ'),
            accountEmail: Text('rbtkd2642@naver.com'),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                )
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.grey[850],
              ),
              title:  Text('내 프로필'),
              onTap: (){
                print('내 프로필 is clicked');
              }
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title:  Text('홈'),
            onTap: (){
              print('홈 is clicked');
            },
            //trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title:  Text('설정'),
            onTap: () {
              print('설정 is clicked');
            },
            //trailing: const Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.ad_units,
              color: Colors.grey[850],
            ),
            title:  Text('둘러보기'),
            onTap: () {
              print('둘러보기 is clicked');
            },
            //trailing: const Icon(Icons.add),
          )
        ]
    )
    ),

     //참고용 코드
      /*
      body: ListView.builder(
        itemCount: _review.length,
        itemBuilder: (context, index){
          User user = _review[index] as User;

          return ListTile(
            leading: const Icon(      //왼쪽에 출력되는 위젯
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: const Icon(     //오른쪽에 출력되는 위젯
              Icons.phone_android_outlined,
              color: Colors.red,
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
      */
    );

  }
  void changeIconStatus() {   //아이콘 클릭시 값의 증가
      setState(() {
        _isFavoriteClicked = !_isFavoriteClicked;
      });
      if (_isFavoriteClicked) {
        _count += 1;
      }
    }
  }


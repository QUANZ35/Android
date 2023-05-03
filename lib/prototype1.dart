import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    '아웃백 기브미 파이브',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                Text(/*'주소:대구 달서구 달구벌대로 1545 (죽전동, 골든뷰 메디타워) 2층'*/
                      '아웃백의 인기 애피타이저 5종을 맛볼 수 있는 플래터\n'
                      '(골드 코스트 코코넛 슈림프, 크리스피 쿠카부라 윙, \n'
                      '레인지랜드 립레츠, 오지 치즈 후라이즈, 치킨 핑거)',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41')      /*FavoriteWidget()*/
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, '전화'),
          _buildButtonColumn(color, Icons.place, '위치'),
          _buildButtonColumn(color, Icons.share, '공유'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: RichText(      //텍스트 영역 중복 생성
        text: const TextSpan(
          text:' ',
          children:[
            TextSpan(
              text:'주문한 가게\n',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
            TextSpan(
              text: '아웃백스테이크하우스 대구죽전점\n\n',
              style: TextStyle(
                color: Colors.black
              )
            ),
            TextSpan(
                text:'맛도 괜찮고 사이드 메뉴인데 5가지 종류가 나오니 가성비면에서 굉장히 추천합니다!\n'
                    '이번에 친구랑 같이 갔는데 양이 많아서 포장해 갔어요~\n\n\n',
                style: TextStyle(
                  color: Colors.black,
              )
            )
          ]
        )
      )
    );

    return MaterialApp(
      title: '리뷰오더',
      debugShowCheckedModeBanner: false, //debug mode 우측상단 아이콘 제거
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('리뷰오더'),
          centerTitle: true,  //중앙 정렬
          elevation: 0.0,

          actions: <Widget>[
            IconButton( //계정 아이콘
              visualDensity: const VisualDensity(horizontal: 3.0),//아이콘 간 간격 조정
              icon: const Icon(Icons.person), //계정 아이콘 생성
              onPressed: () { // 버튼을 눌렀다는 부분의 시각적 표현
                print('Your account information and profile is clicked');
              },
            ),

            IconButton(  // 검색 아이콘
              visualDensity: const VisualDensity(horizontal: 3.0),
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Search button is clicked');
              },
            ),

          ],
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
                title: const Text('내 프로필'),
                onTap: (){
                  print('내 프로필 is clicked');
                }
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey[850],
                ),
                title: const Text('홈'),
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
                title: const Text('설정'),
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
                title: const Text('둘러보기'),
                onTap: () {
                  print('둘러보기 is clicked');
                },
                //trailing: const Icon(Icons.add),
              )
            ]
          )
        ),

        body: ListView(
          children: [
            Image.asset(
              'images/give_me_five.jpg',
              width: 450,
              height: 446,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }


  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}


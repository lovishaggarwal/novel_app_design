import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'constant_widgets.dart';

enum BookType { hard, pdf, audible }

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  double reviewRating = 4.5;
  BookType selectedType = BookType.hard;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: null,
            color: Colors.black54,
            iconSize: 25.0,
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: null,
        ),
        title: Center(
          child: Container(
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.grey[400].withOpacity(0.4),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.brown[400],
                    size: 22.0,
                  ),
                  onPressed: null,
                ),
                hintText: 'Search a book...',
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            height: 35.0,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: AuthorTile(
                authorName: 'Suzanne Dudley',
                authorUrl: 'images/author2.jpg',
                followers: '13.2k',
              ),
            ),
            Stack(
              children: [
                Container(
//                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  height: size.width * 0.6,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[350].withOpacity(0.4),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 2,
                    heightFactor: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 30),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: size.width * 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '\$ 39.99',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.7),
                                ),
                                Text(
                                  '207.584 Sales',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.7),
                                ),
                              ],
                            ),
                            Text(
                              'Get a copy:',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.7),
                            ),
                            Column(children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedType = BookType.hard;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedType == BookType.hard
                                        ? Colors.brown[200].withOpacity(0.7)
                                        : Colors.transparent,
                                  ),
                                  height:
                                      selectedType == BookType.hard ? 30 : 20,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 3,
                                        backgroundColor: selectedType ==
                                                BookType.hard
                                            ? Colors.orange[50]
                                            : Colors.pink[300].withOpacity(.6),
                                      ),
                                      Container(
                                          width: 70, child: Text('Hard Cover'))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedType = BookType.pdf;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedType == BookType.pdf
                                        ? Colors.brown[200].withOpacity(0.7)
                                        : Colors.transparent,
                                  ),
                                  height:
                                      selectedType == BookType.pdf ? 30 : 20,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 3,
                                        backgroundColor: selectedType ==
                                                BookType.pdf
                                            ? Colors.orange[50]
                                            : Colors.pink[300].withOpacity(.6),
                                      ),
                                      Container(width: 70, child: Text('PDF'))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedType = BookType.audible;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: selectedType == BookType.audible
                                        ? Colors.brown[200].withOpacity(0.7)
                                        : Colors.transparent,
                                  ),
                                  height: selectedType == BookType.audible
                                      ? 30
                                      : 20,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 3,
                                        backgroundColor: selectedType ==
                                                BookType.audible
                                            ? Colors.orange[50]
                                            : Colors.pink[300].withOpacity(.6),
                                      ),
                                      Container(
                                          width: 70, child: Text('Audible'))
                                    ],
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0),
                  height: size.width * 0.6,
                  width: size.width * .41,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 12,
                        blurRadius: 18,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage('images/book3.jpg'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 4.4,
                  widthFactor: 3.25,
                  child: MaterialButton(
                    onPressed: () {},
                    elevation: 20.0,
                    color: Colors.pink[300].withOpacity(.6),
                    textColor: Colors.white,
                    child: Icon(
                      Icons.shopping_basket,
                      size: 30,
                    ),
                    padding: EdgeInsets.all(12),
                    shape: CircleBorder(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'UI Design and UX',
              style: TextStyle(fontSize: 11.0),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Out of the Box: A Journey in and Out of Emotional Captivity',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.7),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  height: 45.0,
                  width: 2.0,
                  color: Colors.brown[400].withOpacity(0.5),
                ),
                Expanded(
                  child: ReadMoreText(
                    'This book is for anyone who grew up trying to be "good"-- high achieving and competent -- and then who found themselves boxed in, slowly eroded, broken, and struggling. It will provide readers with a living map of how one such woman made it out, re-writing her life from the inside out.',
                    trimLines: 3,
                    colorClickableText: Colors.pinkAccent[400],
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '...Show more',
                    trimExpandedText: ' show less',
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width * 0.5),
              child: TabBar(
                labelPadding: EdgeInsets.all(0.0),
                labelStyle: TextStyle(fontWeight: FontWeight.w900),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                controller: _tabController,
//              indicatorColor: kActiveCardColor,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 0.01,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: size.width * 0.042,
                        fontFamily: 'Pridi',
//                      fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Book Info',
                      style: TextStyle(
                        fontSize: size.width * 0.042,
                        fontFamily: 'Pridi',
//                      fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
//            SizedBox(
//              height: 5.0,
//            ),
            Flexible(
//              constraints: BoxConstraints(maxHeight: 70.0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  ListView(
                    children: [
                      RatingTile(),
                      RatingTile(),
                    ],
                  ),
                  Container(),
                ],
              ),
            ),
            SizedBox(height: 15.0)
          ],
        ),
      ),
    );
  }
}

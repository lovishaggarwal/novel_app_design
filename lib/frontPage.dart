import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelappdesign/detailsPage.dart';
import 'constant_widgets.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Book Categories:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    '2/9',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.width * .55),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsPage();
                        }));
                      },
                      child: BookTile(
                        verticalText: '* Design & UX',
                        imageUrl: 'images/book3.jpg',
                      ),
                    ),
                    BookTile(
                      verticalText: '* Self Help',
                      imageUrl: 'images/book4.jpg',
                    ),
                    BookTile(
                      verticalText: '* Design & UX',
                      imageUrl: 'images/book1.jpg',
                    ),
                    BookTile(
                      verticalText: '* Self Help',
                      imageUrl: 'images/book2.jpg',
                    ),
                    BookTile(
                      verticalText: '* Design & UX',
                      imageUrl: 'images/book1.jpg',
                    ),
                    BookTile(
                      verticalText: '* Self Help',
                      imageUrl: 'images/book2.jpg',
                    ),
                    BookTile(
                      verticalText: '* Design & UX',
                      imageUrl: 'images/book1.jpg',
                    ),
                    BookTile(
                      verticalText: '* Self Help',
                      imageUrl: 'images/book2.jpg',
                    ),
                    BookTile(
                      verticalText: '* Design & UX',
                      imageUrl: 'images/book1.jpg',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Books of September:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    '5/25',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height * 0.469),
                child: Container(
//                    height: size.height * 0.5,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(15.0)),
                    color: Colors.grey[400].withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 135),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BookList(imgUrl: 'images/book1.jpg'),
                        BookList(imgUrl: 'images/book2.jpg'),
                        BookList(imgUrl: 'images/book3.jpg'),
                        BookList(imgUrl: 'images/book4.jpg'),
                        BookList(imgUrl: 'images/book5.jpg'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular Authors:',
//                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.80,
                        maxHeight: 160.0,
                      ),
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        scrollDirection: Axis.vertical,
                        children: [
                          AuthorTile(
                            authorName: 'Adrian Carson',
                            authorUrl: 'images/author1.jpg',
                            followers: '12.5k',
                          ),
                          Divider(
                            indent: 15.0,
                            thickness: 1.0,
                          ),
                          AuthorTile(
                            authorName: 'Suzanne Dudley',
                            authorUrl: 'images/author2.jpg',
                            followers: '13.2k',
                          ),
                          Divider(
                            indent: 15.0,
                            thickness: 1.0,
                          ),
                          AuthorTile(
                            authorName: 'Francis Duncan',
                            authorUrl: 'images/author3.png',
                            followers: '14.8k',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

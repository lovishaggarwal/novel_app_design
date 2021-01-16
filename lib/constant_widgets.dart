import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.brown[400],
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: 75.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.person_add,
            size: 15.0,
            color: Colors.brown[400],
          ),
          Text(
            'Follow',
            style: TextStyle(color: Colors.brown[400]),
          )
        ],
      ),
    );
  }
}

class BookList extends StatelessWidget {
  BookList({@required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.0),
      height: 120.0,
      width: 80.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 4), // changes position of shadow
          ),
        ],
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7.0),
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  const BookTile({@required this.verticalText, @required this.imageUrl});
  final String verticalText, imageUrl;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(7.0),
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[400].withOpacity(0.3),
      ),
      width: size.width * 0.5 - 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            direction: Axis.vertical,
            children: [
              RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    verticalText,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  )),
            ],
          ),
          Container(
            height: 140.0,
            width: 90.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(1, 4), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                  image: AssetImage(imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(7.0),
            ),
          )
        ],
      ),
    );
  }
}

class AuthorTile extends StatelessWidget {
  const AuthorTile({@required this.authorName, this.authorUrl, this.followers});
  final String authorUrl, authorName, followers;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 20.0,
        backgroundImage: AssetImage(authorUrl),
      ),
      title: Text(
        authorName,
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '$followers followers',
        style: TextStyle(fontSize: 12.0),
      ),
      trailing: FollowButton(),
    );
  }
}

class RatingTile extends StatefulWidget {
  @override
  _RatingTileState createState() => _RatingTileState();
}

class _RatingTileState extends State<RatingTile> {
  double reviewRating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10, right: 10),
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            height: 55.0,
            width: 70.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.pinkAccent.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                '$reviewRating',
                style: GoogleFonts.prata(
                    color: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: RichText(
                  text: TextSpan(
                      text: '3,546',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Customer Reviews',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              ),
              RatingBar(
                itemSize: 25.0,
                initialRating: 4.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.pinkAccent.withOpacity(0.3),
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    reviewRating = rating;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

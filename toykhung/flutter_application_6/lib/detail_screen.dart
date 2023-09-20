import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class DetailScreen  extends StatelessWidget {
  const DetailScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Detail();
  }
}

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    var imgUrl = product.image;
    imgUrl ??= "https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-20.jpg";
    
    return Scaffold(
      appBar: AppBar(title: Text("Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.00,color: Colors.white),),
      backgroundColor: Colors.black,),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16.0/9.0,
            child: Image.network(imgUrl),
            ),
          ListTile(
            title: Text(
              "${product.title}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "\$ ${product.price}",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            title: Text(
              "Category",
            style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              "${product.category}",
              style: TextStyle(fontSize: 18.00),
            ),
          ),
          ListTile(
            title: Text(
              "Rating :${product.rating!.rate}/5 of ${product.rating!.count}"),
          ),
          RatingBar.builder(
            itemBuilder: (coutext,index) => Icon(
              Icons.star,color:Colors.amber,
            ),
            onRatingUpdate:(value)=>print(value),
            minRating: 0,
            itemCount: 5,
            allowHalfRating: true,
            direction: Axis.horizontal,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            initialRating: product.rating!.rate ?? 0,
            )

        ],
      ),
    );
  }
}
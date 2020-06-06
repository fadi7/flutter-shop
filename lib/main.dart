import 'package:flutter/material.dart';
import 'package:generalshop/api/product_api.dart';
import 'package:generalshop/product/product.dart';

void main() {
  runApp(GeneralApp());
}

class GeneralApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  ProductApi productApi = ProductApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: productApi.fetchProducts(1),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return _error('no thing happened');
              break;
            case ConnectionState.waiting:
              return _loading();
              break;
            case ConnectionState.active:
              return _loading();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return _error(snapshot.error.toString());
              }
              if (!snapshot.hasData) {
                return _error('No Data');
              }
              return ListView.builder(
                  itemBuilder: (context, int index) {
                    return _drawProduct(snapshot.data[index]);
                  },
                  itemCount: snapshot.data.length);
              break;
          }
          return Container();
        },
      ),
    );
  }

  _error(String error) {
    return Container(
      child: Center(
        child: Text(error),
      ),
    );
  }

  _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  _drawProduct(Product product) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(product.title),
            (product.images.length > 0)
                ? Image(image: NetworkImage(product.images[0]))
                : Text('No Image'),
          ],
        ),
      ),
    );
  }
}

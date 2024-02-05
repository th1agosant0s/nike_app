import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String image;
  final String name;
  final String description;
  final double price;

  Product(
      {required this.name,
      required this.image,
      required this.description,
      required this.price});
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(
        image: 'dunk_blue.png',
        name: 'Tenis Nike Dunk Low Retro Se Masculinos',
        description:
            'Avançar rápido. Rebobinar. Não importa – este tênis leva o retrô para o futuro. O V2K remasteriza tudo o que você adora no Vomero em um visual retirado diretamente de um catálogo de corrida dos primeiros anos. Camadas com uma mistura de azuis gelados, detalhes translúcidos e uma entressola macia com uma estética perfeitamente vintage. E uma sola grossa garante que você se sinta confortável onde quer que vá.',
        price: 899.99),
    Product(
        image: 'dunk_grey.png',
        name: 'Tenis Nike Dunk Low Retro Se Masculino',
        description:
            'Criado para as quadras, mas levado para as ruas, o ícone do basquete dos anos 80 retorna com materiais premium que levam seu estilo para o próximo nível. Seu colarinho acolchoado e decotado permite que você leve seu jogo para qualquer lugar - com conforto.',
        price: 1999.99),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png',
                fit: BoxFit.contain, height: 10, width: 10),
          ),
          title: Text(''),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: products[index]),
                    ),
                  );
                },
                child: Column(
                  children: products
                      .map<Widget>((e) => lista(products[index].name, products[index].image)
                        )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
            ),
          ],
        ),
      ),
    );
  }
}

Widget lista(texto, img) {
  return Column(
    children: [
      Text(texto),
      Image.asset(img)
    ],
  );
}

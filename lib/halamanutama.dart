import 'package:flutter/material.dart';
import 'package:pertemuanlima/halamandetail.dart';
import 'package:pertemuanlima/data_buku.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('LIST BUKU'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku buku = listBuku[index];
          return InkWell(
            onDoubleTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => halamandetail(detail : buku,),
              )
              );
            },
            child: Card(
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width /6 ,
                        child: Image.network(
                            buku.imageLink,
                            fit: BoxFit.fill,
                        ),
                    ),
                    Text(buku.author),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

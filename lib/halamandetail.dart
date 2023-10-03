import 'package:flutter/material.dart';
import 'package:pertemuanlima/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class halamandetail extends StatelessWidget {
  const halamandetail({super.key, required this.detail});
  final DataBuku detail;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detail.title),
        backgroundColor: Colors.deepPurpleAccent,
          actions: <Widget>[
            BookmarkButton(),

            IconButton(onPressed: (){}, icon:Icon(Icons.favorite)
            ),
        ],
      ),

      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(detail.imageLink),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Judul Buku :',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                detail.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Penulis      :',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                detail.author,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Tahun Terbit :',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                detail.year.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Negara Asal  :',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                detail.country,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Bahasa   :',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                detail.language,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Jumlah Halaman :',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                detail.pages.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),

          SizedBox(height: 40,),
          IconButton(onPressed: (){
            _launcher(detail.link);
          }, icon: Icon(Icons.link)),
          SizedBox(height: 20,),
        ],

      ),
    );
  }
  Future<void> _launcher(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw Exception("gagal membuka url : $_url");
    }
  }
}

class BookmarkButton extends StatefulWidget {
  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isBookmarked ? Icons.favorite : Icons.favorite_border,
        color: _isBookmarked ? Colors.white : null,
      ),
      onPressed: () {
        setState(() {
          _isBookmarked = !_isBookmarked;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isBookmarked ? 'Favorit berhasil :)' : 'favorit dihapus :('),
            backgroundColor : _isBookmarked ? Colors.lightGreen : Colors.red,
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tugas3/model/biodata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo User Interface',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
    );
  }
}

/*
Map<int, Biodata> ObjBiodata = {
  1 : Biodata(nama: 'Alvin Hartono', nim: '32210010', tanggalLahir: '21 November 2002'),
  2 : Biodata(nama: 'Lim Yong Teck', nim: '32210011', tanggalLahir: '28 Mei 2002'),
  3 : Biodata(nama: 'Kindy Joy Jonathan Mangundap', nim: '32210077', tanggalLahir: '23 Juni 2003')
};
*/

final List<Biodata> ObjBiodata = [
  Biodata(
      nama: 'Alvin Hartono', nim: '32210010', tanggalLahir: '21 November 2002'),
  Biodata(nama: 'Lim Yong Teck', nim: '32210011', tanggalLahir: '28 Mei 2002'),
  Biodata(
      nama: 'Kindy Joy Jonathan Mangundap',
      nim: '32210077',
      tanggalLahir: '23 Juni 2003')
];

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelompok 5'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Text(ObjBiodata[index].nama),
              ],
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AnotherScreen(mahasiswa: ObjBiodata[index]),
            )),
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key, required this.mahasiswa});

  final Biodata mahasiswa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Biodata: ${mahasiswa.nama}"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.grey,
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(mahasiswa.nama, textAlign: TextAlign.center),
                  )
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(mahasiswa.nim, textAlign: TextAlign.center),
                  )
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(mahasiswa.tanggalLahir, textAlign: TextAlign.center),
                  )
                ],
              ),
            ],
          ),
        ));

    // body: Column(children: [
    //   Text(mahasiswa.nama),
    //   Text(mahasiswa.nim),
    //   Text(mahasiswa.tanggalLahir)
    // ],),
  }
}

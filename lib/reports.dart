import 'package:counter_app/lisview_builder.dart';
import 'package:counter_app/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Reportchart extends StatefulWidget {
  @override
  const Reportchart({super.key});
  State<Reportchart> createState() => _ReportPagechart();
}

class _ReportPagechart extends State<Reportchart> {
  static const receipt = '''
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" 
fill="none" stroke="#F59E0B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 2v20l4-2 4 2 4-2 4 2V2l-4 2-4-2-4 2Z"/><line x1="8" y1="10" x2="16" y2="10"/><line x1="8" y1="14" x2="12" y2="14"/></svg>''';

  final List<Map<String, dynamic>> reports = [
    {
      'title': 'Net sales',
      'amount': '307.31',
      'type': 'Cr',
      'bgcolor': const Color(0xFFEBF5FF),
      'svg': SvgIcons.netSales,
    },
    {
      'title': 'Net purchase',
      'amount': '242.30',
      'type': 'Cr',
      'bgcolor': const Color(0xFFFFFBEB),
      'svg': SvgIcons.netPurchase,
    },
    {
      'title': 'Gross profit',
      'amount': '307.31',
      'type': 'Cr',
      'bgcolor': const Color(0xFFECFDF5),
      'svg': SvgIcons.arrowUpCircle,
    },
    {
      'title': 'Receivables',
      'amount': '242.30',
      'type': 'Cr',
      'bgcolor': const Color(0xFFF5F3FF),
      'svg': SvgIcons.users,
    },
    {
      'title': 'Profit',
      'amount': '307.31',
      'type': 'Cr',
      'bgcolor': const Color(0xFFFEF2F2),
      'svg': SvgIcons.netPurchase,
    },
    {
      'title': 'Net purchase',
      'amount': '242.30',
      'type': 'Cr',
      'bgcolor': const Color(0xFFFEF2F2),
      'svg': SvgIcons.netPurchase,
    },
    {
      'title': 'Stock',
      'amount': '307.31',
      'type': 'Cr',
      'bgcolor': const Color(0xFFFEF2F2),
      'svg': SvgIcons.netPurchase,
    },
    {
      'title': 'Paybles',
      'amount': '242.30',
      'type': 'Cr',
      'bgcolor': const Color(0xFFFEF2F2),
      'svg': SvgIcons.netPurchase,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Reports',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
          textAlign: TextAlign.start,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
                iconSize: 18,
                padding: EdgeInsets.zero,
                // alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SearchBar(
              hintText: "Search reports",
              leading: Icon(Icons.search, color: Colors.grey),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10),
              ),
              elevation: WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Colors.grey.shade100),

              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  side: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
              onChanged: (value) {},
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search Reports',
            //     hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 15),
            //     filled: true,
            //     fillColor: Colors.grey.shade100,
            //     prefixIcon: Icon(Icons.search, color: Colors.grey),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(color: Colors.grey),
            //     ),
            //     contentPadding: EdgeInsets.symmetric(vertical: 10),
            //   ),
            // ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: reports.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final metric = reports[index];
                  return GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginpageState(),
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductList(
                            title: metric['title'],
                            amount: '307.85',
                            data: reports[index],
                            onDataSelected: (String value) {
                              print(value);
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: metric['bgcolor'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.string(metric['svg']),
                            ),
                            SizedBox(height: 15),
                            Text(
                              metric['title'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '307.31',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Cr',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w100,
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SvgIcons {
  static const String netSales = '''
    <svg viewBox="0 0 24 24">
      <rect x="3" y="12" width="4" height="9" rx="1" fill="#3B82F6"/>
      <rect x="10" y="8" width="4" height="13" rx="1" fill="#3B82F6"/>
      <rect x="17" y="4" width="4" height="17" rx="1" fill="#3B82F6"/>
    </svg>
  ''';

  static const netPurchase = '''
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" 
  stroke="#F59E0B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 2v20l4-2 4 2 4-2 4 2V2l-4 2-4-2-4 2Z"/><line x1="8" y1="10" x2="16" y2="10"/><line x1="8" y1="14" x2="12" y2="14"/></svg>''';

  static const recepits =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#16A34A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/><polyline points="17 6 23 6 23 12"/></svg>''';

  static const payments =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#F59E0B" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>''';

  static const stockValue =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#8B5CF6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>''';
  static const arrowUpCircle =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#16A34A" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polyline points="16 12 12 8 8 12"/><line x1="12" y1="16" x2="12" y2="8"/></svg>''';

  static const users =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#8B5CF6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>''';
  static const userss =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#8B5CF6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>''';
}

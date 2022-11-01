import 'package:kafelelyatimee/Controller/pdf_api.dart';
import 'package:kafelelyatimee/models/invoice.dart';
import 'package:kafelelyatimee/widget/button_widget.dart';
import 'package:kafelelyatimee/widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:kafelelyatimee/Vue/addkid.dart';
import 'package:kafelelyatimee/Vue/Distribution.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("yo"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
                    for (int ctr = 1; ctr <= cmp; ctr++) {
                      bl[cmp] = "non";
                      bf[cmp] = "non";
                      bs[cmp] = "non";
                    }

                    for (int ctr = 1; ctr <= cmp; ctr++) {
                      if (qrl[cmp] != null) {
                        bl[cmp] = "oui";
                      }
                      if (qrf[cmp] != null) {
                        bf[cmp] = "oui";
                      }
                      if (qrs[cmp] != null) {
                        bs[cmp] = "oui";
                      }
                    }

                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: "yo",
                        address: 'Ariana',
                      ),
                      customer: Customer(
                        name: "_BnompController.text",
                        address: "_GouverneratController.text",
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        number: '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          NompreF: Nomp[2].toString(),
                          Age: age[2].toString(),
                          niveau: niveau[2].toString(),
                          Livre: bl[2].toString(),
                          Fourniture: bf[2].toString(),
                          Sac: bs[2].toString(),
                        ),
                      ],
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

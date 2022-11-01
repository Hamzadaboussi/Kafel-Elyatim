import 'package:kafelelyatimee/Vue/addkid.dart';
import 'package:kafelelyatimee/Controller/distribution_controller.dart';
import 'package:kafelelyatimee/models/invoice.dart';
import 'package:kafelelyatimee/Vue/Distribution.dart';

final date = DateTime.now();
final dueDate = date.add(Duration(days: 7));
final invoice = Invoice(
  supplier: Supplier(
    name: 'Kafel El Yatime',
    address: 'Ariana',
  ),
  customer: Customer(
    name: p.getbnp().text,
    address: p.getgou().text,
  ),
  info: InvoiceInfo(
    date: date,
    dueDate: dueDate,
    number: '${DateTime.now().year}-9999',
  ),
  items: [
    InvoiceItem(
      NompreF: affichefacture(2, cmp, Nomp[1].toString()),
      Age: affichefacture(2, cmp, age[1].toString()),
      niveau: affichefacture(2, cmp, niveau[1].toString()),
      Livre: affichefacture(2, cmp, bl[1].toString()),
      Fourniture: affichefacture(2, cmp, bf[1].toString()),
      Sac: affichefacture(2, cmp, bs[1].toString()),
    ),
    InvoiceItem(
      NompreF: affichefacture(3, cmp, Nomp[2].toString()),
      Age: affichefacture(3, cmp, age[2].toString()),
      niveau: affichefacture(3, cmp, niveau[2].toString()),
      Livre: affichefacture(2, cmp, bl[1].toString()),
      Fourniture: affichefacture(3, cmp, bf[2].toString()),
      Sac: affichefacture(3, cmp, bs[2].toString()),
    ),
    InvoiceItem(
      NompreF: affichefacture(4, cmp, Nomp[3].toString()),
      Age: affichefacture(4, cmp, age[3].toString()),
      niveau: affichefacture(4, cmp, niveau[3].toString()),
      Livre: affichefacture(4, cmp, bl[3].toString()),
      Fourniture: affichefacture(4, cmp, bf[3].toString()),
      Sac: affichefacture(4, cmp, bs[3].toString()),
    ),
    InvoiceItem(
      NompreF: affichefacture(5, cmp, Nomp[4].toString()),
      Age: affichefacture(5, cmp, age[4].toString()),
      niveau: affichefacture(5, cmp, niveau[4].toString()),
      Livre: affichefacture(5, cmp, bl[4].toString()),
      Fourniture: affichefacture(5, cmp, bf[4].toString()),
      Sac: affichefacture(5, cmp, bs[4].toString()),
    ),
    InvoiceItem(
      NompreF: affichefacture(6, cmp, Nomp[5].toString()),
      Age: affichefacture(6, cmp, age[5].toString()),
      niveau: affichefacture(6, cmp, niveau[5].toString()),
      Livre: affichefacture(6, cmp, bl[5].toString()),
      Fourniture: affichefacture(6, cmp, bf[5].toString()),
      Sac: affichefacture(6, cmp, bs[5].toString()),
    ),
    InvoiceItem(
      NompreF: affichefacture(7, cmp, Nomp[6].toString()),
      Age: affichefacture(7, cmp, age[6].toString()),
      niveau: affichefacture(7, cmp, niveau[6].toString()),
      Livre: affichefacture(7, cmp, bl[6].toString()),
      Fourniture: affichefacture(7, cmp, bf[6].toString()),
      Sac: affichefacture(7, cmp, bs[6].toString()),
    ),
    InvoiceItem(
      NompreF: affichefacture(8, cmp, Nomp[7].toString()),
      Age: affichefacture(8, cmp, age[7].toString()),
      niveau: affichefacture(8, cmp, niveau[7].toString()),
      Livre: affichefacture(8, cmp, bl[7].toString()),
      Fourniture: affichefacture(8, cmp, bf[7].toString()),
      Sac: affichefacture(8, cmp, bs[7].toString()),
    ),
  ],
);

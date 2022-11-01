import 'package:intl/intl.dart';

class Customer {
  final String name;
  final String address;

  const Customer({
    required this.name,
    required this.address,
  });
}

class Supplier {
  final String name;
  final String address;

  const Supplier({
    required this.name,
    required this.address,
  });
}

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String NompreF;

  final String Age;
  final String niveau;
  final String Livre;
  final String Fourniture;
  final String Sac;

  const InvoiceItem({
    required this.NompreF, //discri

    required this.Age, //qnt
    required this.niveau,
    required this.Livre, //vat
    required this.Fourniture,
    required this.Sac,
  });
}

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
}

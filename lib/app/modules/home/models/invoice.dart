

import 'dart:convert';


class Invoice {
  Invoice({
    required this.supplier,
    required this.customer,
    required this.info,
    required this.items,
  });

  Supplier supplier;
  Customer customer;
  InvoiceInfo info;
  List<InvoiceItem> items;

}

class Customer {
  Customer({
    required this.name,
    required this.address,
  });

  String name;
  String address;

}

class InvoiceInfo {
  InvoiceInfo({
    required this.date,
    required this.dueDate,
  });

  String date;
  String dueDate;

}

class Item {
  Item({
    required this.invoiceItem,
  });

  InvoiceItem invoiceItem;

}

class InvoiceItem {
  InvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });

  String description;
  String date;
  int quantity;
  double vat;
  double unitPrice;

}

class Supplier {
  Supplier({
    required this.name,
    required this.address,
    required this.paymentInfo,
  });

  String name;
  String address;
  String paymentInfo;

}

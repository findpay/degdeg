// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentList {
  String id;
  String name;
  String image;
  PaymentList({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<PaymentList> paymentLists = [
  PaymentList(id: '1', name: 'EVC PLUS', image: ''),
  PaymentList(id: '2', name: 'Edahab', image: ''),
  PaymentList(id: '3', name: 'Primier Wallet', image: ''),
];





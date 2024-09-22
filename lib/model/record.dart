class Record{

  String creditors;
  bool hasPaid;
  String product;
  String rate;
  String quantity;
  String paidAmount;
  String number;
  String date;



  Record({required this.date,required this.creditors,required this.hasPaid,required this.product,required this.number,required this.paidAmount,required this.quantity,required this.rate});



  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      "date": this.date,
      "creditorName": this.creditors,
      "hasPaid":this.hasPaid,
      "paidAmount": this.paidAmount,
      "number": this.number,
      "product": this.product,
      "rate": this.rate,
      "quantity":this.quantity

    };

    return map;



  }




}

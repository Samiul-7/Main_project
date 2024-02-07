import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SuccessPage.dart';
import 'cart_page.dart';
typedef ClearListCallback = void Function();

class payment_page extends StatefulWidget {


  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<payment_page> {
  String selectedOption = '';
  String enteredPin = '';

  void _showSuccessPage() {
    if (enteredPin.length == 5) {
      CartModel cartModel = Provider.of<CartModel>(context, listen: false);

      // Call the clearList function
      cartModel.clearList();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()),
      );
    }
  }

  Widget _paymentOptionButton(String option, String imagePath) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedOption = option;
          enteredPin = '';
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlue, // Light blue background color
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 80,
          ),
          SizedBox(height: 8),
          Text(option),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        backgroundColor: Colors.green, // Green app bar color
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Payment Option:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _paymentOptionButton('bKash', 'assets/bkash.png'),
                    _paymentOptionButton('Nagad', 'assets/nagad.png'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _paymentOptionButton('PayPal', 'assets/paypal.png'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Selected Option: $selectedOption',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                if (selectedOption.isNotEmpty)
                  Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your PIN',
                        ),
                        onChanged: (value) {
                          setState(() {
                            enteredPin = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _showSuccessPage,
                        child: Text('Submit'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


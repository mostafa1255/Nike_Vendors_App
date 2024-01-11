import 'package:flutter/material.dart';

class VendorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nike Shoes Vendor'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Product Catalog',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Product Catalog Widget
            // Implement a widget to display the list of Nike shoes products

            SizedBox(height: 20),

            Text(
              'Order Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Order Management Widget
            // Implement a widget to display and manage incoming orders

            SizedBox(height: 20),

            Text(
              'Profile and Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Profile and Settings Widget
            // Implement a widget to view and edit vendor profile information
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
/**import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: RegisterAccountScreen()));
}

class RegisterAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Register Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Fill your details or continue with social media',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(height: 32),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Your Name',
                errorText: 'Please enter correct name',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                errorText: 'Please enter correct Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: 'Please enter correct Password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () {},
            ),
            SizedBox(height: 16),
            OutlinedButton.icon(
              icon: Image.asset('assets/google_icon.png', width: 24, height: 24), // Add your Google icon asset
              label: Text('Sign In with Google'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Already Have Account? Log In'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
 */
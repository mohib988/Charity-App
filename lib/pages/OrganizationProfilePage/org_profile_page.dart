// ignore: file_names
import 'package:flutter/material.dart';

import 'components/donation_button.dart';

class CharityOrganizationProfile extends StatelessWidget {
  final String imageUrl;
  final String mission;
  final String country;
  final String address;

  CharityOrganizationProfile({
    required this.imageUrl,
    required this.mission,
    required this.country,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charity Organization Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 220,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mission,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16),
                          SizedBox(width: 8),
                          Text(
                            '$country\n$address',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Lets say there is a pop-up on the screen that requires a user response in the form of clicking or tapping a button. We’ll regard this pop-up as the View in our diagram above \n The effect of clicking the button is the Action. This action is wrapped and sent to the Reducer, which processes the action and updates the data in the Store. The store then holds the State of the application, and the state detects this change in the value of the data. \n  Since the data rendered on your screen is managed by the state, this change in data is reflected in the View and the cycle continues.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DonationButton(
                  icon: Icons.monetization_on,
                  label: 'Donate Money',
                  onPressed: () {},
                ),
                DonationButton(
                  icon: Icons.fastfood,
                  label: 'Donate Food',
                  onPressed: () {},
                ),
                DonationButton(
                  icon: Icons.shopping_cart,
                  label: 'Donate Clothes',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

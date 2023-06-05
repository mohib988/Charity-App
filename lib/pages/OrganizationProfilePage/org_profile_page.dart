// ignore: file_names
import 'package:flutter/material.dart';

import '../../models/org.dart';
import 'actions/organization_profilepage_actions.dart';
import 'components/donation_button.dart';

class OrganizationProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charity Organization Profile'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadProfile(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            OrganizationInfo org = snapshot.data as OrganizationInfo;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      height: 300,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                org.image,
                                width: 220,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  child: Text('Mission Statement',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall),
                                ),
                                Text(org.mission,
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                                SizedBox(height: 8),
                                Container(
                                  margin: EdgeInsets.only(top: 100.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on, size: 16),
                                      SizedBox(width: 8),
                                      Text(
                                        '${org.country}  \n${org.address}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      height: 100,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text('Helping Hands. All rights reserved'),
                          )
                        ],
                      ),
                    ),
                  )
                ]);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

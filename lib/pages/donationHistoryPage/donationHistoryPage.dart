import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfilePage extends StatefulWidget {
  final String userName;
  final List<Donation> donations;

  const UserProfilePage({required this.userName, required this.donations});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    // Group donations by datetime values
    Map<String, List<Donation>> groupedDonations = {};
    for (var donation in widget.donations) {
      if (groupedDonations.containsKey(donation.dateTime)) {
        groupedDonations[donation.dateTime]!.add(donation);
      } else {
        groupedDonations[donation.dateTime] = [donation];
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.userName,
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily, // Set the font family
          ),
        ),
        backgroundColor: Colors.amber, // Set app bar color to amber
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Donation History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: groupedDonations.length,
              itemBuilder: (BuildContext context, int index) {
                final dateTime = groupedDonations.keys.toList()[index];
                final donationsForDateTime = groupedDonations[dateTime]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: donationsForDateTime.length,
                      itemBuilder: (BuildContext context, int index) {
                        final donation = donationsForDateTime[index];
                        final donationTitle = donation.title.toLowerCase();

                        // Map donation titles to corresponding images
                        final imageAsset = {
                          'clothes': 'images/clothes.png',
                          'money': 'images/money.png',
                          'food': 'images/food.png',
                        }[donationTitle];

                        return ListTile(
                          title: Text(donationTitle.toUpperCase()),
                          subtitle: Text(
                            'Date: ${donation.dateTime}',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          trailing: Image.asset(
                            imageAsset ?? 'assets/placeholder.png',
                            width: 48,
                            height: 48,
                          ),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Donation {
  final String title;
  final String dateTime;

  Donation({required this.title, required this.dateTime});
}

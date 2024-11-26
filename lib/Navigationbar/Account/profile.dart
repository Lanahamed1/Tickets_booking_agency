import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/controller.dart';
import 'package:flutter_tickets_booking_agency/token_manager.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isEditMode = false;
  late String token;
  late String userId; // Add userId
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String selectedMaritalStatus = 'single';
  String selectedOccupation = 'engineer';
  String? newSelectedMaritalStatus;
  String? newSelectedOccupation;

  final ProfileController profileController = ProfileController();

  @override
  void initState() {
    super.initState();
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    try {
      final Map<String, dynamic>? tokenMap = await TokenManager.getTokenMap();
      if (tokenMap == null) {
        throw Exception('Token not found. User is not authenticated.');
      }
      setState(() {
        token = tokenMap['access'].toString();
      });
    } catch (e) {
      print('Failed to retrieve token: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0XFFE1EDFF),
        elevation: 0.0,
        title: SizedBox(
          child: Container(
            margin: const EdgeInsets.only(top: 3),
            child: Text(
              "My Account",
              style: Styles.headLineStyle23,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 30),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 90,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: MaterialButton(
                color: const Color.fromARGB(255, 2, 146, 219),
                minWidth: 20,
                onPressed: () {
                  if (isEditMode) {
                    saveProfile();
                  } else {
                    setState(() {
                      isEditMode = !isEditMode;
                      newSelectedMaritalStatus = selectedMaritalStatus;
                      newSelectedOccupation = selectedOccupation;
                    });
                  }
                },
                child: Text(
                  isEditMode ? "Save Profile" : "Edit Profile",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "User details",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 34),
            buildTextField("First Name", firstNameController),
            const SizedBox(height: 30),
            buildTextField("Last Name", lastNameController),
            const SizedBox(height: 30),
            buildTextField("Email", emailController),
            const SizedBox(height: 30),
            buildTextField("Age", ageController),
            const SizedBox(height: 30),
            buildTextField("Address", addressController),
            const SizedBox(height: 30),
            buildTextField("Gender", genderController),
            const SizedBox(height: 25),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                label: const Text(
                  "Marital Status",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              value: isEditMode
                  ? newSelectedMaritalStatus ?? selectedMaritalStatus
                  : selectedMaritalStatus,
              items: ['single', 'married'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                if (isEditMode) {
                  setState(() {
                    newSelectedMaritalStatus = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                label: const Text(
                  "occupation",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              value: isEditMode
                  ? newSelectedOccupation ?? selectedOccupation
                  : selectedOccupation,
              items: [
                'entrepreneur',
                'engineer',
                'doctor',
                'teacher',
                'student',
                'employee',
                'artist',
                'other'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                if (isEditMode) {
                  setState(() {
                    newSelectedOccupation = value;
                  });
                }
              },
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool enabled = true}) {
    return TextFormField(
      controller: controller,
      enabled: enabled && isEditMode,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 30,
        ),
      ),
    );
  }

  Future<void> saveProfile() async {
    setState(() {
      selectedMaritalStatus = newSelectedMaritalStatus ?? selectedMaritalStatus;
      selectedOccupation = newSelectedOccupation ?? selectedOccupation;
      isEditMode = false;
    });

    try {
      final Map<String, dynamic>? tokenMap = await TokenManager.getTokenMap();
      if (tokenMap == null) {
        throw Exception('Token not found. User is not authenticated.');
      }
      final String accessToken = tokenMap['access'].toString();

      await profileController.saveProfile(
        token: accessToken,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        age: ageController.text,
        address: addressController.text,
        gender: genderController.text,
        maritalStatus: selectedMaritalStatus,
        occupation: selectedOccupation,
      );
    } catch (e) {
      print('Failed to save profile: $e');
    }
  }
}

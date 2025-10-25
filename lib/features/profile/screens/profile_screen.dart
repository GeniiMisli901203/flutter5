// lib/features/profile/screens/profile_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../state/app_state.dart';


class ProfileScreen extends StatelessWidget {
  final String studentName;
  final String studentClass;
  final String avatarUrl;
  final AppState appState;

  const ProfileScreen({
    required this.studentName,
    required this.studentClass,
    required this.avatarUrl,
    required this.appState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _showEditProfileDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                  imageUrl: 'https://yt3.googleusercontent.com/vgi-AL9ssRi0KYHfCgERa955Nm2q6gVbsFmDqQPhsptU4hgc1g3dyRazdc6wlefzLBrNlo9-MA=s900-c-k-c0x00ffffff-no-rj',
                imageBuilder: (context, imageProvider) => Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                    color: Colors.grey[300],
                  ),
                  child: Icon(Icons.person_outline, size: 60,color: Colors.blue),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                    color: Colors.grey[300],
                  ),
                  child: Icon(Icons.error_outline, size: 60, color: Colors.red),
                ),
              ),
              SizedBox(height: 32),
              // Имя ученика
              Text(
                studentName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Класс
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                ),
                child: Text(
                  'Класс: $studentClass',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 32),

              // Дополнительная информация
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildInfoRow('https://i.pinimg.com/736x/c2/16/d2/c216d2e11724197af3fa7414c47ea1a0.jpg', 'О себе', 'Я люблю есть печенье'),
                      SizedBox(height: 16),
                      _buildInfoRow('https://i.ytimg.com/vi/RIwUVygucO4/maxresdefault.jpg', 'Школа №123', 'С углубленным изучением математики'),
                      SizedBox(height: 16),
                      _buildInfoRow('https://storage.myseldon.com/news-pict-3c/3C8882CBFAE5963A29CDE6A320BB271E', 'Email', 'ivanov@school123.ru'),
                      SizedBox(height: 16),
                      _buildInfoRow('https://i.pinimg.com/originals/a1/ae/d9/a1aed90e81aca243355a45a092d35f3c.jpg', 'Телефон', '+7 (999) 123-45-67'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String url, String title, String subtitle) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 3),
                color: Colors.grey[300],
              ),
              child: Icon(Icons.person_outline, size: 60,color: Colors.blue),
            ),
            errorWidget: (context, url, error) => Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 3),
                color: Colors.grey[300],
              ),
              child: Icon(Icons.error_outline, size: 60, color: Colors.red),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    final profile = appState.studentProfile;

    TextEditingController nameController =
    TextEditingController(text: profile.name);
    TextEditingController classController =
    TextEditingController(text: profile.className);
    TextEditingController emailController =
    TextEditingController(text: profile.email);
    TextEditingController phoneController =
    TextEditingController(text: profile.phoneNumber);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Редактировать профиль'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextField(
              controller: classController,
              decoration: InputDecoration(labelText: 'Класс'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Телефон'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              appState.updateStudentProfile(
                name: nameController.text,
                className: classController.text,
                email: emailController.text,
                phoneNumber: phoneController.text,
              );
              Navigator.of(context).pop();
            },
            child: Text('Сохранить'),
          ),
        ],
      ),
    );
  }
}
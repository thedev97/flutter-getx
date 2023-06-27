import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class CandidateCard extends StatelessWidget {
  CandidateCard(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.avatar,
      required this.email
      }) : super(key: key);

  String firstName;
  String lastName;
  String avatar;
  String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: AppTextStyles.normalText2,
                  ),
                  const SizedBox(height: 8),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      email,
                      maxLines: 1,
                      style: AppTextStyles.normalText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.black.withOpacity(0.8),size: 15,),
        ],
      ),
    );
  }
}

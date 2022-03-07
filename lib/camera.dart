import 'package:flutter/material.dart';
import 'package:flutter_whatsapp/themes.dart';

class Camera extends StatelessWidget {
  const Camera({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueGreyColor,
      body: body(),
    );
  }

  Widget body() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          const Icon(Icons.keyboard_arrow_up_outlined, size: 30, color: kWhiteColor),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 75,
              child: Row(
                children: [1,2,3,4,5,6,7,8].map((e) {
                  return Container(
                    width: 75,
                    color: kLightGreyColor,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                  );
                }).toList()
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 75,
            child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.flash_off_rounded, color: kWhiteColor, size: 30)
                  ),
                ),
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 3,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.flip_camera_ios_rounded, color: kWhiteColor, size: 30)
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Hold for video, tap for photo', style: TextStyle(color: kWhiteColor)),
          ),
        ],
      ),
    );
  }
}

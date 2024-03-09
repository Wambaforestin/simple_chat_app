import 'package:flutter/material.dart';
import 'package:simple_chat_app/models/images_model.dart';
import 'package:simple_chat_app/repo/image_repository.dart';
import 'package:simple_chat_app/utils/brand_color.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final ImageRepository imageRepository = ImageRepository();
  NetworkImagePickerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelformImage>>(
      future: imageRepository.getNetworkImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.builder(
             itemCount: 7,
             itemBuilder: (context, index) {
               return  Center(
                 child: CircularProgressIndicator(
                   color: BrandColor.primaryColor,
                 ),
               );
             },
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               mainAxisSpacing: 2,
               mainAxisExtent: MediaQuery.of(context).size.height * 0.5,
             ),
           );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return Expanded(
            child: GridView.builder(
              itemCount: 7,
              // itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Image.network(snapshot.data![index].urlFullSize);
              },
              // the giridDelegate is used to define the layout of the grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          );
        }
      },
    );
  }
}

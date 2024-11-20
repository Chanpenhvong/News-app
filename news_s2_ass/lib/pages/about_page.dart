import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.star)],
        backgroundColor: Colors.white,
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              TeamMemberCard(
                imageUrl: "https://scontent.fpnh7-1.fna.fbcdn.net/v/t39.30808-1/448184396_1209649187070797_4458230802298569922_n.jpg?stp=dst-jpg_p200x200&_nc_cat=100&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeEZHkH1nj2gkT6GZ3jQJQBff_vza6YdpNJ_-_Nrph2k0oWWD0tIVk7kZ-WMx_nNjm6LO5eTatDZTrP0QyzHUM0N&_nc_ohc=aZD-Rostm2gQ7kNvgGjh3j4&_nc_ht=scontent.fpnh7-1.fna&oh=00_AYC3VR8ornLUj8f0uv9c0j-jfV3cZX6h0IRTv3V2A1ZhGQ&oe=6680892E",
                name: "Yoeurng Chanpenhvong",
                id: "B20221197",
              ),
              TeamMemberCard(
                imageUrl: "https://scontent.fpnh4-1.fna.fbcdn.net/v/t39.30808-1/437865125_1888748474884515_3078231814357314245_n.jpg?stp=cp6_dst-jpg_p200x200&_nc_cat=108&ccb=1-7&_nc_sid=50d2ac&_nc_eui2=AeF5nKMo30wmK9MhnzFBL5f9V-1lqOfS1z9X7WWo59LXPyp15qTwm-3bazQxKNbXONWla9_nF3jmVoFgWHTwLL6F&_nc_ohc=prIl-6ugZDsQ7kNvgGkajY3&_nc_ht=scontent.fpnh4-1.fna&oh=00_AYAoXxul5XKooKAS8XfhnLX-S3-whPewMMg6vlooqlk0sw&oe=667FF623",
                name: "Leuk Virapha",
                id: "B20221450",
              ),
              TeamMemberCard(
                imageUrl: "https://scontent.fpnh7-1.fna.fbcdn.net/v/t39.30808-1/433572079_927664539145195_4475476683911296130_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeG8_QTJbZpm7JY5vMdXfVel-44TCsxK_bb7jhMKzEr9to4TX03KEyZw-x0y6WG5UHT1qrYNuXmg2SppumiCI1Jf&_nc_ohc=UeMqWmDv1QEQ7kNvgGuJb4K&_nc_ht=scontent.fpnh7-1.fna&oh=00_AYAC2yahyRUPLsKBtGm_wld_AvHC06UIbBqO-Ty_TqYwtA&oe=6680B74E",
                name: "Song HongChray",
                id: "B20221754",
              ),
              TeamMemberCard(
                imageUrl: "https://scontent.fpnh4-1.fna.fbcdn.net/v/t39.30808-6/447989918_122150078186184939_3366217419697063037_n.jpg?stp=c0.23.206.206a_cp6_dst-jpg_p206x206&_nc_cat=101&ccb=1-7&_nc_sid=52bb43&_nc_eui2=AeEMSOHLdg4VzdtkI9UbEnvLMxpWQ7kGf9IzGlZDuQZ_0j2UuOky0PatYLDj6EGCDPKmbv-qrMNFCz8Hc0iQ2wez&_nc_ohc=-qNxbqbWgs8Q7kNvgFuTdnd&_nc_ht=scontent.fpnh4-1.fna&oh=00_AYBLjcSQkjcu13C8GCxD3ppcrjteIC9JhmaNHl8UtNcbCw&oe=667FE549",
                name: "KeatKong",
                id: "B20222129",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;

  TeamMemberCard({
    required this.imageUrl,
    required this.name,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "ID: $id",
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Make ID bold as well
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
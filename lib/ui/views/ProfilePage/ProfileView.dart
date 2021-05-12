import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jijiapp/ui/views/ProfilePage/ProfileViewModel.dart';
import 'package:jijiapp/ui/views/login/LoginView.dart';
import 'package:jijiapp/ui/widgets/AppBar.dart';
import 'package:jijiapp/ui/widgets/ListTile.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.user,
      builder: (context, model, child) {
        return model.user != null
            ? Scaffold(
                appBar: BaseAppBar(
                  appBar: AppBar(),
                  title: Text("My Profile"),
                ),
                body: SingleChildScrollView(
                  child: Column(children: [
                    if (model.user != null &&
                            model.user.userRole.contains("seller") ||
                        model.user.userRole.contains("buyer")) ...[
                      ProfileListTile(
                        title: Text(
                          model.user.name,
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[150],
                          child: ClipOval(
                            child: new SizedBox(
                                width: 100.0,
                                height: 100.0,
                                child: model.user.imageUrl == null
                                    ? Center(
                                        child: Icon(
                                        Icons.person_add,
                                        size: 80,
                                      ))
                                    : Hero(
                                        tag: model.user.imageUrl,
                                        child: CachedNetworkImage(
                                          imageUrl: model.user.imageUrl,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ))),
                          ),
                        ),
                      ),
                      ProfileListTile(
                        title: Text(
                          'Account Details',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        leading: Icon(Icons.info),
                        trailing: Text(
                          '>',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ProfileListTile(
                        title: Text(
                          'My Adverts  | 0',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        leading: Icon(Icons.card_membership),
                      ),
                      ProfileListTile(
                        title: Text(
                          'Customers  | 0',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        leading: Icon(Icons.person)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ProfileListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text(
                          'About My Market',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        trailing: Text(
                          '>',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          leading: Icon(Icons.logout),
                          onTap: () => model.signOut(),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            'Forget Password',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          leading: Icon(Icons.security),
                          onTap: () => model.forget(model.user.email),
                        ),
                      )
                    ] else if (model.user != null &&
                        model.user.userRole.contains("admin")) ...[
                      ProfileListTile(
                        title: Text(
                          "${model.user.name } (ADMIN)",
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            'Add Categories',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          leading: Icon(Icons.add_box_rounded),
                          onTap: () => model.naavigatetoCatScreen(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            'Add Sub-Categories',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          leading: Icon(Icons.add_box_rounded),
                          onTap: () => model.naavigatetoSubCatScreen(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            'Add Region',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          leading: Icon(Icons.add_box_rounded),
                          onTap: () => {
                            model.naavigatetoaddRegion()
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      ProfileListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          'Settings',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                        trailing: Text(
                          '>',
                          style: TextStyle(
                              color: Color(0xFF575E67),
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                color: Color(0xFF575E67),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          leading: Icon(Icons.logout),
                          onTap: () => model.signOut(),
                        ),
                      ),
                    ]
                  ]),
                ),
              )
            : LoginView();
      },
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}

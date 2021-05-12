import 'package:flutter/material.dart';

class ProfileListTile extends StatefulWidget {
  final Widget title;
  final Widget leading;
  final Widget trailing;
  final Function onTap;

  ProfileListTile({this.leading, this.title, this.trailing ,this.onTap});
  @override
  _ProfileListTileState createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: widget.leading,
        title: widget.title,
        trailing: widget.trailing,
        onTap: () => widget.onTap ,
      ),
    );
  }
}

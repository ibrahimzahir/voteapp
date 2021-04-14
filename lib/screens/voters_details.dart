import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/voters_list_provider.dart';
import '../util/const.dart';

class VotersDetails extends StatelessWidget {
  int _itemCount = 0;

  static const routeName = '/voters-detaillist';

  @override
  Widget build(BuildContext context) {
    final voterId = ModalRoute.of(context).settings.arguments as String;
    final loadedVoter = Provider.of<VList>(context).findById(voterId);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Vote App',
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Personal Details',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 180,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Constants.searchBarBG,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Name: ${loadedVoter.name}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'DOB: ${loadedVoter.dob}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'National ID: ${loadedVoter.nid}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Political view: ${loadedVoter.party}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Contact Details',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 150,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Constants.searchBarBG,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Address: ${loadedVoter.pAddress}',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Mobile: ${loadedVoter.mobile ?? 'No Mobile'}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Email: ${loadedVoter.email ?? 'No email'}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Cast Details',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 150,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Constants.searchBarBG,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ballot Box: ${loadedVoter.castBox}',
                                      style: TextStyle(
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        '${loadedVoter.castIsland}',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    InkWell(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFFCE4EC),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'PPM',
                                            style: TextStyle(
                                              color: Color(0xFFFF4081),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFFFECB3),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'MDP',
                                            style: TextStyle(
                                              color: Color(0xFFFFD740),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffEBECEF),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'NILL',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

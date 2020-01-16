import 'package:account_khata/authenticate/setupaccount.dart';
import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: new Text('Terms and Conditions'),
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.blue[900],),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context) =>SetupAccount()));
            }//=> Navigator.of(context).pop(),
        ),

        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        child:
        new Container(
          // margin: new EdgeInsets.only(top: 50.0),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: new Column(
                children: <Widget>[
                  new Text('Introduction',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('These Website Standard Terms and Conditions written on this webpage shall manage your'
                      ' use of our website,'
                      ' Webiste Name accessible at Website.com.'
                      'These Terms will be applied fully and affect to your use of this Website. By using this '
                      'Website, you agreed to accept all terms and conditions written in here. You must not use'
                      'this Website if you disagree with any of these Website Standard Terms andConditions.'
                      'Minors or people below 18 years old are not allowed to use this Website.'),
                  new Text('Intellectual Property Rights',style: TextStyle(fontWeight: FontWeight.bold)),

                  new Text('Other than the content you own, under these Terms, Company Name and/or its licensors'
                      ' own all the intellectual property rights and materials contained in this Website.'
                      'You are granted limited license only for purposes of viewing the material contained'
                      'on this Website.'),
                  new Text('Restrictions',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('You are specifically restricted from all of the following:'
                      ''
                      '1. publishing any Website material in any other media;'
                      '2. selling, sublicensing and/or otherwise commercializing any Website material;'
                      '3. publicly performing and/or showing any Website material;'
                      '4. using this Website in any way that is or may be damaging to this Website;'
                      '5. using this Website in any way that impacts user access to this Website;'
                      '6 .using this Website contrary to applicable laws and regulations, or in any way may cause'
                      'harm to the Website, or to any person or business entity;'
                      '7. engaging in any data mining, data harvesting, data extracting or any other similar activity'
                      'in relation to this Website;'
                      '8. using this Website to engage in any advertising or marketing.'
                      ''
                      'Certain areas of this Website are restricted from being access by you and Company Name may'
                      'further restrict access by you to any areas of this Website, at any time, in absolute'
                      'discretion. Any user ID and password you may have for this Website are confidential'
                      'and you must maintain confidentiality as well.'),
                  new Text('Your Content',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('In these Website Standard Terms and Conditions, “Your Content” shall mean any audio, '
                      'video text, images or other material you choose to display on this Website.'
                      ' By displaying Your Content, you grant Company Name a non-exclusive, worldwide irrevocable,'
                      'sub licensable license to use, reproduce, adapt, publish, translate and distribute it in'
                      'any and all media.'
                      ''
                      ' Your Content must be your own and must not be invading any third-partys'
                      ' rights. Company Name reserves the right to remove any of Your Content from this Website at'
                      ' any time without notice.'),
                  new Text('No warranties',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('This Website is provided “as is,” with all faults, and Company Name express no '
                      'representations or warranties, of any kind related to this Website or the materials '
                      'contained on this Website. Also, nothing contained on this Website shall be interpreted '
                      'as advising you.'),
                  new Text('Limitation of liability',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('In no event shall Company Name, nor any of its officers, directors and employees, '
                      'shall be held liable for anything arising out of or in any way connected with your use '
                      'of this Website whether such liability is under contract.  Company Name, including its '
                      'officers, directors and employees shall not be held liable for any indirect, consequential '
                      'or special liability arising out of or in any way related to your use of this Website.'),
                  new Text('Indemnification',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text(

                      'You hereby indemnify to the fullest extent Company Name from and against any and/or all '
                          'liabilities, costs, demands, causes of action, damages and expenses arising in any way '
                          'related to your breach of any of the provisions of these Terms.'),
                  new Text('Severability',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('If any provision of these Terms is found to be invalid under any applicable law, '
                      'such provisions shall be deleted without affecting the remaining provisions herein.'),
                  new Text('Variation of Terms',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('Company Name is permitted to revise these Terms at any time as it sees fit, '
                      'and by using this Website you are expected to review these Terms on a regular basis.'),
                  new Text('Assignment',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('The Company Name is allowed to assign, transfer, and subcontract its rights '
                      'and/or obligations under these Terms without any notification. However, you are '
                      'not allowed to assign, transfer, or subcontract any of your rights and/or obligations '
                      'under these Terms.'),
                  new Text('Entire Agreement',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('These Terms constitute the entire agreement between Company Name and you '
                      'in relation to your use of this Website, and supersede all prior agreements and '
                      'understandings.'),
                  new Text('Governing Law & Jurisdiction',style: TextStyle(fontWeight: FontWeight.bold)),
                  new Text('These Terms will be governed by and interpreted in accordance with the laws of '
                      'the State of Country, and you submit to the non-exclusive jurisdiction of the state'
                      ' and federal courts located in Country for the resolution of any disputes.'),


                ]
            ),
          ),
        ),
      ),
    );


  }
}

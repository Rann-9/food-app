part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user;
  File? pictureFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign Up",
      subtitle: "Find your best ever meal",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              XFile? pickedFile = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );

              if (pickedFile != null) {
                pictureFile = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
              width: 110,
              height: 110,
              margin: const EdgeInsets.only(
                top: 26,
              ),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/photo_border.png"),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: (pictureFile != null)
                        ? FileImage(pictureFile!)
                        : const AssetImage('assets/images/photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              26,
              defaultMargin,
              6,
            ),
            child: Text(
              "Name",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Type Your Name",
                hintStyle: greyFontStyle,
                border: InputBorder.none,
              ),
              style: blackFontStyle3,
              cursorColor: mainColor,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              10,
              defaultMargin,
              6,
            ),
            child: Text(
              "Email Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Type Your Email Address",
                hintStyle: greyFontStyle,
                border: InputBorder.none,
              ),
              style: blackFontStyle3,
              cursorColor: mainColor,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              10,
              defaultMargin,
              6,
            ),
            child: Text(
              "Password",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: "Type Your Password",
                hintStyle: greyFontStyle,
                border: InputBorder.none,
              ),
              style: blackFontStyle3,
              cursorColor: mainColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Already Have an Account?",
                    style: blackFontStyle3.copyWith(
                      color: greyColor,
                      decoration: TextDecoration.underline,
                      decorationColor: greyColor,
                      decorationThickness: 2,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: defaultMargin),
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text == "" ||
                          emailController.text == "" ||
                          passwordController.text == "") {
                        Get.snackbar(
                          "",
                          "",
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          backgroundColor: "D9435E".toColor(),
                          titleText: Text(
                            "Sign Un Failed",
                            style: blackFontStyle1,
                          ),
                          messageText: Text(
                            "Please fill all the field",
                            style: blackFontStyle3,
                          ),
                        );
                      } else if (pictureFile == null) {
                        Get.snackbar(
                          "",
                          "",
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          backgroundColor: "D9435E".toColor(),
                          titleText: Text(
                            "Please Select Your Picture",
                            style: blackFontStyle3,
                          ),
                          messageText: Text(
                            "We Need Your Profile Picture To Identify You",
                            style: blackFontStyle3,
                          ),
                        );
                      } else {
                        Get.to(() => AddressPage(
                          user: User(
                              name: nameController.text,
                              email: emailController.text),
                          password: passwordController.text,
                          pictureFile: pictureFile!,
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: blackFontStyle3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
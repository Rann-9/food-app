part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Sign In",
      subtitle: "Find your best ever meal",
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(
              defaultMargin,
              26,
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
                    Get.to(() => const SignUpPage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    "Create an Account",
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
                  child: isLoading
                      ? loadingIndicator
                      : ElevatedButton(
                    onPressed: () async {
                      if (emailController.text == "" ||
                          passwordController.text == "") {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: "D9435E".toColor(),
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            "Sign In Failed",
                            style: blackFontStyle3,
                          ),
                          messageText: Text(
                            "Please fill all the fields",
                            style: blackFontStyle3,
                          ),
                        );
                      } else {
                        setState(() {
                          isLoading = true;
                        });

                        await context.read<UserCubit>().signIn(
                          emailController.text,
                          passwordController.text,
                        );
                        UserState state = context.read<UserCubit>().state;

                        if (state is UserLoaded) {
                          context.read<FoodCubit>().getFoods();
                          context
                              .read<TransactionCubit>()
                              .getTransactions();

                          Get.to(() => MainPage());
                        } else {
                          Get.snackbar(
                            "",
                            "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: mainColor,
                            ),
                            titleText: Text(
                              "Sign In Failed",
                              style: blackFontStyle3,
                            ),
                            messageText: Text(
                              "Please try again later",
                              style: blackFontStyle3,
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Sign In",
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
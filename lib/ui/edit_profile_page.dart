part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    nameController.text =
        (context.read<UserCubit>().state as UserLoaded).user.name!;
    phoneNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.phoneNumber!;
    houseNumberController.text =
        (context.read<UserCubit>().state as UserLoaded).user.houseNumber!;
    addressController.text =
        (context.read<UserCubit>().state as UserLoaded).user.address!;
    cityController.text =
        (context.read<UserCubit>().state as UserLoaded).user.city!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              // Name
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  26,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Change Name",
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
              // Phone Number
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Phone Number",
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
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    hintText: "Change Phone Number",
                    hintStyle: greyFontStyle,
                    border: InputBorder.none,
                  ),
                  style: blackFontStyle3,
                  cursorColor: mainColor,
                ),
              ),
              // House Number
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "House Number",
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
                  controller: houseNumberController,
                  decoration: InputDecoration(
                    hintText: "Change House Number",
                    hintStyle: greyFontStyle,
                    border: InputBorder.none,
                  ),
                  style: blackFontStyle3,
                  cursorColor: mainColor,
                ),
              ),
              // Address
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "Address",
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
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Change Address",
                    hintStyle: greyFontStyle,
                    border: InputBorder.none,
                  ),
                  style: blackFontStyle3,
                  cursorColor: mainColor,
                ),
              ),
              // City
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(
                  defaultMargin,
                  10,
                  defaultMargin,
                  6,
                ),
                child: Text(
                  "City",
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
                  controller: cityController,
                  decoration: InputDecoration(
                    hintText: "Change City",
                    hintStyle: greyFontStyle,
                    border: InputBorder.none,
                  ),
                  style: blackFontStyle3,
                  cursorColor: mainColor,
                ),
              ),
              // Save Profile
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    child: (isLoading == true)
                        ? loadingIndicator
                        : ElevatedButton(
                      onPressed: (){

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "save profile",
                        style: blackFontStyle3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

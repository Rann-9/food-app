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
            child: Column(
          children: [],
        )),
      ),
    );
  }
}

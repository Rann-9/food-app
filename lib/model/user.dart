part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  User copyWith({
    required int id,
    required String name,
    required String email,
    required String address,
    required String houseNumber,
    required String phoneNumber,
    required String city,
    required String picturePath,
  }) {
    return User(
      id :id ?? this.id,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        address,
        houseNumber,
        phoneNumber,
        city,
        picturePath,
      ];
}

User mockUser = User(
  id: 1,
  name: 'Musalim Ucup',
  email: 'ucupweb@gmail.com',
  address: 'Jl, Setiabudi No. 193',
  houseNumber: 'A2',
  phoneNumber: '081234567891',
  city: 'Bandung',
  picturePath: 'https://i.pinimg.com/736x/03/9e/f1/039ef1bc79b85a19f2764eba07426674.jpg',
);

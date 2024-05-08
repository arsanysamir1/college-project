import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled3/moduls.dart';
class databaseService {
  final String uid;
  final myUser = FirebaseFirestore.instance.collection("MyUser");
  final hotel = FirebaseFirestore.instance.collection("hotel");

  databaseService({required this.uid});

  Future addNewUser(String? firstName, lastName, userName, email,
      phoneNum, location, adult, kids, kidsAge, rooms, startDate, endDate,
      carSameLocation, carPickLocation, carDropLocation,
      carStartDate, carEndDate, carStartHour, carEndHour, flightPick,
      flightDrop, int age) async {
    return await myUser.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNum': phoneNum,
      'age': age,
      'location': location,
      'adult': adult,
      'kids': kids,
      'kidsAge': kidsAge,
      'rooms': rooms,
      'startDate': startDate,
      'endDate': endDate,
      'carSameLocation': carSameLocation,
      'carPickLocation': carPickLocation,
      'carDropLocation': carDropLocation,
      'carStartDate': carStartDate,
      'carEndDate': carEndDate,
      'carStartHour': carStartHour,
      'carEndHour': carEndHour,
      'flightPick': flightPick,
      'flightDrop': flightDrop,

    });
  }

  int num = 0;

  Future addUserComment(String? postName, comment) {
    return myUser.doc(uid).collection('Comment ${num}')
        .doc('Comment ${num++}')
        .set({
      'Post Name': postName,
      'comment': comment,
    });
  }

  Future addHotelComment(String? postName, comment) {
    return hotel.doc(uid).collection('Comment ${num}')
        .doc('Comment ${num++}')
        .set({
      'Post Name': postName,
      'comment': comment,
    });
  }

  Future addNewHotel(String? hotelName,homePic , price, rating, views, publisher,
      country, city, roomNum, offer,availableDuration, location, singleBedNum,
      doubleBedNum) async {
    return await hotel.doc(uid).set({
      'hotelName': hotelName,
      'homePic': homePic,
      'price': price,
      'rating': rating,
      'views': views,
      'offer': offer,
      'location': [country, city],
      'availableDuration': availableDuration,
      'roomNum': roomNum,
      'singleBedNum': singleBedNum,
      'doubleBedNum': doubleBedNum,
      'publisher': publisher,
    });
  }

  Future addToSave(String? homePic,hotelName, price,country,city ) async {
    return await hotel.doc(uid).set({
      'hotelName': hotelName,
      'homePic': homePic,
      'price': price,
      'country': country,
      'city': city,
    });
  }
}
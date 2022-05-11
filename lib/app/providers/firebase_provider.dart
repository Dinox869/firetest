import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firetest/app/model/weight_model.dart';
import 'package:firetest/common/ui.dart';
import 'package:get/get.dart';

class FireBaseProvider {
  Future<void> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  Future<void> push(Weight weight, int index) async {
    try {
      await FirebaseFirestore.instance
          .collection("weights")
          .doc('$index')
          .set(weight.toJson())
          .then((value) => Get.showSnackbar(
              Ui.SuccessSnackBar(message: "Saved Successful.")));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Get.showSnackbar(Ui.ErrorSnackBar(
              message: "Anonymous auth hasn't been enabled for this project."));
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          Get.showSnackbar(Ui.ErrorSnackBar(message: "Unkown error."));
          print("Unkown error.");
      }
    }
  }

  Future<void> update(Weight weight, int index) async {
    try {
      FirebaseFirestore.instance
          .collection("weights")
          .doc('$index')
          .update(weight.toJson())
          .then(((value) => Get.showSnackbar(
              Ui.SuccessSnackBar(message: "Update Successful."))));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Get.showSnackbar(Ui.ErrorSnackBar(
              message: "Anonymous auth hasn't been enabled for this project."));
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          Get.showSnackbar(Ui.ErrorSnackBar(message: "Unkown error."));
          print("Unkown error.");
      }
    }
  }

  Future<void> delete(int index) async {
    try {
      FirebaseFirestore.instance
          .collection("weights")
          .doc('$index')
          .delete()
          .then(((value) => Get.showSnackbar(
              Ui.SuccessSnackBar(message: "Delete Successful."))));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Get.showSnackbar(Ui.ErrorSnackBar(
              message: "Anonymous auth hasn't been enabled for this project."));
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          Get.showSnackbar(Ui.ErrorSnackBar(message: "Unkown error."));
          print("Unkown error.");
      }
    }
  }

  Future<List<Weight>> fetchAll() async {
    try {
      List<Weight> weights = [];
      await FirebaseFirestore.instance.collection("weights").get().then((res) =>
          res.docs.forEach((element) => weights.add(Weight(
              id: element.id,
              weight: element.data()['weight'],
              time: element.data()['time']))));
      return weights;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Get.showSnackbar(Ui.ErrorSnackBar(
              message: "Anonymous auth hasn't been enabled for this project."));
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          Get.showSnackbar(Ui.ErrorSnackBar(message: "Unkown error."));
          print("Unkown error.");
      }
      return [];
    }
  }
}

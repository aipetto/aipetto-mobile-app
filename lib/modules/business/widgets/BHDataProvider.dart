import 'dart:core';

import 'package:aipetto/modules/business/models/businessGeneralModel.dart';
import 'package:flutter/material.dart';

import 'BHConstants.dart';
import 'BHImages.dart';

List<BHBestSpecialModel> getSpecialList() {
  List<BHBestSpecialModel> list = List<BHBestSpecialModel>();
  list.add(BHBestSpecialModel(
      title: 'Dale Horward',
      subTitle: 'Hire Stylist',
      img: BHDashedBoardImage1));
  list.add(BHBestSpecialModel(
      title: 'willies carpen', subTitle: 'Barber', img: BHDashedBoardImage6));
  list.add(BHBestSpecialModel(
      title: 'Dale Horward',
      subTitle: 'Makeup Artist',
      img: BHDashedBoardImage3));
  list.add(BHBestSpecialModel(
      title: 'Joseph Drake',
      subTitle: 'Makeup Artist',
      img: BHDashedBoardImage3));
  list.add(BHBestSpecialModel(
      title: 'willies carpen', subTitle: 'Barber', img: BHDashedBoardImage1));
  list.add(BHBestSpecialModel(
      title: 'Dale Horward',
      subTitle: 'Makeup Artist',
      img: BHDashedBoardImage6));

  return list;
}

List<BHBestSpecialModel> getSpecialNewList() {
  List<BHBestSpecialModel> list = List<BHBestSpecialModel>();
  list.add(BHBestSpecialModel(
      title: 'Dale Horward',
      subTitle: 'Hire Stylist',
      img: BHDashedBoardImage1));
  list.add(BHBestSpecialModel(
      title: 'willies carpen', subTitle: 'Barber', img: BHDashedBoardImage6));
  list.add(BHBestSpecialModel(
      title: 'Dale Horward',
      subTitle: 'Makeup Artist',
      img: BHDashedBoardImage3));
  list.add(BHBestSpecialModel(
      title: 'Dale Horward',
      subTitle: 'Hire Stylist',
      img: BHDashedBoardImage2));
  list.add(BHBestSpecialModel(
      title: 'willies carpen', subTitle: 'Barber', img: BHDashedBoardImage6));
  return list;
}

List<BHSpecialOfferModel> getSpecialOfferList() {
  List<BHSpecialOfferModel> specialOfferList = List<BHSpecialOfferModel>();
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage3,
      title: 'Sherman Hair ',
      subtitle: 'Cool Winter Event'));
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage6,
      title: 'Drake Hair Salon',
      subtitle: 'Cool Winter Event'));
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage1,
      title: 'Joseph Drake',
      subtitle: 'Cool Winter Event'));
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage6,
      title: 'Joseph Hair ',
      subtitle: 'Cool Winter Event'));
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage6,
      title: 'Drake Hair ',
      subtitle: 'Cool Winter Event'));
  return specialOfferList;
}

List<BHSpecialOfferModel> getSpecialOfferNewList() {
  List<BHSpecialOfferModel> specialOfferList = List<BHSpecialOfferModel>();
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage3,
      title: 'Sherman Barber Hair Salon',
      subtitle: 'Cool Winter Event'));
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage6,
      title: 'Joseph Drake Hair Salon',
      subtitle: 'Cool Winter Event'));
  specialOfferList.add(BHSpecialOfferModel(
      img: BHDashedBoardImage1,
      title: 'Joseph Drake Hair Salon',
      subtitle: 'Cool Winter Event'));
  return specialOfferList;
}

List<MessageModel> getMessageList() {
  List<MessageModel> messageList = List<MessageModel>();
  messageList.add(MessageModel(
      img: BHDashedBoardImage3,
      name: 'Sherman Barber Shop',
      message: 'Hi Jackson..',
      lastSeen: 'Now'));
  messageList.add(MessageModel(
      img: BHDashedBoardImage2,
      name: 'Dale Horward',
      message: 'Thank you.',
      lastSeen: '8:30 AM'));
  messageList.add(MessageModel(
      img: BHDashedBoardImage6,
      name: 'Norah Beauty Salon',
      message: 'Hello',
      lastSeen: 'Yesterday'));
  return messageList;
}

List<BHCallModel> getCallList() {
  List<BHCallModel> callList = List<BHCallModel>();
  callList.add(
    BHCallModel(
      img: BHDashedBoardImage3,
      name: 'Sherman Barber Shop',
      callImg: Icons.call,
      callStatus: 'You call them',
      videoCallIcon: BHVideoCallIcon,
      audioCallIcon: BHCallIcon,
    ),
  );
  callList.add(
    BHCallModel(
      img: BHDashedBoardImage1,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: BHVideoCallIcon,
      audioCallIcon: BHCallIcon,
    ),
  );
  callList.add(
    BHCallModel(
      img: BHDashedBoardImage6,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: BHVideoCallIcon,
      audioCallIcon: BHCallIcon,
    ),
  );
  return callList;
}

List<BHGalleryModel> getGalleryList() {
  List<BHGalleryModel> galleryList = List<BHGalleryModel>();
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage1));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage2));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage3));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage6));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage2));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage6));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage2));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage3));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage6));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage1));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage3));
  galleryList.add(BHGalleryModel(img: BHDashedBoardImage1));
  return galleryList;
}

List<BHCategoryModel> getCategory() {
  List<BHCategoryModel> categoryList = List<BHCategoryModel>();
  categoryList.add(
      BHCategoryModel(img: BHGrooming, categoryName: 'Cuidados estéticos'));
  categoryList
      .add(BHCategoryModel(img: BHVetServices, categoryName: 'Veterinaria'));
  categoryList
      .add(BHCategoryModel(img: BHTransport, categoryName: 'Transporte'));

  return categoryList;
}

List<BHOfferModel> getOfferList() {
  List<BHOfferModel> offerList = List<BHOfferModel>();
  offerList.add(
    BHOfferModel(
        img: BHDashedBoardImage1,
        offerName: 'Promoción Reserva baño y check-up médico completo',
        offerDate: 'Agosto 15 - Agosto 31',
        offerOldPrice: 1200,
        offerNewPrice: 900),
  );
  return offerList;
}

List<BHServicesModel> getServicesList() {
  List<BHServicesModel> servicesList = List<BHServicesModel>();
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage1,
      serviceName: 'Vacuna antirrábica',
      time: '30 Min',
      price: 400,
      radioVal: 2));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage3,
      serviceName: 'Microchip',
      time: '30 Min',
      price: 600,
      radioVal: 3));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage1,
      serviceName: 'Service 3',
      time: '30 Min',
      price: 400,
      radioVal: 4));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage3,
      serviceName: 'Service 4',
      time: '30 Min',
      price: 600,
      radioVal: 5));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage1,
      serviceName: 'Service 5',
      time: '30 Min',
      price: 400,
      radioVal: 6));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage3,
      serviceName: 'Service 6',
      time: '30 Min',
      price: 600,
      radioVal: 7));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage1,
      serviceName: 'Service 7',
      time: '30 Min',
      price: 400,
      radioVal: 8));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage3,
      serviceName: 'Service 8',
      time: '30 Min',
      price: 600,
      radioVal: 9));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage1,
      serviceName: 'Service 9',
      time: '30 Min',
      price: 400,
      radioVal: 10));
  servicesList.add(BHServicesModel(
      img: BHDashedBoardImage3,
      serviceName: 'Service 10',
      time: '30 Min',
      price: 600,
      radioVal: 11));
  return servicesList;
}

List<BHIncludeServiceModel> getIncludeServicesList() {
  List<BHIncludeServiceModel> servicesList = List<BHIncludeServiceModel>();
  servicesList.add(BHIncludeServiceModel(
      serviceImg: BHDashedBoardImage1,
      serviceName: 'Vacuna antirrábica',
      time: '30 Min',
      price: 400));
  servicesList.add(BHIncludeServiceModel(
      serviceImg: BHDashedBoardImage3,
      serviceName: 'Microchip',
      time: '30 Min',
      price: 600));
  return servicesList;
}

List<BHReviewModel> getReviewList() {
  List<BHReviewModel> reviewList = List<BHReviewModel>();
  reviewList.add(BHReviewModel(
      img: BHDashedBoardImage1,
      name: 'Carlos Day',
      rating: 4.5,
      day: '4 Day ago',
      review: BHReview));
  reviewList.add(BHReviewModel(
      img: BHUserImg,
      name: 'Sherman',
      rating: 2.5,
      day: '10 Day ago',
      review: BHReview));
  reviewList.add(BHReviewModel(
      img: BHUserImg,
      name: 'Dale Horward',
      rating: 4,
      day: '1 Day ago',
      review: BHReview));
  reviewList.add(BHReviewModel(
      img: BHUserImg,
      name: 'Carlos Day',
      rating: 3.5,
      day: '3 Day ago',
      review: BHReview));
  return reviewList;
}

List<BHHairStyleModel> getHairStyleList() {
  List<BHHairStyleModel> hairStyleList = List<BHHairStyleModel>();
  hairStyleList
      .add(BHHairStyleModel(img: BHDashedBoardImage2, name: 'Carlos Sherman'));
  hairStyleList
      .add(BHHairStyleModel(img: BHDashedBoardImage6, name: 'Dale Horward'));
  hairStyleList
      .add(BHHairStyleModel(img: BHDashedBoardImage1, name: 'Sherman'));
  return hairStyleList;
}

List<BHGroomingModel> getMakeupList() {
  List<BHGroomingModel> makeupList = List<BHGroomingModel>();
  makeupList
      .add(BHGroomingModel(img: BHDashedBoardImage3, name: 'willies carpen'));
  makeupList
      .add(BHGroomingModel(img: BHDashedBoardImage1, name: 'willies carpen'));
  return makeupList;
}

List<BHNotificationModel> getNotificationList() {
  List<BHNotificationModel> notificationList = List<BHNotificationModel>();
  notificationList.add(BHNotificationModel(
      img: BHDashedBoardImage6,
      name: 'Sherman Shop',
      msg: 'Hi Jackson..',
      status: 'Just Now',
      callInfo: BHCallIcon));
  notificationList.add(BHNotificationModel(
      img: BHDashedBoardImage2,
      name: 'Dale Horward',
      msg: 'Thank you.',
      status: '8:30 AM',
      callInfo: BHMessage));
  notificationList.add(BHNotificationModel(
      img: BHDashedBoardImage3,
      name: 'Norah  Salon',
      msg: 'Hello',
      status: 'Yesterday',
      callInfo: BHCallIcon));
  return notificationList;
}

List<BHNotifyModel> getNotifyList() {
  List<BHNotifyModel> notifyList = List<BHNotifyModel>();
  notifyList.add(
    BHNotifyModel(
        img: BHDashedBoardImage1,
        name: 'Sherman Barber Shop',
        address: 'Rua Independencia 123, Contagem - MG - Brasil',
        rating: 3.5,
        distance: 14.2),
  );
  notifyList.add(
    BHNotifyModel(
        img: BHDashedBoardImage3,
        name: 'willies carpen',
        address: 'Rua Independencia 123, Contagem - MG -Brasil',
        rating: 2.0,
        distance: 10.0),
  );
  notifyList.add(
    BHNotifyModel(
        img: BHDashedBoardImage6,
        name: 'Dale Horward',
        address: 'Rua Independencia 123, Contagem - MG - Brasil',
        rating: 3.5,
        distance: 11.0),
  );
  return notifyList;
}

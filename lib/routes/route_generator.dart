import 'package:aipetto/modules/auth/pages/forgot_password_page.dart';
import 'package:aipetto/modules/auth/pages/login_page.dart';
import 'package:aipetto/modules/business/pages/business_profile_page.dart';
import 'package:aipetto/modules/business/pages/my_favorite_businesses_list_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/appointment_detail_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/filter/filter_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step1/choose_service_to_reserve_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step2/choose_business_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step3/time_slot_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step4/reservation_customer_details_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/booking/step5/appointment_booked_page.dart';
import 'package:aipetto/modules/businessServiceReservation/pages/my_appointments_page.dart';
import 'package:aipetto/modules/exam/pages/visit_detail_page.dart';
import 'package:aipetto/modules/geolocation/pages/acccess_gps_page.dart';
import 'package:aipetto/modules/geolocation/pages/address_search_page.dart';
import 'package:aipetto/modules/geolocation/pages/loading_page.dart';
import 'package:aipetto/modules/home/component/home.dart';
import 'package:aipetto/modules/i18n/pages/change_laguage_page.dart';
import 'package:aipetto/modules/message/pages/messages_detail_page.dart';
import 'package:aipetto/modules/notification/pages/notification_settings_page.dart';
import 'package:aipetto/modules/notification/pages/notifications_page.dart';
import 'package:aipetto/modules/onboarding/widgets/OnBoardingPage.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/pages/add_new_pet_page.dart';
import 'package:aipetto/modules/pet/pages/choose_pet_type.dart';
import 'package:aipetto/modules/pet/pages/edit_profile_page.dart';
import 'package:aipetto/modules/pet/pages/pet_profile_page.dart';
import 'package:aipetto/modules/pet/pages/pets_page.dart';
import 'package:aipetto/modules/petType/models/pet_type.dart';
import 'package:aipetto/modules/prescription/pages/prescription_detail_page.dart';
import 'package:aipetto/modules/settings/pages/settings_page.dart';
import 'package:aipetto/modules/signup/pages/signup_page.dart';
import 'package:aipetto/modules/user/pages/edit_user_profile_page.dart';
import 'package:aipetto/modules/veterinarian/pages/my_veterinarian_list_page.dart';
import 'package:aipetto/modules/veterinarian/pages/veterinarian_profile_page.dart';
import 'package:aipetto/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (_) => SplashPage());

      case Routes.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());

      case Routes.petProfile:
        final args = settings.arguments as PetSelected;
        return CupertinoPageRoute(
            builder: (BuildContext context) => PetProfilePage(pet: args.pet));

      case Routes.signup:
        return CupertinoPageRoute(builder: (_) => SignupPage());

      case Routes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => ForgotPasswordPage());

      case Routes.home:
        return CupertinoPageRoute(builder: (BuildContext context) => Home());

      case Routes.filter:
        return CupertinoPageRoute(
          builder: (_) => FilterPage(),
          fullscreenDialog: true,
        );

      case Routes.categories:
        return CupertinoPageRoute(
          builder: (BuildContext context) => ChooseServiceToReservePage(),
          fullscreenDialog: true,
        );

      case Routes.bookingStep1FindPlacesNearby:
        return CupertinoPageRoute(
            builder: (BuildContext context) => ChooseBusinessPlacePage());

      case Routes.onboarding:
        return CupertinoPageRoute(
            builder: (BuildContext context) => OnBoardingPage());

      case Routes.bookingStep2DetailsOfPlace:
        return CupertinoPageRoute(
            builder: (BuildContext context) => BusinessProfilePage());

      case Routes.bookingStep3ServiceAvailability:
        return CupertinoPageRoute(
            builder: (BuildContext context) => TimeSlotPage());

      case Routes.bookingStep4ReservationDetails:
        return CupertinoPageRoute(
            builder: (BuildContext context) =>
                ReservationCustomerDetailsPage()); // TODO receive args parameters

      /// AppointmentBookedPage()

      case Routes.bookingStepConfirmation:
        return CupertinoPageRoute(builder: (_) => AppointmentBookedPage());

      case Routes.businessProfile:
        return CupertinoPageRoute(builder: (_) => BusinessProfilePage());

      case Routes.addNewPet:
        final args = settings.arguments as PetTypeSelected;
        return CupertinoPageRoute(
            builder: (BuildContext context) =>
                AddNewPetPage(petTypeId: args.id, petTypeName: args.name),
            fullscreenDialog: true);

      case Routes.appointmentDetail:
        return CupertinoPageRoute(builder: (_) => AppointmentDetailPage());

      case Routes.visitDetail:
        return CupertinoPageRoute(builder: (_) => VisitDetailPage());

      case Routes.prescriptionDetail:
        return CupertinoPageRoute(builder: (_) => PrescriptionDetailPage());

      case Routes.chatDetail:
        return CupertinoPageRoute(
            builder: (BuildContext context) => MessagesDetailPage());

      case Routes.veterinarianProfile:
        return CupertinoPageRoute(builder: (_) => VeterinarianProfilePage());

      case Routes.editPetProfile:
        return CupertinoPageRoute(builder: (_) => EditPetProfilePage());

      case Routes.editUserProfile:
        return CupertinoPageRoute(builder: (_) => EditUserProfilePage());

      case Routes.myPets:
        return CupertinoPageRoute(
            builder: (BuildContext context) => MyPetsListPage());

      case Routes.changeLanguage:
        return CupertinoPageRoute(
            builder: (BuildContext context) => ChangeLanguagePage());

      case Routes.notificationSettings:
        return CupertinoPageRoute(
            builder: (BuildContext context) => NotificationSettingsPage());

      case Routes.appSettings:
        return CupertinoPageRoute(builder: (_) => SettingsPage());

      case Routes.myVeterinarians:
        return CupertinoPageRoute(builder: (_) => MyVeterinarianListPage());

      case Routes.myFavoriteBusinesses:
        return CupertinoPageRoute(
            builder: (_) => MyFavoriteBusinessessListPage());

      case Routes.myAppointments:
        return CupertinoPageRoute(
            builder: (BuildContext context) => MyAppointmentsPage());

      case Routes.accessGPS:
        return CupertinoPageRoute(
            builder: (BuildContext context) => AccessGPSPage());

      case Routes.choosePetType:
        return TransparentRoute(
            builder: (BuildContext context) => ChoosePetTypePage());

      case Routes.addressSearch:
        return CupertinoPageRoute(
            builder: (BuildContext context) => AddressSearchPage());

      case Routes.loading:
        return CupertinoPageRoute(
            builder: (BuildContext context) => LoadingPage());

      case Routes.notifications:
        return CupertinoPageRoute(
          builder: (_) => NotificationsPage(),
          fullscreenDialog: true,
          maintainState: true,
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

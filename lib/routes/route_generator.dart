import 'package:aipetto/model/pet_type/pet_type.dart';
import 'package:aipetto/pages/access_gps/acccess_gps_page.dart';
import 'package:aipetto/pages/access_gps/address_search_page.dart';
import 'package:aipetto/pages/access_gps/loading_page.dart';
import 'package:aipetto/pages/booking/step2/choose_business_page.dart';
import 'package:aipetto/pages/business/business_profile_page.dart';
import 'package:aipetto/pages/business/my_favorite_businesses_list_page.dart';
import 'package:aipetto/pages/categories/categories_page.dart';
import 'package:aipetto/pages/pets/choose_pet_type.dart';
import 'package:aipetto/pages/pets/edit_profile_page.dart';
import 'package:aipetto/pages/veterinarian/my_veterinarian_list_page.dart';
import 'package:aipetto/pages/pets/add_new_pet_page.dart';
import 'package:aipetto/pages/pets/pets_page.dart';
import 'package:aipetto/pages/pets/pet_profile_page.dart';
import 'package:aipetto/pages/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/appointment/appointment_detail_page.dart';
import '../pages/appointment/my_appointments_page.dart';
import '../pages/booking/filter/filter_page.dart';
import '../pages/booking/step2/choose_business_page.dart';
import '../pages/booking/step3/time_slot_page.dart';
import '../pages/booking/step4/reservation_customer_details_page.dart';
import '../pages/booking/step5/appointment_booked_page.dart';
import '../pages/veterinarian/veterinarian_profile_page.dart';
import '../pages/veterinarian/my_veterinarian_list_page.dart';
import '../pages/forgot/forgot_password_page.dart';
import '../pages/home/home.dart';
import '../pages/language/change_laguage_page.dart';
import '../pages/login/login_page.dart';
import '../pages/messages/messages_detail_page.dart';
import '../pages/notifications/notification_settings_page.dart';
import '../pages/notifications/notifications_page.dart';
import '../pages/prescription/prescription_detail_page.dart';
import '../pages/user_profile/edit_user_profile_page.dart';
import '../pages/signup/signup_page.dart';
import '../pages/splash_page.dart';
import '../pages/visit/visit_detail_page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute(builder: (_) => SplashPage());

      case Routes.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());

      case Routes.petProfile:
        return CupertinoPageRoute(builder: (_) => PetProfilePage());

      case Routes.signup:
        return CupertinoPageRoute(builder: (_) => SignupPage());

      case Routes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => ForgotPasswordPage());

      case Routes.home:
        return CupertinoPageRoute(builder: (_) => Home());

      case Routes.filter:
        return CupertinoPageRoute(
          builder: (_) => FilterPage(),
          fullscreenDialog: true,
        );

      case Routes.categories:
        return CupertinoPageRoute(
          builder: (_) => CategoriesPage(),
          fullscreenDialog: true,
        );

      case Routes.bookingStep1FindPlacesNearby:
        return CupertinoPageRoute(builder: (_) => ChooseBusinessPlacePage());

      case Routes.bookingStep2DetailsOfPlace:
        return CupertinoPageRoute(builder: (_) => BusinessProfilePage());

      case Routes.bookingStep3ServiceAvailability:
        return CupertinoPageRoute(builder: (_) => TimeSlotPage());

      case Routes.bookingStep4ReservationDetails:
        return CupertinoPageRoute(builder: (_) => ReservationCustomerDetailsPage());

      /// AppointmentBookedPage()

      case Routes.bookingStepConfirmation:
        return CupertinoPageRoute(builder: (_) => AppointmentBookedPage());

      case Routes.businessProfile:
        return CupertinoPageRoute(builder: (_) => BusinessProfilePage());

      case Routes.addNewPet:
        final args = settings.arguments as PetTypeSelected;
        return CupertinoPageRoute(
            builder: (_) => AddNewPetPage(
              petTypeId: args.id,
              petTypeName: args.name
            ),
            fullscreenDialog: true
        );

      case Routes.appointmentDetail:
        return CupertinoPageRoute(builder: (_) => AppointmentDetailPage());

      case Routes.visitDetail:
        return CupertinoPageRoute(builder: (_) => VisitDetailPage());

      case Routes.prescriptionDetail:
        return CupertinoPageRoute(builder: (_) => PrescriptionDetailPage());

      case Routes.chatDetail:
        return CupertinoPageRoute(builder: (_) => MessagesDetailPage());

      case Routes.veterinarianProfile:
        return CupertinoPageRoute(builder: (_) => VeterinarianProfilePage());

      case Routes.editPetProfile:
        return CupertinoPageRoute(builder: (_) => EditPetProfilePage());

      case Routes.editUserProfile:
        return CupertinoPageRoute(builder: (_) => EditUserProfilePage());

      case Routes.myPets:
        return CupertinoPageRoute(builder: (_) => MyPetsListPage());

      case Routes.changeLanguage:
        return CupertinoPageRoute(builder: (_) => ChangeLanguagePage());

      case Routes.notificationSettings:
        return CupertinoPageRoute(builder: (_) => NotificationSettingsPage());

      case Routes.appSettings:
        return CupertinoPageRoute(builder: (_) => SettingsPage());

      case Routes.myVeterinarians:
        return CupertinoPageRoute(builder: (_) => MyVeterinarianListPage());

      case Routes.myFavoriteBusinesses:
        return CupertinoPageRoute(builder: (_) => MyFavoriteBusinessessListPage());

      case Routes.myAppointments:
        return CupertinoPageRoute(builder: (_) => MyAppointmentsPage());

      case Routes.accessGPS:
        return CupertinoPageRoute(builder: (_) => AccessGPSPage());

      case Routes.choosePetType:
        return CupertinoPageRoute(builder: (_) => ChoosePetTypePage());

      case Routes.addressSearch:
        return CupertinoPageRoute(builder: (_) => AddressSearchPage());

      case Routes.loading:
        return CupertinoPageRoute(builder: (_) => LoadingPage());

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

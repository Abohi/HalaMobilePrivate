import 'package:auto_route/annotations.dart';
import 'package:halawork/pages/app_entry_pages/app_entry_main_page.dart';
import 'package:halawork/pages/auth_pages/login_page.dart';
import 'package:halawork/pages/auth_pages/sigup_page/email_signup_page.dart';
import 'package:halawork/pages/auth_pages/sigup_page/signup_page.dart';
import 'package:halawork/pages/basic_verification_pages/email_verification_success_page.dart';
import 'package:halawork/pages/basic_verification_pages/enter_phone_number_page.dart';
import 'package:halawork/pages/basic_verification_pages/phone_number_verification_page.dart';
import 'package:halawork/pages/basic_verification_pages/resend_email_verification_link_page.dart';
import 'package:halawork/pages/dashboard_pages/dashboard_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/create_request_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/create_request_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/achievement_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/addlocation_organization_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/education_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/location_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/orgdetails_entry_form.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/profile_description_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/profile_picture_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_expertise_level_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_seller_type_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_service_type_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/seller_basic_info_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/sellersetup_complete_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/seller_setup_pages/work_entry_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/byservice_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/subservice_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/homepage.dart';
import 'package:halawork/pages/dashboard_pages/pages/inbox_pages/inbox_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/inboxpage.dart';
import 'package:halawork/pages/dashboard_pages/pages/notification_pages/notification_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/notificationpage.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/profile_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/offer_sent_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/offer_sent_pages.dart';
import 'package:halawork/pages/dashboard_pages/pages/request_pages/send_offer_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/requestpage.dart';
import 'package:halawork/pages/splash_screen/splash_screen.dart';

import '../main.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    const AutoRoute(page: AppEntryPage, initial: true),
    const AutoRoute(page: AppEntryMainPage),
    const AutoRoute(page: ResendEmailVerificationLinkPage),
    const AutoRoute(page: CheckPhoneVerificationStateWidgetPage),
    const AutoRoute(page: EnterPhoneNumberPage),
    const AutoRoute(page: LoginPage),
    const AutoRoute(page: SignupPage),
    const AutoRoute(page: EmailSignupPage),
    const AutoRoute(page: EmailVerificationSuccessPage),
    const AutoRoute(page: PhoneVerificationPage),
    //Seller setup pages
    const AutoRoute(page: SelectSellerTypePage),
    const AutoRoute(page: SellerBasicInfoEntryPage),
    const AutoRoute(page: SelectServiceTypePage),
    const AutoRoute(page: SelectExpertiseLevelPage),
    const AutoRoute(page: EducationEntryPage),
    const AutoRoute(page: WorkEntryPage),
    const AutoRoute(page: AchievementEntryPage),
    const AutoRoute(page: ProfileDescriptionEntryPage),
    const AutoRoute(page: ProfilePictureEntryPage),
    const AutoRoute(page: LocationEntryPage),
    const AutoRoute(page: SellerSetupCompletePage),
    const AutoRoute(page: OrgDetailsEntryFormPage),
    const AutoRoute(page: AddLocationOrganizationEntryPage),
    const AutoRoute(page: SplashScreenPage),
    //End Of seller setup pages

    //Services Page
    const AutoRoute(page: ByServiceDetailPage),
    const AutoRoute(page: SubservicePage),
    //End Of Services Page

    //Start of drawer pages
    const AutoRoute(page: ProfilePage),
    //End of drawer pages

    //Request pages
    const AutoRoute(page: SendOfferPage),
    const AutoRoute(page: OfferSentPage),
    const AutoRoute(page: OfferSentDetailPage),
    //End Of Request Pages

    //Notification pages
    const AutoRoute(page: NotificationDetailPage),
    //End Of Notification Pages

    //Start of Inbox pages
    const AutoRoute(page: InboxDetailPage),
    //End of Inbox pages
    const AutoRoute(
        path: '/dashboard',
        page: DashBoardPage,
        children: const[
          const AutoRoute(page: HomePage, path: ''),
          const AutoRoute(page: InboxPage,),
          const AutoRoute(page: NotificationPage),
          const AutoRoute(page: RequestPage),
          const AutoRoute(page: CreateRequestPage),
        ]
    ),
  ],
)
class $AppRouter {}
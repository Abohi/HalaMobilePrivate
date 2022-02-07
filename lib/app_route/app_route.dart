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
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/dispute_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/modification_pages/modification_buyer_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/modification_pages/modification_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/modification_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/completed_order_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/ongoin_order_detailpage.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/order_pages/pending_order_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/add_account_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/add_account_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/amount_withdraw_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/withdraw_funds_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/pages/withdrawfunds_history_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/payment_pages/payment_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/change_pin_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/create_pin_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/notification_settings_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/drawer_pages/settings_page/security_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/home_search_pages/filter_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/home_search_pages/home_search_main_page.dart';
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
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/byservice_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/home_pages/service_pages/subservice_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/homepage.dart';
import 'package:halawork/pages/dashboard_pages/pages/inbox_pages/inbox_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/inboxpage.dart';
import 'package:halawork/pages/dashboard_pages/pages/notification_pages/notification_detail_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/notificationpage.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/edit_achievement_page/edit_achievement_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/edit_description_page/edit_individual_description_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/edit_description_page/edit_organization_description_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/edit_education_page/edit_education_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/edit_skills_page/edit_skill_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/edit_work_history/edit_work_history.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/portfolio_page/components/add_portfolio_description.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/portfolio_page/components/add_portfolio_photo.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/sevice_pages/edit_service_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/components/sevice_pages/edit_service_preference_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/profile_page.dart';
import 'package:halawork/pages/dashboard_pages/pages/profile_page/profile_view_page.dart';
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
    const AutoRoute(page: OrderPage),
    const AutoRoute(page: DisputePage),
    const AutoRoute(page: ModificationPage),
    const AutoRoute(page: AddAccountDetailPage),
    const AutoRoute(page: AddAccountPage),
    const AutoRoute(page: PaymentPage),
    const AutoRoute(page: SecurityPage),
    const AutoRoute(page: CreatePinPage),
    const AutoRoute(page: SettingsPage),
    const AutoRoute(page: ChangePinPage),
    const AutoRoute(page: AmountToWithdrawPage),
    const AutoRoute(page: WithDrawFundsPage),
    const AutoRoute(page: WithDrawfundHistoryPage),
    const AutoRoute(page: NotificationSettingsPage),
    //End of drawer pages

    //Request pages
    const AutoRoute(page: SendOfferPage),
    const AutoRoute(page: OfferSentPage),
    const AutoRoute(page: OfferSentDetailPage),
    //End Of Request Pages

    //Start of order pages
    const AutoRoute(page: PendingOrderDetailPage),
    const AutoRoute(page: OngoingOrderDetailPage),
    const AutoRoute(page: CompletedOrderDetailPage),
    //End of order pages
    //Notification pages
    const AutoRoute(page: NotificationDetailPage),
    //End Of Notification Pages

    //Start of Inbox pages
    const AutoRoute(page: InboxDetailPage),
    const AutoRoute(page: ModificationBuyerPage),
    const AutoRoute(page: ModificationDetailPage),
    const AutoRoute(page: EditServicePage),
    const AutoRoute(page: EditServicePagePreferencePage),
    const AutoRoute(page:  EditSkillPage),
    const AutoRoute(page:  ProfileViewPage),
    const AutoRoute(page:  AddPortfolioPhotoPage),
    const AutoRoute(page:  AddPortfolioDescriptionPage),
    const AutoRoute(page:  ByServicePage),
    const AutoRoute(page:  HomeSearchMainPage),
    const AutoRoute(page:  FilterPage),
    const AutoRoute(page:  EditWorkHistoryPage),
    const AutoRoute(page:  EditAchievementPage),
    const AutoRoute(page:  EditEducationPage),
    const AutoRoute(page:  EditOrganizationDescritionPage),
    const AutoRoute(page:  EditIndividualDescriptionPage),
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
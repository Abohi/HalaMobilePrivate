// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../main.dart' as _i3;
import '../models/active_servicemodel/active_service_model.dart' as _i62;
import '../models/modification_model/modification_model.dart' as _i68;
import '../models/notification_model/notification_model.dart' as _i67;
import '../models/offer_model/offer_model.dart' as _i64;
import '../models/order_model/order_model.dart' as _i66;
import '../models/requests_model/request_model2.dart' as _i63;
import '../models/user_model/user_model.dart' as _i65;
import '../pages/app_entry_pages/app_entry_main_page.dart' as _i4;
import '../pages/auth_pages/login_page.dart' as _i7;
import '../pages/auth_pages/sigup_page/email_signup_page.dart' as _i9;
import '../pages/auth_pages/sigup_page/signup_page.dart' as _i8;
import '../pages/basic_verification_pages/email_verification_success_page.dart'
    as _i10;
import '../pages/basic_verification_pages/enter_phone_number_page.dart' as _i6;
import '../pages/basic_verification_pages/phone_number_verification_page.dart'
    as _i11;
import '../pages/basic_verification_pages/resend_email_verification_link_page.dart'
    as _i5;
import '../pages/dashboard_pages/dashboard_page.dart' as _i56;
import '../pages/dashboard_pages/pages/create_request_page.dart' as _i61;
import '../pages/dashboard_pages/pages/drawer_pages/dispute_page.dart' as _i30;
import '../pages/dashboard_pages/pages/drawer_pages/modification_page.dart'
    as _i31;
import '../pages/dashboard_pages/pages/drawer_pages/modification_pages/modification_buyer_page.dart'
    as _i40;
import '../pages/dashboard_pages/pages/drawer_pages/modification_pages/modification_detail_page.dart'
    as _i41;
import '../pages/dashboard_pages/pages/drawer_pages/order_page.dart' as _i29;
import '../pages/dashboard_pages/pages/drawer_pages/order_pages/completed_order_detail_page.dart'
    as _i37;
import '../pages/dashboard_pages/pages/drawer_pages/order_pages/ongoin_order_detailpage.dart'
    as _i36;
import '../pages/dashboard_pages/pages/drawer_pages/order_pages/pending_order_detail_page.dart'
    as _i35;
import '../pages/dashboard_pages/pages/home_pages/home_search_pages/filter_page.dart'
    as _i50;
import '../pages/dashboard_pages/pages/home_pages/home_search_pages/home_search_main_page.dart'
    as _i49;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/achievement_entry_page.dart'
    as _i18;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/addlocation_organization_entry_page.dart'
    as _i24;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/education_entry_page.dart'
    as _i16;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/location_entry_page.dart'
    as _i21;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/orgdetails_entry_form.dart'
    as _i23;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/profile_description_entry_page.dart'
    as _i19;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/profile_picture_entry_page.dart'
    as _i20;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_expertise_level_page.dart'
    as _i15;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_seller_type_page.dart'
    as _i12;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/select_service_type_page.dart'
    as _i14;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/seller_basic_info_entry_page.dart'
    as _i13;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/sellersetup_complete_page.dart'
    as _i22;
import '../pages/dashboard_pages/pages/home_pages/seller_setup_pages/work_entry_page.dart'
    as _i17;
import '../pages/dashboard_pages/pages/home_pages/service_pages/byservice_detail_page.dart'
    as _i26;
import '../pages/dashboard_pages/pages/home_pages/service_pages/byservice_page.dart'
    as _i48;
import '../pages/dashboard_pages/pages/home_pages/service_pages/subservice_page.dart'
    as _i27;
import '../pages/dashboard_pages/pages/homepage.dart' as _i57;
import '../pages/dashboard_pages/pages/inbox_pages/inbox_detail_page.dart'
    as _i39;
import '../pages/dashboard_pages/pages/inboxpage.dart' as _i58;
import '../pages/dashboard_pages/pages/notification_pages/notification_detail_page.dart'
    as _i38;
import '../pages/dashboard_pages/pages/notificationpage.dart' as _i59;
import '../pages/dashboard_pages/pages/profile_page/components/edit_achievement_page/edit_achievement_page.dart'
    as _i52;
import '../pages/dashboard_pages/pages/profile_page/components/edit_description_page/edit_individual_description_page.dart'
    as _i55;
import '../pages/dashboard_pages/pages/profile_page/components/edit_description_page/edit_organization_description_page.dart'
    as _i54;
import '../pages/dashboard_pages/pages/profile_page/components/edit_education_page/edit_education_page.dart'
    as _i53;
import '../pages/dashboard_pages/pages/profile_page/components/edit_skills_page/edit_skill_page.dart'
    as _i44;
import '../pages/dashboard_pages/pages/profile_page/components/edit_work_history/edit_work_history.dart'
    as _i51;
import '../pages/dashboard_pages/pages/profile_page/components/portfolio_page/components/add_portfolio_description.dart'
    as _i47;
import '../pages/dashboard_pages/pages/profile_page/components/portfolio_page/components/add_portfolio_photo.dart'
    as _i46;
import '../pages/dashboard_pages/pages/profile_page/components/sevice_pages/edit_service_page.dart'
    as _i42;
import '../pages/dashboard_pages/pages/profile_page/components/sevice_pages/edit_service_preference_page.dart'
    as _i43;
import '../pages/dashboard_pages/pages/profile_page/profile_page.dart' as _i28;
import '../pages/dashboard_pages/pages/profile_page/profile_view_page.dart'
    as _i45;
import '../pages/dashboard_pages/pages/request_pages/offer_sent_detail_page.dart'
    as _i34;
import '../pages/dashboard_pages/pages/request_pages/offer_sent_pages.dart'
    as _i33;
import '../pages/dashboard_pages/pages/request_pages/send_offer_page.dart'
    as _i32;
import '../pages/dashboard_pages/pages/requestpage.dart' as _i60;
import '../pages/splash_screen/splash_screen.dart' as _i25;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AppEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.AppEntryPage();
        }),
    AppEntryMainRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.AppEntryMainPage();
        }),
    ResendEmailVerificationLinkRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i5.ResendEmailVerificationLinkPage();
            }),
    CheckPhoneVerificationStateWidgetRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i3.CheckPhoneVerificationStateWidgetPage();
            }),
    EnterPhoneNumberRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.EnterPhoneNumberPage();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.LoginPage();
        }),
    SignupRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.SignupPage();
        }),
    EmailSignupRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.EmailSignupPage();
        }),
    EmailVerificationSuccessRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i10.EmailVerificationSuccessPage();
            }),
    PhoneVerificationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.PhoneVerificationPage();
        }),
    SelectSellerTypeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.SelectSellerTypePage();
        }),
    SellerBasicInfoEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i13.SellerBasicInfoEntryPage();
        }),
    SelectServiceTypeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SelectServiceTypeRouteArgs>();
          return _i14.SelectServiceTypePage(args.isOrganization);
        }),
    SelectExpertiseLevelRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i15.SelectExpertiseLevelPage();
        }),
    EducationEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i16.EducationEntryPage();
        }),
    WorkEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i17.WorkEntryPage();
        }),
    AchievementEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i18.AchievementEntryPage();
        }),
    ProfileDescriptionEntryRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i19.ProfileDescriptionEntryPage();
            }),
    ProfilePictureEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i20.ProfilePictureEntryPage();
        }),
    LocationEntryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i21.LocationEntryPage();
        }),
    SellerSetupCompleteRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i22.SellerSetupCompletePage();
        }),
    OrgDetailsEntryFormRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i23.OrgDetailsEntryFormPage();
        }),
    AddLocationOrganizationEntryRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i24.AddLocationOrganizationEntryPage();
            }),
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i25.SplashScreenPage();
        }),
    ByServiceDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ByServiceDetailRouteArgs>();
          return _i26.ByServiceDetailPage(serviceModel: args.serviceModel);
        }),
    SubserviceRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SubserviceRouteArgs>();
          return _i27.SubservicePage(
              subServiceName: args.subServiceName,
              activeServiceModel: args.activeServiceModel);
        }),
    ProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i28.ProfilePage();
        }),
    OrderRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i29.OrderPage();
        }),
    DisputeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i30.DisputePage();
        }),
    ModificationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i31.ModificationPage();
        }),
    SendOfferRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SendOfferRouteArgs>();
          return _i32.SendOfferPage(
              createRequestModel2: args.createRequestModel2);
        }),
    OfferSentRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OfferSentRouteArgs>();
          return _i33.OfferSentPage(requestId: args.requestId);
        }),
    OfferSentDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OfferSentDetailRouteArgs>();
          return _i34.OfferSentDetailPage(
              offerModel: args.offerModel, userModel: args.userModel);
        }),
    PendingOrderDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PendingOrderDetailRouteArgs>();
          return _i35.PendingOrderDetailPage(orderModel: args.orderModel);
        }),
    OngoingOrderDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OngoingOrderDetailRouteArgs>();
          return _i36.OngoingOrderDetailPage(orderModel: args.orderModel);
        }),
    CompletedOrderDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CompletedOrderDetailRouteArgs>();
          return _i37.CompletedOrderDetailPage(orderModel: args.orderModel);
        }),
    NotificationDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<NotificationDetailRouteArgs>();
          return _i38.NotificationDetailPage(
              notificationModel: args.notificationModel);
        }),
    InboxDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i39.InboxDetailPage();
        }),
    ModificationBuyerRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ModificationBuyerRouteArgs>();
          return _i40.ModificationBuyerPage(orderModel: args.orderModel);
        }),
    ModificationDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ModificationDetailRouteArgs>();
          return _i41.ModificationDetailPage(
              modificationModel: args.modificationModel);
        }),
    EditServiceRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditServiceRouteArgs>();
          return _i42.EditServicePage(preference: args.preference);
        }),
    EditServiceRoutePreferenceRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i43.EditServicePagePreferencePage();
            }),
    EditSkillRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i44.EditSkillPage();
        }),
    ProfileViewRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ProfileViewRouteArgs>();
          return _i45.ProfileViewPage(userId: args.userId);
        }),
    AddPortfolioPhotoRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddPortfolioPhotoRouteArgs>();
          return _i46.AddPortfolioPhotoPage(
              skills: args.skills, projectName: args.projectName);
        }),
    AddPortfolioDescriptionRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i47.AddPortfolioDescriptionPage();
            }),
    ByServiceRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i48.ByServicePage();
        }),
    HomeSearchMainRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i49.HomeSearchMainPage();
        }),
    FilterRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<FilterRouteArgs>();
          return _i50.FilterPage(subServices: args.subServices);
        }),
    EditWorkHistoryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i51.EditWorkHistoryPage();
        }),
    EditAchievementRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i52.EditAchievementPage();
        }),
    EditEducationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i53.EditEducationPage();
        }),
    EditOrganizationDescritionRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i54.EditOrganizationDescritionPage();
            }),
    EditIndividualDescriptionRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i55.EditIndividualDescriptionPage();
            }),
    DashBoardRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i56.DashBoardPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i57.HomePage();
        }),
    InboxRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i58.InboxPage();
        }),
    NotificationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i59.NotificationPage();
        }),
    RequestRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i60.RequestPage();
        }),
    CreateRequestRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i61.CreateRequestPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AppEntryRoute.name, path: '/'),
        _i1.RouteConfig(AppEntryMainRoute.name, path: '/app-entry-main-page'),
        _i1.RouteConfig(ResendEmailVerificationLinkRoute.name,
            path: '/resend-email-verification-link-page'),
        _i1.RouteConfig(CheckPhoneVerificationStateWidgetRoute.name,
            path: '/check-phone-verification-state-widget-page'),
        _i1.RouteConfig(EnterPhoneNumberRoute.name,
            path: '/enter-phone-number-page'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(SignupRoute.name, path: '/signup-page'),
        _i1.RouteConfig(EmailSignupRoute.name, path: '/email-signup-page'),
        _i1.RouteConfig(EmailVerificationSuccessRoute.name,
            path: '/email-verification-success-page'),
        _i1.RouteConfig(PhoneVerificationRoute.name,
            path: '/phone-verification-page'),
        _i1.RouteConfig(SelectSellerTypeRoute.name,
            path: '/select-seller-type-page'),
        _i1.RouteConfig(SellerBasicInfoEntryRoute.name,
            path: '/seller-basic-info-entry-page'),
        _i1.RouteConfig(SelectServiceTypeRoute.name,
            path: '/select-service-type-page'),
        _i1.RouteConfig(SelectExpertiseLevelRoute.name,
            path: '/select-expertise-level-page'),
        _i1.RouteConfig(EducationEntryRoute.name,
            path: '/education-entry-page'),
        _i1.RouteConfig(WorkEntryRoute.name, path: '/work-entry-page'),
        _i1.RouteConfig(AchievementEntryRoute.name,
            path: '/achievement-entry-page'),
        _i1.RouteConfig(ProfileDescriptionEntryRoute.name,
            path: '/profile-description-entry-page'),
        _i1.RouteConfig(ProfilePictureEntryRoute.name,
            path: '/profile-picture-entry-page'),
        _i1.RouteConfig(LocationEntryRoute.name, path: '/location-entry-page'),
        _i1.RouteConfig(SellerSetupCompleteRoute.name,
            path: '/seller-setup-complete-page'),
        _i1.RouteConfig(OrgDetailsEntryFormRoute.name,
            path: '/org-details-entry-form-page'),
        _i1.RouteConfig(AddLocationOrganizationEntryRoute.name,
            path: '/add-location-organization-entry-page'),
        _i1.RouteConfig(SplashScreenRoute.name, path: '/splash-screen-page'),
        _i1.RouteConfig(ByServiceDetailRoute.name,
            path: '/by-service-detail-page'),
        _i1.RouteConfig(SubserviceRoute.name, path: '/subservice-page'),
        _i1.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i1.RouteConfig(OrderRoute.name, path: '/order-page'),
        _i1.RouteConfig(DisputeRoute.name, path: '/dispute-page'),
        _i1.RouteConfig(ModificationRoute.name, path: '/modification-page'),
        _i1.RouteConfig(SendOfferRoute.name, path: '/send-offer-page'),
        _i1.RouteConfig(OfferSentRoute.name, path: '/offer-sent-page'),
        _i1.RouteConfig(OfferSentDetailRoute.name,
            path: '/offer-sent-detail-page'),
        _i1.RouteConfig(PendingOrderDetailRoute.name,
            path: '/pending-order-detail-page'),
        _i1.RouteConfig(OngoingOrderDetailRoute.name,
            path: '/ongoing-order-detail-page'),
        _i1.RouteConfig(CompletedOrderDetailRoute.name,
            path: '/completed-order-detail-page'),
        _i1.RouteConfig(NotificationDetailRoute.name,
            path: '/notification-detail-page'),
        _i1.RouteConfig(InboxDetailRoute.name, path: '/inbox-detail-page'),
        _i1.RouteConfig(ModificationBuyerRoute.name,
            path: '/modification-buyer-page'),
        _i1.RouteConfig(ModificationDetailRoute.name,
            path: '/modification-detail-page'),
        _i1.RouteConfig(EditServiceRoute.name, path: '/edit-service-page'),
        _i1.RouteConfig(EditServiceRoutePreferenceRoute.name,
            path: '/edit-service-page-preference-page'),
        _i1.RouteConfig(EditSkillRoute.name, path: '/edit-skill-page'),
        _i1.RouteConfig(ProfileViewRoute.name, path: '/profile-view-page'),
        _i1.RouteConfig(AddPortfolioPhotoRoute.name,
            path: '/add-portfolio-photo-page'),
        _i1.RouteConfig(AddPortfolioDescriptionRoute.name,
            path: '/add-portfolio-description-page'),
        _i1.RouteConfig(ByServiceRoute.name, path: '/by-service-page'),
        _i1.RouteConfig(HomeSearchMainRoute.name,
            path: '/home-search-main-page'),
        _i1.RouteConfig(FilterRoute.name, path: '/filter-page'),
        _i1.RouteConfig(EditWorkHistoryRoute.name,
            path: '/edit-work-history-page'),
        _i1.RouteConfig(EditAchievementRoute.name,
            path: '/edit-achievement-page'),
        _i1.RouteConfig(EditEducationRoute.name, path: '/edit-education-page'),
        _i1.RouteConfig(EditOrganizationDescritionRoute.name,
            path: '/edit-organization-descrition-page'),
        _i1.RouteConfig(EditIndividualDescriptionRoute.name,
            path: '/edit-individual-description-page'),
        _i1.RouteConfig(DashBoardRoute.name, path: '/dashboard', children: [
          _i1.RouteConfig(HomeRoute.name, path: ''),
          _i1.RouteConfig(InboxRoute.name, path: 'inbox-page'),
          _i1.RouteConfig(NotificationRoute.name, path: 'notification-page'),
          _i1.RouteConfig(RequestRoute.name, path: 'request-page'),
          _i1.RouteConfig(CreateRequestRoute.name, path: 'create-request-page')
        ])
      ];
}

class AppEntryRoute extends _i1.PageRouteInfo {
  const AppEntryRoute() : super(name, path: '/');

  static const String name = 'AppEntryRoute';
}

class AppEntryMainRoute extends _i1.PageRouteInfo {
  const AppEntryMainRoute() : super(name, path: '/app-entry-main-page');

  static const String name = 'AppEntryMainRoute';
}

class ResendEmailVerificationLinkRoute extends _i1.PageRouteInfo {
  const ResendEmailVerificationLinkRoute()
      : super(name, path: '/resend-email-verification-link-page');

  static const String name = 'ResendEmailVerificationLinkRoute';
}

class CheckPhoneVerificationStateWidgetRoute extends _i1.PageRouteInfo {
  const CheckPhoneVerificationStateWidgetRoute()
      : super(name, path: '/check-phone-verification-state-widget-page');

  static const String name = 'CheckPhoneVerificationStateWidgetRoute';
}

class EnterPhoneNumberRoute extends _i1.PageRouteInfo {
  const EnterPhoneNumberRoute() : super(name, path: '/enter-phone-number-page');

  static const String name = 'EnterPhoneNumberRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

class SignupRoute extends _i1.PageRouteInfo {
  const SignupRoute() : super(name, path: '/signup-page');

  static const String name = 'SignupRoute';
}

class EmailSignupRoute extends _i1.PageRouteInfo {
  const EmailSignupRoute() : super(name, path: '/email-signup-page');

  static const String name = 'EmailSignupRoute';
}

class EmailVerificationSuccessRoute extends _i1.PageRouteInfo {
  const EmailVerificationSuccessRoute()
      : super(name, path: '/email-verification-success-page');

  static const String name = 'EmailVerificationSuccessRoute';
}

class PhoneVerificationRoute extends _i1.PageRouteInfo {
  const PhoneVerificationRoute()
      : super(name, path: '/phone-verification-page');

  static const String name = 'PhoneVerificationRoute';
}

class SelectSellerTypeRoute extends _i1.PageRouteInfo {
  const SelectSellerTypeRoute() : super(name, path: '/select-seller-type-page');

  static const String name = 'SelectSellerTypeRoute';
}

class SellerBasicInfoEntryRoute extends _i1.PageRouteInfo {
  const SellerBasicInfoEntryRoute()
      : super(name, path: '/seller-basic-info-entry-page');

  static const String name = 'SellerBasicInfoEntryRoute';
}

class SelectServiceTypeRoute
    extends _i1.PageRouteInfo<SelectServiceTypeRouteArgs> {
  SelectServiceTypeRoute({required bool isOrganization})
      : super(name,
            path: '/select-service-type-page',
            args: SelectServiceTypeRouteArgs(isOrganization: isOrganization));

  static const String name = 'SelectServiceTypeRoute';
}

class SelectServiceTypeRouteArgs {
  const SelectServiceTypeRouteArgs({required this.isOrganization});

  final bool isOrganization;
}

class SelectExpertiseLevelRoute extends _i1.PageRouteInfo {
  const SelectExpertiseLevelRoute()
      : super(name, path: '/select-expertise-level-page');

  static const String name = 'SelectExpertiseLevelRoute';
}

class EducationEntryRoute extends _i1.PageRouteInfo {
  const EducationEntryRoute() : super(name, path: '/education-entry-page');

  static const String name = 'EducationEntryRoute';
}

class WorkEntryRoute extends _i1.PageRouteInfo {
  const WorkEntryRoute() : super(name, path: '/work-entry-page');

  static const String name = 'WorkEntryRoute';
}

class AchievementEntryRoute extends _i1.PageRouteInfo {
  const AchievementEntryRoute() : super(name, path: '/achievement-entry-page');

  static const String name = 'AchievementEntryRoute';
}

class ProfileDescriptionEntryRoute extends _i1.PageRouteInfo {
  const ProfileDescriptionEntryRoute()
      : super(name, path: '/profile-description-entry-page');

  static const String name = 'ProfileDescriptionEntryRoute';
}

class ProfilePictureEntryRoute extends _i1.PageRouteInfo {
  const ProfilePictureEntryRoute()
      : super(name, path: '/profile-picture-entry-page');

  static const String name = 'ProfilePictureEntryRoute';
}

class LocationEntryRoute extends _i1.PageRouteInfo {
  const LocationEntryRoute() : super(name, path: '/location-entry-page');

  static const String name = 'LocationEntryRoute';
}

class SellerSetupCompleteRoute extends _i1.PageRouteInfo {
  const SellerSetupCompleteRoute()
      : super(name, path: '/seller-setup-complete-page');

  static const String name = 'SellerSetupCompleteRoute';
}

class OrgDetailsEntryFormRoute extends _i1.PageRouteInfo {
  const OrgDetailsEntryFormRoute()
      : super(name, path: '/org-details-entry-form-page');

  static const String name = 'OrgDetailsEntryFormRoute';
}

class AddLocationOrganizationEntryRoute extends _i1.PageRouteInfo {
  const AddLocationOrganizationEntryRoute()
      : super(name, path: '/add-location-organization-entry-page');

  static const String name = 'AddLocationOrganizationEntryRoute';
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/splash-screen-page');

  static const String name = 'SplashScreenRoute';
}

class ByServiceDetailRoute extends _i1.PageRouteInfo<ByServiceDetailRouteArgs> {
  ByServiceDetailRoute({required _i62.ActiveServiceModel serviceModel})
      : super(name,
            path: '/by-service-detail-page',
            args: ByServiceDetailRouteArgs(serviceModel: serviceModel));

  static const String name = 'ByServiceDetailRoute';
}

class ByServiceDetailRouteArgs {
  const ByServiceDetailRouteArgs({required this.serviceModel});

  final _i62.ActiveServiceModel serviceModel;
}

class SubserviceRoute extends _i1.PageRouteInfo<SubserviceRouteArgs> {
  SubserviceRoute(
      {required String subServiceName,
      required _i62.ActiveServiceModel activeServiceModel})
      : super(name,
            path: '/subservice-page',
            args: SubserviceRouteArgs(
                subServiceName: subServiceName,
                activeServiceModel: activeServiceModel));

  static const String name = 'SubserviceRoute';
}

class SubserviceRouteArgs {
  const SubserviceRouteArgs(
      {required this.subServiceName, required this.activeServiceModel});

  final String subServiceName;

  final _i62.ActiveServiceModel activeServiceModel;
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

class OrderRoute extends _i1.PageRouteInfo {
  const OrderRoute() : super(name, path: '/order-page');

  static const String name = 'OrderRoute';
}

class DisputeRoute extends _i1.PageRouteInfo {
  const DisputeRoute() : super(name, path: '/dispute-page');

  static const String name = 'DisputeRoute';
}

class ModificationRoute extends _i1.PageRouteInfo {
  const ModificationRoute() : super(name, path: '/modification-page');

  static const String name = 'ModificationRoute';
}

class SendOfferRoute extends _i1.PageRouteInfo<SendOfferRouteArgs> {
  SendOfferRoute({required _i63.CreateRequestModel2 createRequestModel2})
      : super(name,
            path: '/send-offer-page',
            args: SendOfferRouteArgs(createRequestModel2: createRequestModel2));

  static const String name = 'SendOfferRoute';
}

class SendOfferRouteArgs {
  const SendOfferRouteArgs({required this.createRequestModel2});

  final _i63.CreateRequestModel2 createRequestModel2;
}

class OfferSentRoute extends _i1.PageRouteInfo<OfferSentRouteArgs> {
  OfferSentRoute({required String requestId})
      : super(name,
            path: '/offer-sent-page',
            args: OfferSentRouteArgs(requestId: requestId));

  static const String name = 'OfferSentRoute';
}

class OfferSentRouteArgs {
  const OfferSentRouteArgs({required this.requestId});

  final String requestId;
}

class OfferSentDetailRoute extends _i1.PageRouteInfo<OfferSentDetailRouteArgs> {
  OfferSentDetailRoute(
      {required _i64.OfferModel offerModel, required _i65.UserModel userModel})
      : super(name,
            path: '/offer-sent-detail-page',
            args: OfferSentDetailRouteArgs(
                offerModel: offerModel, userModel: userModel));

  static const String name = 'OfferSentDetailRoute';
}

class OfferSentDetailRouteArgs {
  const OfferSentDetailRouteArgs(
      {required this.offerModel, required this.userModel});

  final _i64.OfferModel offerModel;

  final _i65.UserModel userModel;
}

class PendingOrderDetailRoute
    extends _i1.PageRouteInfo<PendingOrderDetailRouteArgs> {
  PendingOrderDetailRoute({required _i66.OrderModel orderModel})
      : super(name,
            path: '/pending-order-detail-page',
            args: PendingOrderDetailRouteArgs(orderModel: orderModel));

  static const String name = 'PendingOrderDetailRoute';
}

class PendingOrderDetailRouteArgs {
  const PendingOrderDetailRouteArgs({required this.orderModel});

  final _i66.OrderModel orderModel;
}

class OngoingOrderDetailRoute
    extends _i1.PageRouteInfo<OngoingOrderDetailRouteArgs> {
  OngoingOrderDetailRoute({required _i66.OrderModel orderModel})
      : super(name,
            path: '/ongoing-order-detail-page',
            args: OngoingOrderDetailRouteArgs(orderModel: orderModel));

  static const String name = 'OngoingOrderDetailRoute';
}

class OngoingOrderDetailRouteArgs {
  const OngoingOrderDetailRouteArgs({required this.orderModel});

  final _i66.OrderModel orderModel;
}

class CompletedOrderDetailRoute
    extends _i1.PageRouteInfo<CompletedOrderDetailRouteArgs> {
  CompletedOrderDetailRoute({required _i66.OrderModel orderModel})
      : super(name,
            path: '/completed-order-detail-page',
            args: CompletedOrderDetailRouteArgs(orderModel: orderModel));

  static const String name = 'CompletedOrderDetailRoute';
}

class CompletedOrderDetailRouteArgs {
  const CompletedOrderDetailRouteArgs({required this.orderModel});

  final _i66.OrderModel orderModel;
}

class NotificationDetailRoute
    extends _i1.PageRouteInfo<NotificationDetailRouteArgs> {
  NotificationDetailRoute({required _i67.NotificationModel notificationModel})
      : super(name,
            path: '/notification-detail-page',
            args: NotificationDetailRouteArgs(
                notificationModel: notificationModel));

  static const String name = 'NotificationDetailRoute';
}

class NotificationDetailRouteArgs {
  const NotificationDetailRouteArgs({required this.notificationModel});

  final _i67.NotificationModel notificationModel;
}

class InboxDetailRoute extends _i1.PageRouteInfo {
  const InboxDetailRoute() : super(name, path: '/inbox-detail-page');

  static const String name = 'InboxDetailRoute';
}

class ModificationBuyerRoute
    extends _i1.PageRouteInfo<ModificationBuyerRouteArgs> {
  ModificationBuyerRoute({required _i66.OrderModel orderModel})
      : super(name,
            path: '/modification-buyer-page',
            args: ModificationBuyerRouteArgs(orderModel: orderModel));

  static const String name = 'ModificationBuyerRoute';
}

class ModificationBuyerRouteArgs {
  const ModificationBuyerRouteArgs({required this.orderModel});

  final _i66.OrderModel orderModel;
}

class ModificationDetailRoute
    extends _i1.PageRouteInfo<ModificationDetailRouteArgs> {
  ModificationDetailRoute({required _i68.ModificationModel modificationModel})
      : super(name,
            path: '/modification-detail-page',
            args: ModificationDetailRouteArgs(
                modificationModel: modificationModel));

  static const String name = 'ModificationDetailRoute';
}

class ModificationDetailRouteArgs {
  const ModificationDetailRouteArgs({required this.modificationModel});

  final _i68.ModificationModel modificationModel;
}

class EditServiceRoute extends _i1.PageRouteInfo<EditServiceRouteArgs> {
  EditServiceRoute({required String preference})
      : super(name,
            path: '/edit-service-page',
            args: EditServiceRouteArgs(preference: preference));

  static const String name = 'EditServiceRoute';
}

class EditServiceRouteArgs {
  const EditServiceRouteArgs({required this.preference});

  final String preference;
}

class EditServiceRoutePreferenceRoute extends _i1.PageRouteInfo {
  const EditServiceRoutePreferenceRoute()
      : super(name, path: '/edit-service-page-preference-page');

  static const String name = 'EditServiceRoutePreferenceRoute';
}

class EditSkillRoute extends _i1.PageRouteInfo {
  const EditSkillRoute() : super(name, path: '/edit-skill-page');

  static const String name = 'EditSkillRoute';
}

class ProfileViewRoute extends _i1.PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({required String userId})
      : super(name,
            path: '/profile-view-page',
            args: ProfileViewRouteArgs(userId: userId));

  static const String name = 'ProfileViewRoute';
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({required this.userId});

  final String userId;
}

class AddPortfolioPhotoRoute
    extends _i1.PageRouteInfo<AddPortfolioPhotoRouteArgs> {
  AddPortfolioPhotoRoute(
      {required List<String> skills, required String projectName})
      : super(name,
            path: '/add-portfolio-photo-page',
            args: AddPortfolioPhotoRouteArgs(
                skills: skills, projectName: projectName));

  static const String name = 'AddPortfolioPhotoRoute';
}

class AddPortfolioPhotoRouteArgs {
  const AddPortfolioPhotoRouteArgs(
      {required this.skills, required this.projectName});

  final List<String> skills;

  final String projectName;
}

class AddPortfolioDescriptionRoute extends _i1.PageRouteInfo {
  const AddPortfolioDescriptionRoute()
      : super(name, path: '/add-portfolio-description-page');

  static const String name = 'AddPortfolioDescriptionRoute';
}

class ByServiceRoute extends _i1.PageRouteInfo {
  const ByServiceRoute() : super(name, path: '/by-service-page');

  static const String name = 'ByServiceRoute';
}

class HomeSearchMainRoute extends _i1.PageRouteInfo {
  const HomeSearchMainRoute() : super(name, path: '/home-search-main-page');

  static const String name = 'HomeSearchMainRoute';
}

class FilterRoute extends _i1.PageRouteInfo<FilterRouteArgs> {
  FilterRoute({required List<String> subServices})
      : super(name,
            path: '/filter-page',
            args: FilterRouteArgs(subServices: subServices));

  static const String name = 'FilterRoute';
}

class FilterRouteArgs {
  const FilterRouteArgs({required this.subServices});

  final List<String> subServices;
}

class EditWorkHistoryRoute extends _i1.PageRouteInfo {
  const EditWorkHistoryRoute() : super(name, path: '/edit-work-history-page');

  static const String name = 'EditWorkHistoryRoute';
}

class EditAchievementRoute extends _i1.PageRouteInfo {
  const EditAchievementRoute() : super(name, path: '/edit-achievement-page');

  static const String name = 'EditAchievementRoute';
}

class EditEducationRoute extends _i1.PageRouteInfo {
  const EditEducationRoute() : super(name, path: '/edit-education-page');

  static const String name = 'EditEducationRoute';
}

class EditOrganizationDescritionRoute extends _i1.PageRouteInfo {
  const EditOrganizationDescritionRoute()
      : super(name, path: '/edit-organization-descrition-page');

  static const String name = 'EditOrganizationDescritionRoute';
}

class EditIndividualDescriptionRoute extends _i1.PageRouteInfo {
  const EditIndividualDescriptionRoute()
      : super(name, path: '/edit-individual-description-page');

  static const String name = 'EditIndividualDescriptionRoute';
}

class DashBoardRoute extends _i1.PageRouteInfo {
  const DashBoardRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/dashboard', initialChildren: children);

  static const String name = 'DashBoardRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '');

  static const String name = 'HomeRoute';
}

class InboxRoute extends _i1.PageRouteInfo {
  const InboxRoute() : super(name, path: 'inbox-page');

  static const String name = 'InboxRoute';
}

class NotificationRoute extends _i1.PageRouteInfo {
  const NotificationRoute() : super(name, path: 'notification-page');

  static const String name = 'NotificationRoute';
}

class RequestRoute extends _i1.PageRouteInfo {
  const RequestRoute() : super(name, path: 'request-page');

  static const String name = 'RequestRoute';
}

class CreateRequestRoute extends _i1.PageRouteInfo {
  const CreateRequestRoute() : super(name, path: 'create-request-page');

  static const String name = 'CreateRequestRoute';
}

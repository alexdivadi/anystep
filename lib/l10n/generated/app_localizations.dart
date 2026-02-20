import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Application title displayed in OS task switcher and app bar where used.
  ///
  /// In en, this message translates to:
  /// **'AnyStep Community Services'**
  String get appTitle;

  /// Greeting message with the user's first name.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(String name);

  /// Title for the remote-config welcome message modal
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeMessageTitle;

  /// Dismiss button label for the welcome message modal
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get welcomeMessageDismiss;

  /// Pluralized count of generic items.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0 {No items} one {1 item} other {{count} items}}'**
  String itemCount(int count);

  /// Title for the Settings screen app bar
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Settings tile label for theme selection
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// Theme option: follow system
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get themeAuto;

  /// Theme option: light
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get themeLight;

  /// Theme option: dark
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get themeDark;

  /// Settings tile label for language selection
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// Option to use system locale
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// English language label
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Spanish language label (native spelling)
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// Navigate to account settings
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// Logout button label
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Login button label
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Validation error when password is too short
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// App bar title for reports screen and navigation label
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reportsTitle;

  /// Tooltip for export CSV action
  ///
  /// In en, this message translates to:
  /// **'Export CSV'**
  String get exportCsv;

  /// Filter button: this month
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get rangeThisMonth;

  /// Filter button: year to date
  ///
  /// In en, this message translates to:
  /// **'YTD'**
  String get rangeYtd;

  /// Custom date range button label
  ///
  /// In en, this message translates to:
  /// **'Custom: {start} → {end}'**
  String rangeCustom(String start, String end);

  /// Empty state for reports list
  ///
  /// In en, this message translates to:
  /// **'No data in selected range'**
  String get noDataInRange;

  /// Heading showing total reports
  ///
  /// In en, this message translates to:
  /// **'Reports ({count})'**
  String reportsCount(int count);

  /// Error message for reports loading
  ///
  /// In en, this message translates to:
  /// **'Error loading reports: {error}'**
  String errorLoadingReports(String error);

  /// App bar title for event detail screen
  ///
  /// In en, this message translates to:
  /// **'Event Detail'**
  String get eventDetailTitle;

  /// Action label for sharing content
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareAction;

  /// Action label to edit an event
  ///
  /// In en, this message translates to:
  /// **'Edit event'**
  String get editEventAction;

  /// Action label to stop editing an event
  ///
  /// In en, this message translates to:
  /// **'Stop editing'**
  String get stopEditingAction;

  /// Title for add to calendar prompt
  ///
  /// In en, this message translates to:
  /// **'Add Event to Calendar'**
  String get addToCalendarTitle;

  /// Body text for add to calendar prompt
  ///
  /// In en, this message translates to:
  /// **'Save this event to your Google Calendar so you don\'t miss it.'**
  String get addToCalendarBody;

  /// Primary button label for add to calendar
  ///
  /// In en, this message translates to:
  /// **'Add to Google Calendar'**
  String get addToCalendarCta;

  /// Dismiss button label for add to calendar prompt
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get addToCalendarDismiss;

  /// Menu item label for add to calendar action
  ///
  /// In en, this message translates to:
  /// **'Add to Calendar'**
  String get addToCalendarMenuItem;

  /// Badge indicating the event is completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Section title for description
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Fallback when no description is provided
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get noDescription;

  /// Section title for address
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Fallback when no address is provided
  ///
  /// In en, this message translates to:
  /// **'No address provided'**
  String get noAddressProvided;

  /// Event start label
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Event end label
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// Duration in hours for same-day events
  ///
  /// In en, this message translates to:
  /// **'{count} hour{plural}'**
  String hours(int count, String plural);

  /// Sign up button label
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// Admin dashboard title
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// Section header for volunteer dashboard stats
  ///
  /// In en, this message translates to:
  /// **'Your Volunteering'**
  String get dashboardYourVolunteering;

  /// Section header for admin dashboard metrics
  ///
  /// In en, this message translates to:
  /// **'Volunteer Metrics'**
  String get dashboardVolunteerMetrics;

  /// Section header for recent events on dashboard
  ///
  /// In en, this message translates to:
  /// **'Recent Events'**
  String get dashboardRecentEvents;

  /// Section header for upcoming events on dashboard
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get dashboardUpcomingEvents;

  /// Metric label for hours this month
  ///
  /// In en, this message translates to:
  /// **'Hours (This Month)'**
  String get dashboardHoursThisMonth;

  /// Metric label for year-to-date hours
  ///
  /// In en, this message translates to:
  /// **'Hours (YTD)'**
  String get dashboardHoursYtd;

  /// Metric label for events this month
  ///
  /// In en, this message translates to:
  /// **'Events (This Month)'**
  String get dashboardEventsThisMonth;

  /// Metric label for year-to-date events
  ///
  /// In en, this message translates to:
  /// **'Events (YTD)'**
  String get dashboardEventsYtd;

  /// Metric label for unique volunteers this month
  ///
  /// In en, this message translates to:
  /// **'Volunteers (This Month)'**
  String get dashboardVolunteersThisMonth;

  /// Metric label for unique volunteers year-to-date
  ///
  /// In en, this message translates to:
  /// **'Volunteers (YTD)'**
  String get dashboardVolunteersYtd;

  /// Empty state message for metrics chart
  ///
  /// In en, this message translates to:
  /// **'No metrics yet. Keep building impact!'**
  String get dashboardNoMetrics;

  /// Section header for dashboard calendar
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get dashboardCalendar;

  /// Empty state text for calendar day events
  ///
  /// In en, this message translates to:
  /// **'No events for this day'**
  String get dashboardNoEventsCalendar;

  /// Shown when an event does not count for volunteer hours
  ///
  /// In en, this message translates to:
  /// **'Not eligible for volunteer hours'**
  String get notEligibleVolunteerHours;

  /// Event feed title
  ///
  /// In en, this message translates to:
  /// **'Event Feed'**
  String get eventFeed;

  /// Generic label for search
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Label for address autocomplete search field
  ///
  /// In en, this message translates to:
  /// **'Search address'**
  String get searchAddress;

  /// Hint text for address autocomplete search field
  ///
  /// In en, this message translates to:
  /// **'Start typing an address'**
  String get startTypingAddress;

  /// Shown when address autocomplete returns no results
  ///
  /// In en, this message translates to:
  /// **'No matches found'**
  String get noMatchesFound;

  /// Search bar hint text for events
  ///
  /// In en, this message translates to:
  /// **'Search events'**
  String get searchEvents;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Section header for recent events
  ///
  /// In en, this message translates to:
  /// **'Recent Events'**
  String get recentEvents;

  /// Section header for upcoming events
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get upcomingEvents;

  /// Snackbar message for event creation
  ///
  /// In en, this message translates to:
  /// **'Event created successfully'**
  String get eventCreated;

  /// FAB label to create an event
  ///
  /// In en, this message translates to:
  /// **'Create Event'**
  String get createEvent;

  /// Bottom nav label for Reports
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get navReports;

  /// Bottom nav label for See More
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get navSeeMore;

  /// Blog tab title and screen title
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get blogTitle;

  /// Empty state message for blog channels screen
  ///
  /// In en, this message translates to:
  /// **'No channels yet. Admins can create the first channel.'**
  String get blogEmptyState;

  /// Button label to create a new blog channel
  ///
  /// In en, this message translates to:
  /// **'Create Channel'**
  String get blogCreateChannel;

  /// App bar title for blog channel detail screen
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get blogChannelTitle;

  /// Placeholder text for blog channel detail screen
  ///
  /// In en, this message translates to:
  /// **'Channel #{id} details coming soon.'**
  String blogChannelPlaceholder(int id);

  /// Placeholder text for create channel screen
  ///
  /// In en, this message translates to:
  /// **'Channel creation form coming soon.'**
  String get blogCreateChannelPlaceholder;

  /// Bottom nav label for Events
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get navEvents;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Generic error message for loading failures
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get failedToLoad;

  /// Instruction for image picker
  ///
  /// In en, this message translates to:
  /// **'Tap to pick image'**
  String get tapToPickImage;

  /// Section title for attendees
  ///
  /// In en, this message translates to:
  /// **'Attendees'**
  String get attendees;

  /// Empty state for attendee list
  ///
  /// In en, this message translates to:
  /// **'No attendees'**
  String get noAttendees;

  /// Profile screen title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Phone field label
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Date joined label
  ///
  /// In en, this message translates to:
  /// **'Date Joined'**
  String get dateJoined;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Prompt for sign up from login
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign Up'**
  String get dontHaveAccount;

  /// Text button label to start password reset
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPassword;

  /// Title for the forgot password screen
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get forgotPasswordTitle;

  /// Instructions for the forgot password form
  ///
  /// In en, this message translates to:
  /// **'Enter the email for your account and we\'ll send a reset link.'**
  String get forgotPasswordInstructions;

  /// Button label to send password reset email
  ///
  /// In en, this message translates to:
  /// **'Send reset email'**
  String get sendResetEmail;

  /// Confirmation message after sending password reset email
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent. Check your inbox.'**
  String get passwordResetEmailSent;

  /// Title for the reset password screen
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPasswordTitle;

  /// Instructions for the reset password form
  ///
  /// In en, this message translates to:
  /// **'Choose a new password for your account.'**
  String get resetPasswordInstructions;

  /// Button label for updating the password
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get updatePassword;

  /// Confirmation message after updating password
  ///
  /// In en, this message translates to:
  /// **'Your password has been updated.'**
  String get passwordUpdatedSuccess;

  /// Validation error when confirm password is missing
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get resetPasswordConfirmRequired;

  /// Validation error when passwords do not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get resetPasswordMismatch;

  /// Title shown after email confirmation
  ///
  /// In en, this message translates to:
  /// **'Email confirmed'**
  String get emailConfirmedTitle;

  /// Body message after email confirmation
  ///
  /// In en, this message translates to:
  /// **'Your email has been verified. You can now log in.'**
  String get emailConfirmedMessage;

  /// Message instructing user to confirm email
  ///
  /// In en, this message translates to:
  /// **'Confirm your email to continue.'**
  String get confirmEmailMessage;

  /// App bar title to go back to login
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// Section title for sign ups
  ///
  /// In en, this message translates to:
  /// **'Sign Ups'**
  String get signUps;

  /// Button label to save event
  ///
  /// In en, this message translates to:
  /// **'Save Event'**
  String get saveEvent;

  /// Empty state message for sign up list
  ///
  /// In en, this message translates to:
  /// **'No sign ups yet'**
  String get noSignUpsYet;

  /// Error message when attendees fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendees'**
  String get failedToLoadAttendees;

  /// Generic error message when no details are provided
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get genericError;

  /// Message shown after requesting email confirmation
  ///
  /// In en, this message translates to:
  /// **'An email has been sent to your inbox.'**
  String get emailSentToInbox;

  /// Snackbar message after saving profile
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdatedSuccessfully;

  /// Button label to cancel a sign up
  ///
  /// In en, this message translates to:
  /// **'Cancel Sign Up'**
  String get cancelSignUp;

  /// Error label prefix with message
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorWithMessage(String message);

  /// Empty state for paginated list default
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// Label for phone number field
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Onboarding prompt for address
  ///
  /// In en, this message translates to:
  /// **'Enter Your Address'**
  String get enterYourAddress;

  /// Label for street address field
  ///
  /// In en, this message translates to:
  /// **'Street Address'**
  String get streetAddress;

  /// Label for city field
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Label for state field
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// Label for postal code field
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postalCode;

  /// Label for password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label for confirm password field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Onboarding section title for user details
  ///
  /// In en, this message translates to:
  /// **'Enter Your Details'**
  String get enterYourDetails;

  /// Label for first name field
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Label for last name field
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Label for age group segmented control
  ///
  /// In en, this message translates to:
  /// **'Age Group'**
  String get ageGroup;

  /// Secondary address line helper label
  ///
  /// In en, this message translates to:
  /// **'Apartment/Suite/Floor (optional)'**
  String get apartmentSuiteOptional;

  /// Secondary address line label (alias of apartment/suite/floor)
  ///
  /// In en, this message translates to:
  /// **'Street Address 2'**
  String get streetAddress2;

  /// Button label to go to next onboarding page
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Button label to go to the previous page
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Button label to submit the onboarding form
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Status label indicating the user is signed up for the event
  ///
  /// In en, this message translates to:
  /// **'Signed up'**
  String get signedUp;

  /// Status/message indicating the event is no longer available
  ///
  /// In en, this message translates to:
  /// **'No longer available'**
  String get noLongerAvailable;

  /// Login screen welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome back! Please login to continue.'**
  String get welcomeBackMessage;

  /// Label for event name field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Label for event description field when optional
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get descriptionOptional;

  /// Label for event start date/time field
  ///
  /// In en, this message translates to:
  /// **'Start Day/Time'**
  String get startDateTime;

  /// Label for event end date/time field
  ///
  /// In en, this message translates to:
  /// **'End Day/Time'**
  String get endDateTime;

  /// Button label to change the app language during onboarding
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// Title for onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Welcome to AnyStep'**
  String get onboardingWelcomeTitle;

  /// Description for onboarding welcome page
  ///
  /// In en, this message translates to:
  /// **'Track and discover volunteer events easily.'**
  String get onboardingWelcomeDesc;

  /// Title for onboarding notifications page
  ///
  /// In en, this message translates to:
  /// **'Stay in the Loop'**
  String get onboardingNotificationsTitle;

  /// Description for onboarding notifications page
  ///
  /// In en, this message translates to:
  /// **'Get a heads-up when new events are added.'**
  String get onboardingNotificationsDesc;

  /// Title for onboarding find events page
  ///
  /// In en, this message translates to:
  /// **'Find Events'**
  String get onboardingFindEventsTitle;

  /// Description for onboarding find events page
  ///
  /// In en, this message translates to:
  /// **'Browse nearby opportunities that fit your passion.'**
  String get onboardingFindEventsDesc;

  /// Title for onboarding impact page
  ///
  /// In en, this message translates to:
  /// **'Make an Impact'**
  String get onboardingImpactTitle;

  /// Description for onboarding impact page
  ///
  /// In en, this message translates to:
  /// **'Join events and measure the difference you make.'**
  String get onboardingImpactDesc;

  /// Settings label for notifications page and toggle
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettingsTitle;

  /// Title for About page and settings link
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// Short description shown on About page
  ///
  /// In en, this message translates to:
  /// **'AnyStep helps volunteers find and track community service opportunities.'**
  String get aboutDescription;

  /// Label for Instagram link
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get aboutInstagram;

  /// Label for LinkedIn link
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get aboutLinkedIn;

  /// Label for Facebook link
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get aboutFacebook;

  /// Label for X (formerly Twitter) link
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get aboutX;

  /// Title for the expandable About story section
  ///
  /// In en, this message translates to:
  /// **'Our Story'**
  String get aboutStoryTitle;

  /// Intro paragraph for About story
  ///
  /// In en, this message translates to:
  /// **'At the heart of Any Step Community Services lies a story of personal conviction and a shared commitment to making a difference. Our founder Sydney and her husband Sherman Diggs draw their passion for alleviating food insecurity from profound personal experiences.'**
  String get aboutStoryIntro;

  /// Heading for Sydney story
  ///
  /// In en, this message translates to:
  /// **'Sydney\'s Story: A Witness to Resilience'**
  String get aboutStorySydneyTitle;

  /// Body paragraph for Sydney story
  ///
  /// In en, this message translates to:
  /// **'Raised in a single-parent home after her parents\' divorce, Sydney observed her mother navigate life with unwavering determination. Working tirelessly as a gerontological nurse for over thirty years, Sydney\'s mother faced the challenge of surviving on meager Social Security benefits. Witnessing her mother\'s daily struggle ignited Sydney\'s determination to make a difference. Without the support of Sydney and her husband Sherman, her mother would have faced an even more challenging journey to secure nutritious food.'**
  String get aboutStorySydneyBody;

  /// Heading for Sherman story
  ///
  /// In en, this message translates to:
  /// **'Sherman\'s Journey: From Poverty to Advocacy'**
  String get aboutStoryShermanTitle;

  /// Body paragraph for Sherman story
  ///
  /// In en, this message translates to:
  /// **'As the youngest of thirteen, Sherman\'s upbringing was marked by the hardships of a single-parent household after his parents separated. Personally acquainted with the realities of poverty and hunger, Sherman\'s life experiences became the driving force behind his unwavering passion for ensuring food equity for all.'**
  String get aboutStoryShermanBody;

  /// Heading for Costa Rica story
  ///
  /// In en, this message translates to:
  /// **'A Turning Point: Impactful Journey to Costa Rica'**
  String get aboutStoryCostaRicaTitle;

  /// Body paragraph for Costa Rica story
  ///
  /// In en, this message translates to:
  /// **'In 2016, the Diggs embarked on a transformative journey with their dear friends Michael and Seidy Trent to Costa Rica. Inspired by the experience, Sydney organized a visit to an elder facility in Heredia, Costa Rica. The couple generously donated undergarments, hygienic products, and sandals, recognizing the immense need within the community. The impact of this trip prompted Sydney to return to Costa Rica with even more donations, this time filling the local food pantry.'**
  String get aboutStoryCostaRicaBody;

  /// Heading for local focus story
  ///
  /// In en, this message translates to:
  /// **'A Local Focus: Bridging the Gap for North Texas Seniors'**
  String get aboutStoryLocalTitle;

  /// Body paragraph for local focus story
  ///
  /// In en, this message translates to:
  /// **'Spurred by their experiences abroad and a deep-rooted sense of responsibility, Sydney and Sherman redirected their efforts towards supporting seniors in North Texas who lacked family and resources. Acknowledging the increasing challenges faced by poor and disadvantaged seniors in accessing essential services, Sydney, with the unwavering support of Sherman, founded Any Step Community Services.'**
  String get aboutStoryLocalBody;

  /// Settings label for event notification toggle
  ///
  /// In en, this message translates to:
  /// **'Event notifications'**
  String get eventNotificationsTitle;

  /// Settings helper text for event notification toggle
  ///
  /// In en, this message translates to:
  /// **'Notify me when a new event is added.'**
  String get eventNotificationsDescription;

  /// Success text shown when user is already onboarded
  ///
  /// In en, this message translates to:
  /// **'Onboarding Complete!'**
  String get onboardingCompleteTitle;

  /// Button label to navigate to event feed from onboarding complete
  ///
  /// In en, this message translates to:
  /// **'Go to Event Feed'**
  String get goToEventFeed;

  /// Button label to skip to final onboarding page
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// Final onboarding button label
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Title for sign agreement page
  ///
  /// In en, this message translates to:
  /// **'Volunteer Agreement'**
  String get volunteerAgreementTitle;

  /// Button label to sign agreement
  ///
  /// In en, this message translates to:
  /// **'Tap to sign'**
  String get tapToSign;

  /// Text shown when field is optional
  ///
  /// In en, this message translates to:
  /// **'optional'**
  String get optional;

  /// Error shown when a required field is empty
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validatorRequired;

  /// Error for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get validatorEmail;

  /// Generic password validation error
  ///
  /// In en, this message translates to:
  /// **'Password must meet the requirements'**
  String get validatorPassword;

  /// Error for invalid first name
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid first name'**
  String get validatorFirstName;

  /// Error for invalid last name
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid last name'**
  String get validatorLastName;

  /// Error for invalid phone number
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validatorPhoneNumber;

  /// Error for invalid street address
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid street address'**
  String get validatorStreet;

  /// Error for invalid city
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid city'**
  String get validatorCity;

  /// Error for invalid state
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid state'**
  String get validatorState;

  /// Error for invalid postal/zip code
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid postal code'**
  String get validatorZipCode;

  /// Empty state title when there are no events
  ///
  /// In en, this message translates to:
  /// **'No events found'**
  String get noEventsFound;

  /// Helper text encouraging the user to return later
  ///
  /// In en, this message translates to:
  /// **'Check back later for updates'**
  String get checkBackLater;

  /// Empty state when no users are available
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// Text when search field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter a search term to find events.'**
  String get enterSearchTerm;

  /// Label for volunteer eligible event toggle
  ///
  /// In en, this message translates to:
  /// **'Volunteer Event'**
  String get volunteerEventLabel;

  /// Help text for volunteer eligible event toggle
  ///
  /// In en, this message translates to:
  /// **'This event is eligible for volunteer hours'**
  String get volunteerEventHelp;

  /// Section title for advanced event form options
  ///
  /// In en, this message translates to:
  /// **'Advanced Options'**
  String get advancedOptions;

  /// Label for max volunteers field
  ///
  /// In en, this message translates to:
  /// **'Max Volunteers (optional)'**
  String get maxVolunteersOptional;

  /// Label for registration deadline field
  ///
  /// In en, this message translates to:
  /// **'Registration Deadline (optional)'**
  String get registrationDeadlineOptional;

  /// Label for registration deadline display
  ///
  /// In en, this message translates to:
  /// **'Registration Deadline'**
  String get registrationDeadline;

  /// Label for external link field
  ///
  /// In en, this message translates to:
  /// **'External Link (optional)'**
  String get externalLinkOptional;

  /// Label for external link list tile
  ///
  /// In en, this message translates to:
  /// **'External Link'**
  String get externalLink;

  /// Label for sign up button when registration deadline has passed
  ///
  /// In en, this message translates to:
  /// **'Registration closed'**
  String get registrationClosed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

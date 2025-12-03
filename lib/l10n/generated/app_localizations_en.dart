// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AnyStep Community Services';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeAuto => 'Auto';

  @override
  String get themeLight => 'Light Mode';

  @override
  String get themeDark => 'Dark Mode';

  @override
  String get languageLabel => 'Language';

  @override
  String get systemDefault => 'System Default';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get logout => 'Logout';

  @override
  String get login => 'Login';

  @override
  String get reportsTitle => 'Volunteer Reports';

  @override
  String get exportCsv => 'Export CSV';

  @override
  String get rangeThisMonth => 'This Month';

  @override
  String get rangeYtd => 'YTD';

  @override
  String rangeCustom(String start, String end) {
    return 'Custom: $start → $end';
  }

  @override
  String get noDataInRange => 'No data in selected range';

  @override
  String reportsCount(int count) {
    return 'Reports ($count)';
  }

  @override
  String errorLoadingReports(String error) {
    return 'Error loading reports: $error';
  }

  @override
  String get eventDetailTitle => 'Event Detail';

  @override
  String get completed => 'Completed';

  @override
  String get description => 'Description';

  @override
  String get noDescription => 'No description';

  @override
  String get address => 'Address';

  @override
  String get noAddressProvided => 'No address provided';

  @override
  String get start => 'Start';

  @override
  String get end => 'End';

  @override
  String hours(int count, String plural) {
    return '$count hour$plural';
  }

  @override
  String get signUp => 'Sign up';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get eventFeed => 'Event Feed';

  @override
  String get searchEvents => 'Search events';

  @override
  String get cancel => 'Cancel';

  @override
  String get recentEvents => 'Recent Events';

  @override
  String get upcomingEvents => 'Upcoming Events';

  @override
  String get eventCreated => 'Event created successfully';

  @override
  String get createEvent => 'Create Event';

  @override
  String get navReports => 'Reports';

  @override
  String get navSeeMore => 'See More';

  @override
  String get navEvents => 'Events';

  @override
  String get retry => 'Retry';

  @override
  String get failedToLoad => 'Failed to load';

  @override
  String get tapToPickImage => 'Tap to pick image';

  @override
  String get attendees => 'Attendees';

  @override
  String get noAttendees => 'No attendees';

  @override
  String get profileTitle => 'Profile';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get dateJoined => 'Date Joined';

  @override
  String get save => 'Save';

  @override
  String get dontHaveAccount => 'Don\'t have an account? Sign Up';

  @override
  String get confirmEmailMessage => 'Confirm your email to continue.';

  @override
  String get backToLogin => 'Back to Login';

  @override
  String get signUps => 'Sign Ups';

  @override
  String get saveEvent => 'Save Event';

  @override
  String get noSignUpsYet => 'No sign ups yet';

  @override
  String get failedToLoadAttendees => 'Failed to load attendees';

  @override
  String get genericError => 'Something went wrong.';

  @override
  String get emailSentToInbox => 'An email has been sent to your inbox.';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully';

  @override
  String get cancelSignUp => 'Cancel Sign Up';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get noItemsFound => 'No items found';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get enterYourAddress => 'Enter Your Address';

  @override
  String get streetAddress => 'Street Address';

  @override
  String get city => 'City';

  @override
  String get state => 'State';

  @override
  String get postalCode => 'Postal Code';

  @override
  String get password => 'Password';

  @override
  String get enterYourDetails => 'Enter Your Details';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get ageGroup => 'Age Group';

  @override
  String get apartmentSuiteOptional => 'Apartment/Suite/Floor (optional)';

  @override
  String get streetAddress2 => 'Street Address 2';

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get submit => 'Submit';

  @override
  String get signedUp => 'Signed up';

  @override
  String get noLongerAvailable => 'No longer available';

  @override
  String get welcomeBackMessage => 'Welcome back! Please login to continue.';

  @override
  String get nameLabel => 'Name';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get startDateTime => 'Start Day/Time';

  @override
  String get endDateTime => 'End Day/Time';
}

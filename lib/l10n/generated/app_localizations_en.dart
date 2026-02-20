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
  String get welcomeMessageTitle => 'Welcome';

  @override
  String get welcomeMessageDismiss => 'Got it';

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
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get reportsTitle => 'Reports';

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
  String get shareAction => 'Share';

  @override
  String get editEventAction => 'Edit event';

  @override
  String get stopEditingAction => 'Stop editing';

  @override
  String get addToCalendarTitle => 'Add Event to Calendar';

  @override
  String get addToCalendarBody =>
      'Save this event to your Google Calendar so you don\'t miss it.';

  @override
  String get addToCalendarCta => 'Add to Google Calendar';

  @override
  String get addToCalendarDismiss => 'Not now';

  @override
  String get addToCalendarMenuItem => 'Add to Calendar';

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
  String get addressSaved => 'Address saved.';

  @override
  String get addressSaveFailed => 'Couldn\'t save address.';

  @override
  String get notificationSettingsUpdated => 'Notification settings updated.';

  @override
  String get notificationSettingsUpdateFailed =>
      'Couldn\'t update notification settings.';

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
  String get dashboardYourVolunteering => 'Your Volunteering';

  @override
  String get dashboardVolunteerMetrics => 'Volunteer Metrics';

  @override
  String get dashboardRecentEvents => 'Recent Events';

  @override
  String get dashboardUpcomingEvents => 'Upcoming Events';

  @override
  String get dashboardHoursThisMonth => 'Hours (This Month)';

  @override
  String get dashboardHoursYtd => 'Hours (YTD)';

  @override
  String get dashboardEventsThisMonth => 'Events (This Month)';

  @override
  String get dashboardEventsYtd => 'Events (YTD)';

  @override
  String get dashboardVolunteersThisMonth => 'Volunteers (This Month)';

  @override
  String get dashboardVolunteersYtd => 'Volunteers (YTD)';

  @override
  String get dashboardNoMetrics => 'No metrics yet. Keep building impact!';

  @override
  String get dashboardCalendar => 'Calendar';

  @override
  String get dashboardNoEventsCalendar => 'No events for this day';

  @override
  String get notEligibleVolunteerHours => 'Not eligible for volunteer hours';

  @override
  String get eventFeed => 'Event Feed';

  @override
  String get search => 'Search';

  @override
  String get searchAddress => 'Search address';

  @override
  String get startTypingAddress => 'Start typing an address';

  @override
  String get noMatchesFound => 'No matches found';

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
  String get blogTitle => 'Blog';

  @override
  String get blogEmptyState =>
      'No channels yet. Admins can create the first channel.';

  @override
  String get blogCreateChannel => 'Create Channel';

  @override
  String get blogChannelTitle => 'Channel';

  @override
  String blogChannelPlaceholder(int id) {
    return 'Channel #$id details coming soon.';
  }

  @override
  String get blogCreateChannelPlaceholder =>
      'Channel creation form coming soon.';

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
  String get forgotPassword => 'Forgot your password?';

  @override
  String get forgotPasswordTitle => 'Reset your password';

  @override
  String get forgotPasswordInstructions =>
      'Enter the email for your account and we\'ll send a reset link.';

  @override
  String get sendResetEmail => 'Send reset email';

  @override
  String get passwordResetEmailSent =>
      'Password reset email sent. Check your inbox.';

  @override
  String get resetPasswordTitle => 'Reset password';

  @override
  String get resetPasswordInstructions =>
      'Choose a new password for your account.';

  @override
  String get updatePassword => 'Update password';

  @override
  String get passwordUpdatedSuccess => 'Your password has been updated.';

  @override
  String get resetPasswordConfirmRequired => 'Please confirm your password';

  @override
  String get resetPasswordMismatch => 'Passwords do not match';

  @override
  String get emailConfirmedTitle => 'Email confirmed';

  @override
  String get emailConfirmedMessage =>
      'Your email has been verified. You can now log in.';

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
  String get confirmPassword => 'Confirm Password';

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

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get onboardingWelcomeTitle => 'Welcome to AnyStep';

  @override
  String get onboardingWelcomeDesc =>
      'Track and discover volunteer events easily.';

  @override
  String get onboardingNotificationsTitle => 'Stay in the Loop';

  @override
  String get onboardingNotificationsDesc =>
      'Get a heads-up when new events are added.';

  @override
  String get onboardingFindEventsTitle => 'Find Events';

  @override
  String get onboardingFindEventsDesc =>
      'Browse nearby opportunities that fit your passion.';

  @override
  String get onboardingImpactTitle => 'Make an Impact';

  @override
  String get onboardingImpactDesc =>
      'Join events and measure the difference you make.';

  @override
  String get notificationSettingsTitle => 'Notification Settings';

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutDescription =>
      'AnyStep helps volunteers find and track community service opportunities.';

  @override
  String get aboutInstagram => 'Instagram';

  @override
  String get aboutLinkedIn => 'LinkedIn';

  @override
  String get aboutFacebook => 'Facebook';

  @override
  String get aboutX => 'X';

  @override
  String get aboutStoryTitle => 'Our Story';

  @override
  String get aboutStoryIntro =>
      'At the heart of Any Step Community Services lies a story of personal conviction and a shared commitment to making a difference. Our founder Sydney and her husband Sherman Diggs draw their passion for alleviating food insecurity from profound personal experiences.';

  @override
  String get aboutStorySydneyTitle =>
      'Sydney\'s Story: A Witness to Resilience';

  @override
  String get aboutStorySydneyBody =>
      'Raised in a single-parent home after her parents\' divorce, Sydney observed her mother navigate life with unwavering determination. Working tirelessly as a gerontological nurse for over thirty years, Sydney\'s mother faced the challenge of surviving on meager Social Security benefits. Witnessing her mother\'s daily struggle ignited Sydney\'s determination to make a difference. Without the support of Sydney and her husband Sherman, her mother would have faced an even more challenging journey to secure nutritious food.';

  @override
  String get aboutStoryShermanTitle =>
      'Sherman\'s Journey: From Poverty to Advocacy';

  @override
  String get aboutStoryShermanBody =>
      'As the youngest of thirteen, Sherman\'s upbringing was marked by the hardships of a single-parent household after his parents separated. Personally acquainted with the realities of poverty and hunger, Sherman\'s life experiences became the driving force behind his unwavering passion for ensuring food equity for all.';

  @override
  String get aboutStoryCostaRicaTitle =>
      'A Turning Point: Impactful Journey to Costa Rica';

  @override
  String get aboutStoryCostaRicaBody =>
      'In 2016, the Diggs embarked on a transformative journey with their dear friends Michael and Seidy Trent to Costa Rica. Inspired by the experience, Sydney organized a visit to an elder facility in Heredia, Costa Rica. The couple generously donated undergarments, hygienic products, and sandals, recognizing the immense need within the community. The impact of this trip prompted Sydney to return to Costa Rica with even more donations, this time filling the local food pantry.';

  @override
  String get aboutStoryLocalTitle =>
      'A Local Focus: Bridging the Gap for North Texas Seniors';

  @override
  String get aboutStoryLocalBody =>
      'Spurred by their experiences abroad and a deep-rooted sense of responsibility, Sydney and Sherman redirected their efforts towards supporting seniors in North Texas who lacked family and resources. Acknowledging the increasing challenges faced by poor and disadvantaged seniors in accessing essential services, Sydney, with the unwavering support of Sherman, founded Any Step Community Services.';

  @override
  String get eventNotificationsTitle => 'Event notifications';

  @override
  String get eventNotificationsDescription =>
      'Notify me when a new event is added.';

  @override
  String get onboardingCompleteTitle => 'Onboarding Complete!';

  @override
  String get goToEventFeed => 'Go to Event Feed';

  @override
  String get skip => 'Skip';

  @override
  String get getStarted => 'Get Started';

  @override
  String get volunteerAgreementTitle => 'Volunteer Agreement';

  @override
  String get tapToSign => 'Tap to sign';

  @override
  String get optional => 'optional';

  @override
  String get validatorRequired => 'This field is required';

  @override
  String get validatorEmail => 'Please enter a valid email address';

  @override
  String get validatorPassword => 'Password must meet the requirements';

  @override
  String get validatorFirstName => 'Please enter a valid first name';

  @override
  String get validatorLastName => 'Please enter a valid last name';

  @override
  String get validatorPhoneNumber => 'Please enter a valid phone number';

  @override
  String get validatorStreet => 'Please enter a valid street address';

  @override
  String get validatorCity => 'Please enter a valid city';

  @override
  String get validatorState => 'Please enter a valid state';

  @override
  String get validatorZipCode => 'Please enter a valid postal code';

  @override
  String get noEventsFound => 'No events found';

  @override
  String get checkBackLater => 'Check back later for updates';

  @override
  String get noUsersFound => 'No users found';

  @override
  String get enterSearchTerm => 'Please enter a search term to find events.';

  @override
  String get volunteerEventLabel => 'Volunteer Event';

  @override
  String get volunteerEventHelp => 'This event is eligible for volunteer hours';

  @override
  String get advancedOptions => 'Advanced Options';

  @override
  String get maxVolunteersOptional => 'Max Volunteers (optional)';

  @override
  String get registrationDeadlineOptional => 'Registration Deadline (optional)';

  @override
  String get registrationDeadline => 'Registration Deadline';

  @override
  String get externalLinkOptional => 'External Link (optional)';

  @override
  String get externalLink => 'External Link';

  @override
  String get registrationClosed => 'Registration closed';
}

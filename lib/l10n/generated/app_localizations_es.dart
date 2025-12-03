// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Servicios Comunitarios AnyStep';

  @override
  String welcomeUser(String name) {
    return '¡Bienvenido, $name!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
      zero: 'No hay elementos',
    );
    return '$_temp0';
  }

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeAuto => 'Automático';

  @override
  String get themeLight => 'Modo claro';

  @override
  String get themeDark => 'Modo oscuro';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get systemDefault => 'Predeterminado del sistema';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get accountSettings => 'Configuración de la cuenta';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get reportsTitle => 'Informes de voluntarios';

  @override
  String get exportCsv => 'Exportar CSV';

  @override
  String get rangeThisMonth => 'Este mes';

  @override
  String get rangeYtd => 'Año actual';

  @override
  String rangeCustom(String start, String end) {
    return 'Personalizado: $start → $end';
  }

  @override
  String get noDataInRange => 'No hay datos en el rango seleccionado';

  @override
  String reportsCount(int count) {
    return 'Informes ($count)';
  }

  @override
  String errorLoadingReports(String error) {
    return 'Error al cargar informes: $error';
  }

  @override
  String get eventDetailTitle => 'Detalle del evento';

  @override
  String get completed => 'Completado';

  @override
  String get description => 'Descripción';

  @override
  String get noDescription => 'Sin descripción';

  @override
  String get address => 'Dirección';

  @override
  String get noAddressProvided => 'No se proporcionó dirección';

  @override
  String get start => 'Inicio';

  @override
  String get end => 'Fin';

  @override
  String hours(int count, String plural) {
    return '$count hora$plural';
  }

  @override
  String get signUp => 'Registrarse';

  @override
  String get dashboard => 'Panel';

  @override
  String get eventFeed => 'Eventos';

  @override
  String get searchEvents => 'Buscar eventos';

  @override
  String get cancel => 'Cancelar';

  @override
  String get recentEvents => 'Eventos recientes';

  @override
  String get upcomingEvents => 'Próximos eventos';

  @override
  String get eventCreated => '¡Evento creado exitosamente!';

  @override
  String get createEvent => 'Crear evento';

  @override
  String get navReports => 'Informes';

  @override
  String get navSeeMore => 'Más';

  @override
  String get navEvents => 'Eventos';

  @override
  String get retry => 'Reintentar';

  @override
  String get failedToLoad => 'Error al cargar';

  @override
  String get tapToPickImage => 'Toca para elegir una imagen';

  @override
  String get attendees => 'Asistentes';

  @override
  String get noAttendees => 'No hay asistentes';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get email => 'Correo electrónico';

  @override
  String get phone => 'Teléfono';

  @override
  String get dateJoined => 'Fecha de ingreso';

  @override
  String get save => 'Guardar';

  @override
  String get dontHaveAccount => '¿No tienes cuenta? Regístrate';

  @override
  String get confirmEmailMessage => 'Confirma tu correo para continuar.';

  @override
  String get backToLogin => 'Volver al inicio de sesión';

  @override
  String get signUps => 'Inscripciones';

  @override
  String get saveEvent => 'Guardar evento';

  @override
  String get noSignUpsYet => 'Aún no hay inscripciones';

  @override
  String get failedToLoadAttendees => 'Error al cargar asistentes';

  @override
  String get genericError => 'Algo salió mal.';

  @override
  String get emailSentToInbox =>
      'Se ha enviado un correo a tu bandeja de entrada.';

  @override
  String get profileUpdatedSuccessfully => 'Perfil actualizado correctamente';

  @override
  String get cancelSignUp => 'Cancelar inscripción';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get noItemsFound => 'No hay elementos';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get enterYourAddress => 'Ingresa tu dirección';

  @override
  String get streetAddress => 'Dirección';

  @override
  String get city => 'Ciudad';

  @override
  String get state => 'Estado';

  @override
  String get postalCode => 'Código postal';

  @override
  String get password => 'Contraseña';

  @override
  String get enterYourDetails => 'Ingresa tus datos';

  @override
  String get firstName => 'Nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get ageGroup => 'Grupo de edad';

  @override
  String get apartmentSuiteOptional => 'Apartamento/Unidad/Piso (opcional)';

  @override
  String get streetAddress2 => 'Dirección (línea 2)';

  @override
  String get next => 'Siguiente';

  @override
  String get back => 'Atrás';

  @override
  String get submit => 'Enviar';

  @override
  String get signedUp => 'Inscrito';

  @override
  String get noLongerAvailable => 'Ya no disponible';

  @override
  String get welcomeBackMessage =>
      '¡Bienvenido de nuevo! Inicia sesión para continuar.';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get descriptionOptional => 'Descripción (opcional)';

  @override
  String get startDateTime => 'Inicio (fecha/hora)';

  @override
  String get endDateTime => 'Fin (fecha/hora)';

  @override
  String get changeLanguage => 'Cambiar idioma';

  @override
  String get onboardingWelcomeTitle => 'Bienvenido a AnyStep';

  @override
  String get onboardingWelcomeDesc =>
      'Explora y descubre fácilmente eventos de voluntariado.';

  @override
  String get onboardingFindEventsTitle => 'Buscar eventos';

  @override
  String get onboardingFindEventsDesc =>
      'Explora oportunidades cercanas que se ajusten a tu pasión.';

  @override
  String get onboardingImpactTitle => 'Genera impacto';

  @override
  String get onboardingImpactDesc =>
      'Únete a eventos y mide la diferencia que generas.';

  @override
  String get onboardingCompleteTitle => '¡Onboarding completado!';

  @override
  String get goToEventFeed => 'Ir al feed de eventos';

  @override
  String get skip => 'Saltar';

  @override
  String get getStarted => 'Comenzar';
}

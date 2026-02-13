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
  String get reportsTitle => 'Informes';

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
  String get shareAction => 'Compartir';

  @override
  String get editEventAction => 'Editar evento';

  @override
  String get stopEditingAction => 'Dejar de editar';

  @override
  String get addToCalendarTitle => 'Agregar evento al calendario';

  @override
  String get addToCalendarBody =>
      'Guarda este evento en tu Google Calendar para que no se te pase.';

  @override
  String get addToCalendarCta => 'Agregar a Google Calendar';

  @override
  String get addToCalendarDismiss => 'Ahora no';

  @override
  String get addToCalendarMenuItem => 'Agregar al calendario';

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
  String get dashboardYourVolunteering => 'Tu voluntariado';

  @override
  String get dashboardVolunteerMetrics => 'Métricas de voluntariado';

  @override
  String get dashboardRecentEvents => 'Eventos recientes';

  @override
  String get dashboardUpcomingEvents => 'Próximos eventos';

  @override
  String get dashboardHoursThisMonth => 'Horas (este mes)';

  @override
  String get dashboardHoursYtd => 'Horas (año a la fecha)';

  @override
  String get dashboardEventsThisMonth => 'Eventos (este mes)';

  @override
  String get dashboardEventsYtd => 'Eventos (año a la fecha)';

  @override
  String get dashboardVolunteersThisMonth => 'Voluntarios (este mes)';

  @override
  String get dashboardVolunteersYtd => 'Voluntarios (año a la fecha)';

  @override
  String get dashboardNoMetrics =>
      'Aún no hay métricas. ¡Sigue creando impacto!';

  @override
  String get dashboardCalendar => 'Calendario';

  @override
  String get dashboardNoEventsCalendar => 'No hay eventos para este día';

  @override
  String get notEligibleVolunteerHours =>
      'No elegible para horas de voluntariado';

  @override
  String get eventFeed => 'Eventos';

  @override
  String get search => 'Buscar';

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
  String get blogTitle => 'Blog';

  @override
  String get blogEmptyState =>
      'Aún no hay canales. Los administradores pueden crear el primero.';

  @override
  String get blogCreateChannel => 'Crear canal';

  @override
  String get blogChannelTitle => 'Canal';

  @override
  String blogChannelPlaceholder(int id) {
    return 'Detalles del canal #$id próximamente.';
  }

  @override
  String get blogCreateChannelPlaceholder =>
      'El formulario de creación de canal estará disponible pronto.';

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
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get forgotPasswordTitle => 'Restablecer contraseña';

  @override
  String get forgotPasswordInstructions =>
      'Ingresa el correo asociado a tu cuenta y te enviaremos un enlace para restablecerla.';

  @override
  String get sendResetEmail => 'Enviar correo de restablecimiento';

  @override
  String get passwordResetEmailSent =>
      'Se envió el correo para restablecer la contraseña. Revisa tu bandeja de entrada.';

  @override
  String get resetPasswordTitle => 'Restablecer contraseña';

  @override
  String get resetPasswordInstructions =>
      'Elige una nueva contraseña para tu cuenta.';

  @override
  String get updatePassword => 'Actualizar contraseña';

  @override
  String get passwordUpdatedSuccess => 'Tu contraseña ha sido actualizada.';

  @override
  String get resetPasswordConfirmRequired => 'Confirma tu contraseña';

  @override
  String get resetPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get emailConfirmedTitle => 'Correo confirmado';

  @override
  String get emailConfirmedMessage =>
      'Tu correo fue verificado. Ya puedes iniciar sesión.';

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
  String get confirmPassword => 'Confirmar contraseña';

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
  String get onboardingNotificationsTitle => 'Mantente al tanto';

  @override
  String get onboardingNotificationsDesc =>
      'Recibe un aviso cuando se agreguen nuevos eventos.';

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
  String get eventNotificationsTitle => 'Notificaciones de eventos';

  @override
  String get eventNotificationsDescription =>
      'Avísame cuando se agregue un nuevo evento.';

  @override
  String get onboardingCompleteTitle => '¡Onboarding completado!';

  @override
  String get goToEventFeed => 'Ir al feed de eventos';

  @override
  String get skip => 'Saltar';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get volunteerAgreementTitle => 'Acuerdo de Voluntariado';

  @override
  String get tapToSign => 'Toca para firmar';

  @override
  String get validatorRequired => 'Este campo es obligatorio';

  @override
  String get validatorEmail => 'Ingresa un correo electrónico válido';

  @override
  String get validatorPassword => 'La contraseña no cumple los requisitos';

  @override
  String get validatorFirstName => 'Ingresa un nombre válido';

  @override
  String get validatorLastName => 'Ingresa un apellido válido';

  @override
  String get validatorPhoneNumber => 'Ingresa un número de teléfono válido';

  @override
  String get validatorStreet => 'Ingresa una dirección válida';

  @override
  String get validatorCity => 'Ingresa una ciudad válida';

  @override
  String get validatorState => 'Ingresa un estado válido';

  @override
  String get validatorZipCode => 'Ingresa un código postal válido';

  @override
  String get noEventsFound => 'No hay eventos';

  @override
  String get checkBackLater => 'Vuelve más tarde para ver actualizaciones';

  @override
  String get noUsersFound => 'No hay usuarios';

  @override
  String get enterSearchTerm =>
      'Ingresa un término de búsqueda para encontrar eventos.';
}

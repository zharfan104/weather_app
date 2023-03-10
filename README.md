# Flutter Weather App Example

An example Flutter weather app using the [OpenWeatherMap API](https://openweathermap.org/api).

## Screenshot/Video
![Screenshot 2023-02-18 at 14 09 08](https://user-images.githubusercontent.com/39690358/219846859-36299695-2660-4e75-b895-0fbfab27453d.png)

https://user-images.githubusercontent.com/39690358/219846970-b978b8e8-7e79-4acc-9a70-81cc81bb7178.mov


## Supported Features

- [x] Current weather (condition and temperature)
- [x] 5-day weather forecast
- [x] Search by city

## App Architecture

The app is composed by two main layers.

### Data Layer

The data layer contains a single weather repository that is used to fetch weather data from the [OpenWeatherMap API](https://openweathermap.org/api).

The data is then parsed (using Freezed) and returned using **type-safe** model classes (`WeatherModel` and `ForecastModel`).

### Presentation Layer

This layer holds all the widgets, along with their cubit.

Widgets do not communicate directly with the repository.

Instead, they watch some cubit.

### Packages in use

- [bloc](https://pub.dev/packages/bloc) for state management
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images
- [copy_with_extension](https://pub.dev/packages/copy_with_extension) for generating `copyWith` methods
- [dio](https://pub.dev/packages/dio) for talking to the REST API
- [equatable](https://pub.dev/packages/equatable) for creating objects that can be easily compared
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for integrating `bloc` with Flutter
- [freezed_annotation](https://pub.dev/packages/freezed_annotation) for code generation (data models)
- [get_it](https://pub.dev/packages/get_it) for dependency injection
- [injectable](https://pub.dev/packages/injectable) for creating injectable classes
- [intl](https://pub.dev/packages/intl) for internationalizing Flutter apps
- [json_annotation](https://pub.dev/packages/json_annotation) for JSON serialization/deserialization
- [retrofit](https://pub.dev/packages/retrofit) for type-safe HTTP requests

### Dev dependencies

- [bloc_test](https://pub.dev/packages/bloc_test) for testing `bloc` implementations
- [build_runner](https://pub.dev/packages/build_runner) for generating code
- [copy_with_extension_gen](https://pub.dev/packages/copy_with_extension_gen) for generating `copyWith` methods
- [dart_code_metrics](https://pub.dev/packages/dart_code_metrics) for analyzing code metrics
- [flutter_test](https://flutter.dev/docs/testing) for testing Flutter apps
- [freezed](https://pub.dev/packages/freezed) for code generation
- [injectable_generator](https://pub.dev/packages/injectable_generator) for generating injectable classes
- [json_serializable](https://pub.dev/packages/json_serializable) for JSON serialization/deserialization
- [mocktail](https://pub.dev/packages/mocktail) for testing
- [retrofit_generator](https://pub.dev/packages/retrofit_generator) for generating code for the `retrofit` package

## Running the App
To run the app, follow these steps:

1. Clone the repository or download the source code.
2. Open the project in your favorite IDE or text editor.
3. Get an API key from OpenWeatherMap API and replace API_KEY with your own key in the `lib/src/api/api_constants.dart` file.
4. Run flutter pub get to install the dependencies.
5. Run flutter run to start the app on your device or simulator.

That's it! The app should now be running on your device or simulator.

### Testing and Code Coverage
This app has been tested using the mocktail package and has a test coverage of 80.7%.

![Screenshot 2023-02-18 at 14 01 41](https://user-images.githubusercontent.com/39690358/219846530-fc2996b8-59c5-4e81-9985-69cef2fe7b93.png)

## TODO (what will we done after this)

- [ ] Implement localization using [flutter_localization](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
- [ ] Use [flutter_gen](https://pub.dev/packages/flutter_gen) to generate image assets for the app
- [ ] Improve the error UI by displaying a relevant image and message to the user
- [ ] Add more tests to improve code coverage and ensure app stability
- [ ] Implement [AutoRoute](https://pub.dev/packages/auto_route) for declarative routing
- [ ] Check internet connectivity using the [connectivity_plus](https://pub.dev/packages/connectivity_plus) and [internet_connection_checker_plus](https://pub.dev/packages/internet_connection_checker_plus) packages to provide the user with appropriate feedback
- [ ] Create a better loading indicator to improve user experience
- [ ] Improve the error indicator to provide more information to the user about the cause of the error


## Conclusion
With this app, you now have a good example of how to use the OpenWeatherMap API to build a Flutter weather app. You can use this as a starting point for your own weather app or as a learning resource to better understand how to work with APIs and state management in Flutter.

### [LICENSE: MIT](LICENSE.md)

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

## Packages in use

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [freezed](https://pub.dev/packages/freezed) for code generation
- [dio](https://pub.dev/packages/dio) for talking to the REST API
- [cached_network_image](https://pub.dev/packages/cached_network_image) for caching images
- [mocktail](https://pub.dev/packages/mocktail) for testing


### Running the App
To run the app, follow these steps:

1. Clone the repository or download the source code.
2. Open the project in your favorite IDE or text editor.
3. Get an API key from OpenWeatherMap API and replace API_KEY with your own key in the `lib/src/api/api_constants.dart` file.
4. Run flutter pub get to install the dependencies.
5. Run flutter run to start the app on your device or simulator.

That's it! The app should now be running on your device or simulator.

**Note**: to use the API you'll need to register an account and obtain your own API key. This can be set inside `lib/src/api/api_constant.dart`.

### Testing and Code Coverage
This app has been tested using the mocktail package and has a test coverage of 80.7%.

![Screenshot 2023-02-18 at 14 01 41](https://user-images.githubusercontent.com/39690358/219846530-fc2996b8-59c5-4e81-9985-69cef2fe7b93.png)


### Conclusion
With this app, you now have a good example of how to use the OpenWeatherMap API to build a Flutter weather app. You can use this as a starting point for your own weather app or as a learning resource to better understand how to work with APIs and state management in Flutter.

### [LICENSE: MIT](LICENSE.md)

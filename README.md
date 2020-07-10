

## Fluter Spacexopedia ![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2Fthealphamerc) [![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_spacexopedia?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%flutter_spacexopedia) ![GitHub forks](https://img.shields.io/github/forks/TheAlphamerc/flutter_spacexopedia?style=social) 
![Dart CI](https://github.com/TheAlphamerc/flutter_spacexopedia/workflows/Dart%20CI/badge.svg) ![GitHub pull requests](https://img.shields.io/github/issues-pr/TheAlphamerc/flutter_spacexopedia) ![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/Thealphamerc/flutter_spacexopedia) ![GitHub last commit](https://img.shields.io/github/last-commit/Thealphamerc/flutter_spacexopedia)  ![GitHub issues](https://img.shields.io/github/issues-raw/Thealphamerc/flutter_spacexopedia) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/Thealphamerc/flutter_spacexopedia) 

An unofficial SpaceX app powered by the [SpaceX API by r-spacex](https://github.com/r-spacex/SpaceX-API). It shows the information about the upcoming and past launches. There is also a tab for all current, past, and future SpaceX rockets, and for various statistics.

## Features
* Past & upcoming launches and details.
* Tesla Roadster : orbit, speed & distance of the Elon Musk's Tesla Roadster.
* Rockets catalogue: read about all rockets, capsules & ships SpaceX has develop over the years.
* Dragon capsule catalogue: type, diameter, height, weight, capacity,  payload.
* Core & capsules details: more information about each core & capsules launched.

## Download App
<a href="https://play.google.com/store/apps/details?id=com.thealphamerc.flutter_spacexopedia"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" width="200"></img></a>


## Dependencies
<details>
     <summary> Click to expand </summary>
     
* [intl](https://pub.dev/packages/intl)
* [get_it](https://pub.dev/packages/get_it)
* [dio](https://pub.dev/packages/dio)
* [equatable](https://pub.dev/packages/equatable)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [google_fonts](https://pub.dev/packages/google_fonts)
* [cached_network_image](https://pub.dev/packages/cached_network_image)
* [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)

     
</details>

## App Screenshots

Upcomming Launchs               |  Launch Detail               | Roadsters               |  Rockets
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_1.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_2.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_3.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_4.jpg?raw=true)|

Rocket Detail         |  Dragons             |   Dragon Detail     | Cores
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_5.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_6.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_7.jpg?raw=true)|![](https://github.com/TheAlphamerc/flutter_spacexopedia/blob/master/screenshots/screenshot__dark_8.jpg?raw=true)|



## Directory Structure
<details>
     <summary> Click to expand </summary>
  
```
|-- lib
|   |-- app.dart
|   |-- app_delegate.dart
|   |-- bloc
|   |   |-- core
|   |   |   |-- core_bloc.dart
|   |   |   |-- core_event.dart
|   |   |   |-- core_model.dart
|   |   |   |-- core_state.dart
|   |   |   '-- index.dart
|   |   |-- dragon
|   |   |   |-- dragon_bloc.dart
|   |   |   |-- dragon_event.dart
|   |   |   |-- dragon_model.dart
|   |   |   |-- dragon_state.dart
|   |   |   '-- index.dart
|   |   |-- launches
|   |   |   |-- bloc.dart
|   |   |   |-- launch_bloc.dart
|   |   |   |-- launch_event.dart
|   |   |   |-- launch_model.dart
|   |   |   '-- launch_state.dart
|   |   |-- navigation
|   |   |   |-- bloc.dart
|   |   |   |-- navigationEvent.dart
|   |   |   |-- navigationState.dart
|   |   |   '-- navigation_bloc.dart
|   |   |-- roadster
|   |   |   |-- index.dart
|   |   |   |-- roadster_bloc.dart
|   |   |   |-- roadster_event.dart
|   |   |   |-- roadster_model.dart
|   |   |   '-- roadster_state.dart
|   |   '-- rocket
|   |       |-- index.dart
|   |       |-- rocket_bloc.dart
|   |       |-- rocket_event.dart
|   |       |-- rocket_model.dart
|   |       '-- rocket_state.dart
|   |-- exceptions
|   |   '-- exceptions.dart
|   |-- helper
|   |   |-- app_font.dart
|   |   |-- config.dart
|   |   '-- utils.dart
|   |-- locator.dart
|   |-- main.dart
|   |-- resources
|   |   |-- dio_client.dart
|   |   |-- repository
|   |   |   |-- core_repository.dart
|   |   |   |-- dragon_repository.dart
|   |   |   |-- launch_repository.dart
|   |   |   |-- roadster_repository.dart
|   |   |   '-- rocket_repository.dart
|   |   '-- service
|   |       |-- api_gatway.dart
|   |       '-- api_gatway_impl.dart
|   '-- ui
|       |-- pages
|       |   |-- common
|       |   |   |-- error_page.dart
|       |   |   |-- no_connection.dart
|       |   |   '-- no_content.dart
|       |   |-- core
|       |   |   |-- core_page.dart
|       |   |   '-- core_screen.dart
|       |   |-- dragon
|       |   |   |-- dragon_detail.dart
|       |   |   |-- dragon_page.dart
|       |   |   '-- dragon_screen.dart
|       |   |-- home_page.dart
|       |   |-- launch
|       |   |   |-- all_launch.dart
|       |   |   |-- launch_detail.dart
|       |   |   '-- widgets
|       |   |       '-- youtube_player.dart
|       |   |-- roadster
|       |   |   |-- roadster_page.dart
|       |   |   '-- roadster_screen.dart
|       |   '-- rockets
|       |       |-- rocket_detail.dart
|       |       |-- rocket_page.dart
|       |       '-- rocket_screen.dart
|       |-- theme
|       |   |-- app_theme_provider.dart
|       |   |-- colors
|       |   |   |-- dark_color.dart
|       |   |   '-- light_color.dart
|       |   |-- custom_theme.dart
|       |   |-- extentions.dart
|       |   |-- text_styles.dart
|       |   '-- theme.dart
|       '-- widgets
|           |-- bottom_navigation_bar.dart
|           |-- customWidgets.dart
|           |-- custom_heading_tile.dart
|           |-- custom_list_tile.dart
|           |-- dot_indicator.dart
|           |-- image_slider.dart
|           |-- list_card.dart
|           |-- title_text.dart
|           '-- title_value.dart
|-- pubspec.yaml
```
### 🤝 How to Contribute
1.  Fork it
2.  Create your feature branch (git checkout -b my-new-feature)
3.  Commit your changes (git commit -am 'Add some feature')
4.  Push to the branch (git push origin my-new-feature)
5.  Create new Pull Request
</details>
    

## Created & Maintained By

[Sonu Sharma](https://github.com/TheAlphamerc) ([Twitter](https://www.twitter.com/TheAlphamerc)) ([Youtube](https://www.youtube.com/user/sonusharma045sonu/)) ([Insta](https://www.instagram.com/_sonu_sharma__)) ([Dev.to](https://dev.to/thealphamerc))
  ![Twitter Follow](https://img.shields.io/twitter/follow/thealphamerc?style=social) 

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> * [PayPal](https://paypal.me/shubhamsinghchahar/)

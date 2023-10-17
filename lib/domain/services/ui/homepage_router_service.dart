import 'package:injectable/injectable.dart';
import 'package:verbaquiz/ui/screens/home_screen/home_screen.dart';
import 'package:verbaquiz/ui/screens/login_screen/login_screen.dart';

@injectable
class HomePageRouterService {

  const HomePageRouterService();

  Future<String> getNextPage() async {
    await Future<void>.delayed(const Duration(milliseconds: 2000));
    bool userIsNotLogged = true;

    // TODO: If has some quiz started --> Popup to continue quiz --> Wants to resume it
    // TODO: Check if has resume quiz on close app option in Settings
    // TODO: Check if logged
    // TODO: Check if user paid or not

    if(userIsNotLogged){
      return LoginScreen.routeName;
    }
    return HomeScreen.routeName;
  }
}

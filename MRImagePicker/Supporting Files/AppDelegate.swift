import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.coordinator = AppCoordinator(window: self.window)
        return self.coordinator.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

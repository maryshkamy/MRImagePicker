import UIKit

class AppCoordinator: NSObject, UIApplicationDelegate, Coordinator {

    // MARK: Private Property(ies)

    private let window: UIWindow

    // MARK: Public Property(ies)

    var parent: Coordinator?
    var rootViewController: UIViewController = UINavigationController()

    // MARK: Constructor(s)

    init(window: UIWindow?) {
        self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
        self.window.makeKeyAndVisible()
        self.window.rootViewController = self.rootViewController

        super.init()
    }

    // MARK: UIApplicationDelegate(s)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        self.present(fromCoordinator: self, toCoordinator: TabBarCoordinator())
        return true
    }
}

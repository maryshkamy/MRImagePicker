import UIKit

class TabBarCoordinator: NSObject, Coordinator {

    // MARK: Public Property(ies)

    var parent: Coordinator?
    var rootViewController: UIViewController

    // MARK: Constructor(s)

    override init() {
        let controller = UITabBarController()
        self.rootViewController = controller

        super.init()

        let vc1 = self.navigationViewControllerFactory(controller: ImagePickerCoordinator().rootViewController,
                                                       normal: Asset.camera.image,
                                                       selected: nil)
        controller.setViewControllers([vc1], animated: true)
    }

    // MARK: Private Function(s)

    private func navigationViewControllerFactory(controller: UIViewController, normal: UIImage?, selected: UIImage?) -> UIViewController {
        let navigation = UINavigationController(rootViewController: controller)
        navigation.tabBarItem = UITabBarItem(title: nil, image: normal, selectedImage: selected?.withRenderingMode(.alwaysOriginal))
        navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        navigation.view.backgroundColor = UIColor.white

        return navigation
    }

}

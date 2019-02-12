import UIKit

final class ImagePickerCoordinator: NSObject, Coordinator {

    // MARK: Public Property(ies)

    var parent: Coordinator?
    var rootViewController: UIViewController

    // MARK: Constructor(s)

    override init() {
        let controller = ImagePickerPageViewController()
        self.rootViewController = controller

        super.init()
    }
}

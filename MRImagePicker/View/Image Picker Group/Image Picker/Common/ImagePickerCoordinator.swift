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

extension ImagePickerCoordinator: ImagePickerPageViewControllerDelegate {
    func cameraViewControllerDelegate(_ viewController: CameraViewController, data: UIImage) {
    }

    func photosViewControllerDelegate(_ viewController: PhotosViewController, data: UIImage) {
    }

    func photosViewControllerDelegate(_ viewController: PhotosViewController, albumView: Bool) {
    }
}

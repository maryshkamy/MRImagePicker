import UIKit

protocol ImagePickerPageViewControllerDelegate: class {
    func cameraViewControllerDelegate(_ viewController: CameraViewController, data: UIImage)
    func photosViewControllerDelegate(_ viewController: PhotosViewController, data: UIImage)
    func photosViewControllerDelegate(_ viewController: PhotosViewController, albumView: Bool)
}

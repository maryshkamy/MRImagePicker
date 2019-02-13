import UIKit

class PhotosViewController: UIViewController {

    // MARK: Private Property(ies)

    private let photosView = PhotosView()
    private let photoEmptyView = PhotosEmptyView()

    // MARK: Public Property(ies)

    var delegate: ImagePickerPageViewControllerDelegate?

    // MARK: UIViewController Delegate(s)

    override func loadView() {
        super.loadView()
        self.view = self.photosView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: Private Function(s)

    private func setup() {
    }
}

import UIKit

class CameraViewController: UIViewController {

    // MARK: Private Property(ies)

    private let cameraView = CameraView()
    private let cameraEmptyView = CameraEmptyView()

    // MARK: Public Property(ies)

    var delegate: ImagePickerPageViewControllerDelegate?

    // MARK: UIViewController Delegate(s)

    override func loadView() {
        super.loadView()
        self.view = self.cameraView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: Private Function(s)

    private func setup() {
    }
}

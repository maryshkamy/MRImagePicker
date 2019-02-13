import UIKit

class VideoViewController: UIViewController, ImagePickerViewControllerDelegate {

    // MARK: Private Property(ies)

    private let videoView = VideoView()
    private let videoEmptyView = VideoEmptyView()

    // MARK: Public Property(ies)

    var delegate: ImagePickerPageViewControllerDelegate?

    // MARK: UIViewController Delegate(s)

    override func loadView() {
        super.loadView()
        self.view = self.videoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: Private Function(s)

    private func setup() {
    }
}

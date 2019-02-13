import Cartography
import UIKit

class CameraView: UIView {

    // MARK: Public Property(ies)

    let camera: UIView = {
        let view = UIView()
        view.backgroundColor = .black

        return view
    }()

    let flash: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = .lightGray

        return view
    }()

    let flipCamera: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = .lightGray
        view.setImage(Asset.autorenew.image.withRenderingMode(.alwaysTemplate), for: .normal)

        return view
    }()

    let takePhoto: UIButton = {
        let view = UIButton()
        view.tintColor = .lightGray
        view.setImage(Asset.tripOrigin.image.withRenderingMode(.alwaysTemplate), for: .normal)

        return view
    }()

    // MARK: Constructor(s)

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Function(s)

    private func setup() {
        self.setupBackgroundColor()
        self.setupCameraConstrain()
        self.setupFlashConstrain()
        self.setupFlipCameraConstrain()
        self.setupTakePhotoConstrain()
    }

    private func setupBackgroundColor() {
        self.backgroundColor = .white
    }

    private func setupCameraConstrain() {
        self.addSubview(self.camera)
        constrain(self.camera, self) {
            $0.height == $1.width
            $0.top == $1.layoutMarginsGuide.top
            $0.left == $1.left
            $0.right == $1.right
        }
    }

    private func setupFlashConstrain() {
        self.addSubview(self.flash)
        constrain(self.flash, self.camera) {
            $0.width == 32
            $0.height == 32
            $0.left == $1.left + 16
            $0.bottom == $1.bottom - 16
        }
    }

    private func setupFlipCameraConstrain() {
        self.addSubview(self.flipCamera)
        constrain(self.flipCamera, self.camera) {
            $0.width == 32
            $0.height == 32
            $0.right == $1.right - 16
            $0.bottom == $1.bottom - 16
        }
    }

    private func setupTakePhotoConstrain() {
        self.addSubview(self.takePhoto)
        constrain(self.takePhoto, self.camera, self) {
            $0.top == $1.bottom + 16
            $0.bottom == $2.layoutMarginsGuide.bottom - 48
            $0.centerX == $2.centerX
            $0.width == $0.height
        }
    }

    // MARK: Public Function(s)

    func render(with data: UIImage) {
        self.flash.setImage(data.withRenderingMode(.alwaysTemplate), for: .normal)
    }
}

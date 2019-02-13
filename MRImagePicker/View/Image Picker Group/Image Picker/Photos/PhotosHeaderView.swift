import Cartography
import UIKit

class PhotosHeaderView: UIView {

    // MARK: Public Property(ies)

    let nextView: UIButton = {
        let view = UIButton()
        view.setImage(Asset.chevronRight.image, for: .normal)

        return view
    }()

    let albums: UIButton = {
        let view = UIButton()
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 14)
        view.setImage(Asset.expandMore.image, for: .normal)
        view.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft

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
        self.setupNextViewConstrain()
        self.setupAlbumsConstrain()
    }

    private func setupBackgroundColor() {
        self.backgroundColor = .white
    }

    private func setupNextViewConstrain() {
        self.addSubview(self.nextView)
        constrain(self.nextView, self) {
            $0.width == 24
            $0.height == 24
            $0.top == $1.top + 4
            $0.right == $1.right - 16
            $0.bottom == $1.bottom - 4
        }
    }

    private func setupAlbumsConstrain() {
        self.addSubview(self.albums)
        constrain(self.albums, self) {
            $0.height == 24
            $0.top == $1.top + 4
            $0.bottom == $1.bottom - 4
            $0.centerX == $1.centerX
        }
    }

    // MARK: Public Function(s)

    func render(with data: String) {
        self.albums.setTitle(data, for: .normal)
    }
}

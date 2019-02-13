import Cartography
import UIKit

class CameraEmptyView: UIView {

    // MARK: Private Property(ies)

    private let label: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 14)

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
        self.setupLabelConstrain()
    }

    private func setupBackgroundColor() {
        self.backgroundColor = .white
    }

    private func setupLabelConstrain() {
        self.addSubview(self.label)
        constrain(self.label, self) {
            $0.left == $1.left + 16
            $0.right == $1.right - 16
            $0.centerY == $1.centerY
        }
    }

    // MARK: Public Function(s)

    func render(with data: String) {
        self.label.text = data
    }
}

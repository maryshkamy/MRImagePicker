import Cartography
import UIKit

class ImagePickerCollectionViewCell: UICollectionViewCell {

    // MARK: Private Property(ies)

    private let label: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 14)

        return view
    }()

    // MARK: Overrider Public Property(ies)

    override var isHighlighted: Bool {
        didSet {
            self.label.textColor = isHighlighted ? .black : .lightGray
        }
    }

    override var isSelected: Bool {
        didSet {
            self.label.textColor = isSelected ? .black : .lightGray
        }
    }

    // MARK: Constructor(s)

    override init(frame: CGRect) {
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
        self.contentView.addSubview(self.label)
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

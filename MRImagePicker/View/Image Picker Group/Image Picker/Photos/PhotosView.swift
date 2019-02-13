import Cartography
import UIKit

class PhotosView: UIView {

    // MARK: Public Property(ies)

    let header = PhotosHeaderView()

    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .gray

        return view
    }()

    let resizeImage: UIButton = {
        let view = UIButton()
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = .lightGray
        view.setImage(Asset.code.image.withRenderingMode(.alwaysTemplate), for: .normal)

        return view
    }()

    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.scrollDirection = .vertical

        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .lightGray
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

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
        self.setupHeaderConstrain()
        self.setupScrollViewConstrain()
        self.setupResizeImageConstrain()
        self.setupCollectionViewConstrain()
    }

    private func setupBackgroundColor() {
        self.backgroundColor = .white
    }

    private func setupHeaderConstrain() {
        self.addSubview(self.header)
        constrain(self.header, self) {
            $0.top == $1.layoutMarginsGuide.top
            $0.left == $1.left
            $0.right == $1.right
        }
    }

    private func setupScrollViewConstrain() {
        self.addSubview(self.scrollView)
        constrain(self.scrollView, self.header, self) {
            $0.height == $2.width
            $0.top == $1.bottom
            $0.left == $2.left
            $0.right == $2.right
        }
    }

    private func setupResizeImageConstrain() {
        self.addSubview(self.resizeImage)
        constrain(self.resizeImage, self.scrollView, self) {
            $0.width == 32
            $0.height == 32
            $0.right == $2.right - 16
            $0.bottom == $1.bottom - 16
        }
    }

    private func setupCollectionViewConstrain() {
        self.addSubview(self.collectionView)
        constrain(self.collectionView, self.scrollView, self) {
            $0.top == $1.bottom + 2
            $0.left == $2.left
            $0.right == $2.right
            $0.bottom == $2.layoutMarginsGuide.bottom - 32
        }
    }
}

import Cartography
import UIKit

class ImagePickerPageViewController: UIPageViewController {

    // MARK: Private Property(ies)

    private var pages = [UIViewController]()
    private var currentViewController: UIViewController?
    private var controllers = [ImagePickerViewControllerDelegate]()

    private let cameraViewController = UIViewController()
    private let photoViewController = UIViewController()
    private let videoViewController = UIViewController()
    private let imagePicker: [PickerType] = [.photo, .camera, .video]

    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal

        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .white
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.register(ImagePickerCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        return view
    }()

    // MARK: Public Property(ies)

//    var imagePickerDelegate: ImagePickerPageViewControllerDelegate? {
//        willSet {
//            self.cameraViewController.delegate = newValue
//            self.photoViewController.delegate = newValue
//            self.videoViewController.delegate = newValue
//        }
//    }

    // MARK: Constructor(s)

    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController Delegate(s)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Image Picker"
    }

    // MARK: Private Function(s)

    private func setup() {
        self.dataSource = self
        self.delegate = self

//        self.imagePicker.forEach { (pickerType) in
//            switch pickerType {
//            case .camera:
//                self.controllers.append(self.cameraViewController)
//            case .photo:
//                self.controllers.append(self.photoViewController)
//            case .video:
//                self.controllers.append(self.videoViewController)
//            }
//        }

        self.pages = self.controllers.map { $0 as? UIViewController ?? UIViewController() }
        self.collectionView.isHidden = self.imagePicker.count <= 1 ? true : false

        if self.pages.count > 0 {
            setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
            self.currentViewController = pages[0]
            self.collectionView.selectItem(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: [])
        }
    }

    private func setupLayout() {
        self.setupBackgroundColor()
        self.setupCollectionViewConstrain()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    private func setupBackgroundColor() {
        self.view.backgroundColor = .red
    }

    private func setupCollectionViewConstrain() {
        self.view.addSubview(self.collectionView)
        constrain(self.collectionView, self.view) {
            $0.height == 32
            $0.left == $1.left
            $0.right == $1.right
            $0.bottom == $1.layoutMarginsGuide.bottom
        }
    }
}

extension ImagePickerPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    // MARK: UIPageViewController DataSource / Delegate(s)

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
}

extension ImagePickerPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionView DataSource / Delegate(s)

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagePicker.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImagePickerCollectionViewCell {
            cell.render(with: self.imagePicker[indexPath.row].label)

            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = self.currentViewController {
            let index = self.pages.index(of: viewController)

            setViewControllers([self.pages[indexPath.row]],
                               direction: index! < indexPath.row ? .forward : .reverse,
                               animated: true,
                               completion: nil)

            self.currentViewController = self.pages[indexPath.row]
        }
    }

    // MARK: UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / CGFloat(self.imagePicker.count)
        return CGSize(width: width, height: 32)
    }
}

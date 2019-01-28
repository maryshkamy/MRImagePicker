import UIKit

protocol Coordinator: class {

    // MARK: Public Property(ies)

    var parent: Coordinator? { get set }
    var rootViewController: UIViewController { get set }

    // MARK: Public Function(s)

    func push(fromCoordinator: Coordinator, toCoordinator: Coordinator)
    func present(fromCoordinator: Coordinator, toCoordinator: Coordinator, completion: (() -> Void)?)
}

extension Coordinator {
    func push(fromCoordinator: Coordinator, toCoordinator: Coordinator) {
        toCoordinator.parent = fromCoordinator

        if let navigationController = fromCoordinator.rootViewController.navigationController {
            navigationController.pushViewController(toCoordinator.rootViewController, animated: true)

            return
        }

        if let navigationController = fromCoordinator.rootViewController as?UINavigationController {
            navigationController.pushViewController(toCoordinator.rootViewController, animated: true)

            return
        }
    }

    func present(fromCoordinator: Coordinator, toCoordinator: Coordinator, completion: (() -> Void)? = nil) {
        toCoordinator.parent = fromCoordinator
        fromCoordinator.rootViewController.present(toCoordinator.rootViewController, animated: true, completion: completion)
    }
}

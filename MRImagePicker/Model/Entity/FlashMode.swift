import UIKit

enum FlashMode {
    case off
    case on
    case auto

    var icon: UIImage {
        switch self {
        case .off:
            return Asset.flashOff.image
        case .on:
            return Asset.flashOn.image
        case .auto:
            return Asset.flashAuto.image
        }
    }
}

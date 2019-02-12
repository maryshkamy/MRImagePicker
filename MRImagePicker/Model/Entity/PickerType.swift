import Foundation

enum PickerType {
    case camera
    case photo
    case video

    var label: String {
        switch self {
        case .camera:
            return "Camera"
        case .photo:
            return "Photos"
        case .video:
            return "Video"
        }
    }
}

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notifications:
            return "Notifications"
        case .Settings:
            return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile:
            return UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .Inbox:
            return UIImage(systemName: "tray.and.arrow.down")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .Notifications:
            return UIImage(systemName: "bell")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .Settings:
            return UIImage(systemName: "gearshape.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        }
    }
}

import Foundation
import UIKit

extension UIView {
    /// Return an `UIImage`with the visible contents inside the Cropping Rect
    /// - Parameter croppingRect: a rect to focus the screenshot
    /// - Returns: an `UIImage` with the visible contents inside the cropping rect
    func screenshotForCroppingRect(croppingRect: CGRect) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: croppingRect.size)

        return renderer.image { context in
            drawHierarchy(in: croppingRect, afterScreenUpdates: true)
        }
    }
    
    /// Returns a screenshot as `UIImage` from the whole view
    @objc public var screenshot: UIImage? {
        return self.screenshotForCroppingRect(croppingRect: self.bounds)
    }
}

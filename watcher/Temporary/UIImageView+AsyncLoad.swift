import UIKit
import Kingfisher

extension UIImageView {
	func load(fromURL url: URL) {
        kf.setImage(with: url)
	}
}

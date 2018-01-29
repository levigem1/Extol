import Foundation
import UIKit

class ExtolTableViewHeader: UITableViewCell {
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var title: UILabel!
    
    override func prepareForReuse() {
        backgroundImageView.image = nil
        title.text = nil
    }
    
    func setTitle(to title: String?) {
        self.title.text = title
    }
    
    func setImage(to image: UIImage) {
        backgroundImageView.image = image
    }
}

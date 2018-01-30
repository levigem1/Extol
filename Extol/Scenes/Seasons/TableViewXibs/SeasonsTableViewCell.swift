import Foundation
import UIKit

class SeasonsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet private weak var devotionCount: UILabel!
    
    override func awakeFromNib() {
        thumbnail.layer.masksToBounds = true
        thumbnail.layer.cornerRadius = 8.0
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        self.selectedBackgroundView =  view
    }
    
    override func prepareForReuse() {
        thumbnail.image = nil
        title.text = ""
        devotionCount.text = ""
    }
    
    func setDevotionCountLabel(forNumberOfDevotions count: Int) {
        var devotionCountText = "Explore \(count) devotion"
        makePluralIfNecessary(string: &devotionCountText, count: count)
        devotionCount.text = devotionCountText
    }
    
    private func makePluralIfNecessary(string: inout String, count: Int) {
        if count > 1 {
            string.append("s")
        }
    }
}


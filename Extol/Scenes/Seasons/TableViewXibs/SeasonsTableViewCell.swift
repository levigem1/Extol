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
    
    func flipContent() {
        self.contentView.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        self.title.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        self.thumbnail.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
        self.devotionCount.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: 1))
    }
    
    private func makePluralIfNecessary(string: inout String, count: Int) {
        if count > 1 {
            string.append("s")
        }
    }
}


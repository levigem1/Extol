import Foundation
import UIKit
import SafariServices

class DevotionViewerViewController: UIViewController, SFSafariViewControllerDelegate {
    var viewModel:  DevotionViewerViewModel!
    
    @IBOutlet weak var devotionTableView: UITableView!
    
    override func viewDidLoad() {
        initalizeDevotionTableView()
    }
    
    func initalizeDevotionTableView() {
        self.devotionTableView.delegate = self
        self.devotionTableView.dataSource = self
        self.devotionTableView.separatorStyle = .none
        self.devotionTableView.backgroundColor = viewModel.backgroundColor
        registerTableViewCellNibs()
    }
    
    func registerTableViewCellNibs() {
        devotionTableView.register(UINib(nibName:"DevotionViewerTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionViewerTitleTableViewCell")
        devotionTableView.register(UINib(nibName:"DevotionViewerLyricsTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionViewerLyricsTableViewCell")
        devotionTableView.register(UINib(nibName:"DevotionViewerScriptureTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionViewerScriptureTableViewCell")
        devotionTableView.register(UINib(nibName:"DevotionViewerDevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionViewerDevotionTableViewCell")
    }
}

extension DevotionViewerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case viewModel.titleRow:
            return getTitleTableViewCell()
        case viewModel.lyricsRow:
            return getLyricsTableViewCell()
        case viewModel.scriptureRow:
            return getScriptureTableViewCell()
        case viewModel.devotionRow:
            return getDevotionTableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func getTitleTableViewCell() -> DevotionViewerTitleTableViewCell {
        let cell = devotionTableView.dequeueReusableCell(withIdentifier: "DevotionViewerTitleTableViewCell") as! DevotionViewerTitleTableViewCell
        cell.backgroundColor = viewModel.backgroundColor
        cell.setDevotionTitle(forSongName: viewModel.devotion.song, andArtist: viewModel.devotion.artist)
        cell.spotifyURI = viewModel.devotion.spotifyURI
        return cell
    }
    
    func getLyricsTableViewCell() -> DevotionViewerLyricsTableViewCell {
        let cell = devotionTableView.dequeueReusableCell(withIdentifier: "DevotionViewerLyricsTableViewCell") as! DevotionViewerLyricsTableViewCell
        cell.backgroundColor = viewModel.backgroundColor
        cell.lyricsText.text = viewModel.devotion.lyrics
        cell.lyricsLink = viewModel.devotion.lyricsURL
        return cell
    }
    
    func getScriptureTableViewCell() -> DevotionViewerScriptureTableViewCell {
        let cell = devotionTableView.dequeueReusableCell(withIdentifier: "DevotionViewerScriptureTableViewCell") as! DevotionViewerScriptureTableViewCell
        cell.backgroundColor = viewModel.backgroundColor
        cell.setScriptureSource(fromPassage: viewModel.devotion.scriptureSource)
        cell.scriptureText.text = viewModel.devotion.scriptureText
        return cell
    }
    
    func getDevotionTableViewCell() -> DevotionViewerDevotionTableViewCell {
        let cell = devotionTableView.dequeueReusableCell(withIdentifier: "DevotionViewerDevotionTableViewCell") as! DevotionViewerDevotionTableViewCell
        cell.backgroundColor = viewModel.backgroundColor
        cell.devotionText.text = viewModel.devotion.devotionText
        return cell
    }
}

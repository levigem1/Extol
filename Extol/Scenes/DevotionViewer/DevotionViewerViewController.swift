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
        self.devotionTableView.backgroundColor = UIColor.black
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
        //todo
    }
    
}

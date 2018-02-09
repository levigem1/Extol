//
//  ArtistsViewController.swift
//  Extol
//
//  Created by Levi Gemmell on 1/27/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class ArtistsViewController: UIViewController {
    var viewModel = ArtistsViewModel()
    @IBOutlet weak var artistsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.navigationBar.isHidden = true
        artistsTableView.correctContentInset()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        artistsTableView.scrollToTop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        artistsTableView.delegate = self
        artistsTableView.dataSource = self
        artistsTableView.separatorStyle = .none
        artistsTableView.register(UINib(nibName:"ExtolTableViewHeader", bundle: nil), forCellReuseIdentifier: "ExtolTableViewHeader")
        artistsTableView.register(UINib(nibName:"ExtolTableViewCell", bundle: nil), forCellReuseIdentifier: "ExtolTableViewCell")
    }
}

extension ArtistsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.devotionsByArtist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtolTableViewCell") as! ExtolTableViewCell
        guard viewModel.devotionsByArtist.indices.contains(indexPath.row) else { return cell }
        let devotionsForArtist = viewModel.devotionsByArtist[indexPath.row]
        cell.title.text = devotionsForArtist.first?.artist
        cell.subText.text = "Explore \(devotionsForArtist.count) devotions"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.devotionsByArtist.indices.contains(indexPath.row) else { return }
        let devotionsForArtist = viewModel.devotionsByArtist[indexPath.row]
        UIRouter.navigateToDevotionList(fromVC: self, withDevotions: devotionsForArtist)
        self.artistsTableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = self.artistsTableView.dequeueReusableCell(withIdentifier: "ExtolTableViewHeader") as! ExtolTableViewHeader
        headerCell.setTitle(to: "Artists")
        headerCell.setImage(to: #imageLiteral(resourceName: "ArtistBackground"))
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}

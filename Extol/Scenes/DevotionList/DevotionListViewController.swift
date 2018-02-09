//
//  ViewController.swift
//  Extol
//
//  Created by Levi Gemmell on 1/18/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import UIKit

class DevotionListViewController: UIViewController {
    
    @IBOutlet weak var devotionsTableView: UITableView!
    
    var viewModel:  DevotionListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        devotionsTableView.correctContentInset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        devotionsTableView.delegate = self
        devotionsTableView.dataSource = self
        devotionsTableView.register(UINib(nibName:"DevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionTableViewCell")
        devotionsTableView.register(UINib(nibName:"ExtolTableViewHeader", bundle: nil), forCellReuseIdentifier: "ExtolTableViewHeader")
    }
    
    private func navigateToDevotionViewer(forDevotion devotion: Devotion) {
        let storyboard = UIStoryboard(name: "DevotionViewer", bundle: nil)
        let model = DevotionViewerModel(devotion: devotion)
        let viewModel = DevotionViewerViewModel(model: model)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DevotionViewer") as! DevotionViewerViewController
        destinationVC.viewModel = viewModel
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension DevotionListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return self.viewModel.devotions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevotionTableViewCell") as! DevotionTableViewCell
        guard viewModel.devotions.indices.contains(indexPath.row) else { return cell }
        let devotion = viewModel.devotions[indexPath.row]
        cell.name.text = devotion.song
        cell.artist.text = devotion.artist
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedDevotion = viewModel.devotions[indexPath.row]
        navigateToDevotionViewer(forDevotion: selectedDevotion)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = devotionsTableView.dequeueReusableCell(withIdentifier: "ExtolTableViewHeader") as! ExtolTableViewHeader
        headerCell.setTitle(to: viewModel.devotions.first?.season?.name)
        headerCell.setImage(to: viewModel.devotions.first?.season?.image)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}

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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        devotionsTableView.delegate = self
        devotionsTableView.dataSource = self
        devotionsTableView.register(UINib(nibName:"DevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionTableViewCell")
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
    
    // Configuring/Returning the cells at specific positions in the SettingsTableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevotionTableViewCell") as! DevotionTableViewCell
        guard viewModel.devotions.indices.contains(indexPath.row) else { return cell }
        cell.name.text = viewModel.devotions[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Method to add on blue checkmark to right-end of a cell that is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedDevotion = viewModel.devotions[indexPath.row]
        navigateToDevotionViewer(forDevotion: selectedDevotion)
    }
}

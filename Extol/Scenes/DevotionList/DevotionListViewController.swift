//
//  ViewController.swift
//  Extol
//
//  Created by Levi Gemmell on 1/18/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import UIKit

class DevotionListViewController: UIViewController {
    var viewModel =  DevotionListViewModel()
    @IBOutlet weak var devotionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        devotionsTableView.register(UINib(nibName:"DevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionTableViewCell")
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
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // Method to add on blue checkmark to right-end of a cell that is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

    }
}

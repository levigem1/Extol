import UIKit

class SeasonsViewController: UIViewController {
    var viewModel:  SeasonsViewModel!
    @IBOutlet weak var seasonsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        seasonsTableView.delegate = self
        seasonsTableView.dataSource = self
        seasonsTableView.register(UINib(nibName:"DevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionTableViewCell")
        seasonsTableView.register(UINib(nibName:"SeasonsTableViewHeader", bundle: nil), forCellReuseIdentifier: "SeasonsTableViewHeader")
        seasonsTableView.register(UINib(nibName:"SeasonsTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonsTableViewCell")
    }
    
}

extension SeasonsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return 10
    }
    
    // Configuring/Returning the cells at specific positions in the SettingsTableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonsTableViewCell") as! SeasonsTableViewCell
        cell.title.text = "Joy"
        cell.setDevotionCountLabel(forNumberOfDevotions: 3)
        cell.imageView?.image = #imageLiteral(resourceName: "Bridge")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = self.seasonsTableView.dequeueReusableCell(withIdentifier: "SeasonsTableViewHeader") as! SeasonsTableViewHeader
        return headerCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}


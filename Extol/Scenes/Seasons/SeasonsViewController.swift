import UIKit

class SeasonsViewController: UIViewController {
    var viewModel = SeasonsViewModel()
    @IBOutlet weak var seasonsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        seasonsTableView.delegate = self
        seasonsTableView.dataSource = self
        seasonsTableView.separatorStyle = .none
        seasonsTableView.register(UINib(nibName:"DevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionTableViewCell")
        seasonsTableView.register(UINib(nibName:"SeasonsTableViewHeader", bundle: nil), forCellReuseIdentifier: "SeasonsTableViewHeader")
        seasonsTableView.register(UINib(nibName:"SeasonsTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonsTableViewCell")
    }
    
    private func navigateToDevotionList(withDevotions devotions: [Devotion]) {
        let storyboard = UIStoryboard(name: "DevotionList", bundle: nil)
        let model = DevotionListModel(devotions: devotions)
        let viewModel = DevotionListViewModel(model: model)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DevotionList") as! DevotionListViewController
        destinationVC.viewModel = viewModel
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension SeasonsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return viewModel.devotionsBySeason.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonsTableViewCell") as! SeasonsTableViewCell
        let devotionsThisSeason = viewModel.devotionsBySeason[indexPath.row]
        cell.title.text = devotionsThisSeason.first?.season?.name
        cell.setDevotionCountLabel(forNumberOfDevotions: devotionsThisSeason.count)
        cell.imageView?.image = #imageLiteral(resourceName: "Bridge")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let devotionsThisSeason: [Devotion] = self.viewModel.devotionsBySeason[indexPath.row]
        self.navigateToDevotionList(withDevotions: devotionsThisSeason)
        self.seasonsTableView.deselectRow(at: indexPath, animated: false)
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


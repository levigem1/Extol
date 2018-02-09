import UIKit

class SeasonsViewController: UIViewController {
    var viewModel = SeasonsViewModel()
    @IBOutlet weak var seasonsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.navigationController?.navigationBar.isHidden = true
        seasonsTableView.correctContentInset()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        seasonsTableView.scrollToTop()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTableView(){
        seasonsTableView.delegate = self
        seasonsTableView.dataSource = self
        seasonsTableView.separatorStyle = .none
        seasonsTableView.register(UINib(nibName:"ExtolTableViewHeader", bundle: nil), forCellReuseIdentifier: "ExtolTableViewHeader")
        seasonsTableView.register(UINib(nibName:"SeasonsTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonsTableViewCell")
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
        let season = devotionsThisSeason.first?.season
        cell.title.text = season?.name
        cell.thumbnail?.image = season?.image
        cell.setDevotionCountLabel(forNumberOfDevotions: devotionsThisSeason.count)
        if indexPath.row % 2 == 1 { cell.flipContent() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let devotionsThisSeason: [Devotion] = self.viewModel.devotionsBySeason[indexPath.row]
        let season = devotionsThisSeason.first?.season
        UIRouter.navigateToDevotionList(fromVC: self, withDevotions: devotionsThisSeason, headerTitle: season?.name, headerImage: season?.image)
        self.seasonsTableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = self.seasonsTableView.dequeueReusableCell(withIdentifier: "ExtolTableViewHeader") as! ExtolTableViewHeader
        headerCell.setTitle(to: "Seasons")
        headerCell.setImage(to: #imageLiteral(resourceName: "SeasonsBackground"))
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}


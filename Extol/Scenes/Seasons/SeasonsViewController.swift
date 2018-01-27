import UIKit

class SeasonsViewController: UIViewController {
    var viewModel:  SeasonsViewModel!
    @IBOutlet weak var seasonsTableView: UITableView!
    
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
      //  seasonsTableView.delegate = self
      //  seasonsTableView.dataSource = self
        seasonsTableView.register(UINib(nibName:"DevotionTableViewCell", bundle: nil), forCellReuseIdentifier: "DevotionTableViewCell")
    }
    
}

extension SeasonsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return 1
    }
    
    // Configuring/Returning the cells at specific positions in the SettingsTableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DevotionTableViewCell") as! DevotionTableViewCell
        guard viewModel.devotionsBySeason.indices.contains(indexPath.row) else { return cell }
        cell.name.text = String(describing: viewModel.devotionsBySeason[indexPath.row].first?.season)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // Method to add on blue checkmark to right-end of a cell that is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        /*
         let sb = UIStoryboard(name: "QualityControl", bundle: nil)
         let model = QualityControlModel(document: document, questions: questions)
         let viewModel = QualityControlVM(model: model)
         let destinationVC = sb.instantiateViewController(withIdentifier: "QualityControlVC") as! QualityControlVC
         destinationVC.viewModel = viewModel
         
         fromVC.navigationController?.pushViewController(destinationVC, animated: true)*/
    }
}


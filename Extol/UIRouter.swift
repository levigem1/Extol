//
//  UIRouter.swift
//  Extol
//
//  Created by Levi Gemmell on 2/9/18.
//  Copyright © 2018 Bearsnsuch. All rights reserved.
//

import Foundation
import UIKit

class UIRouter {
    static func navigateToDevotionList(fromVC: UIViewController, withDevotions devotions: [Devotion]) {
        let storyboard = UIStoryboard(name: "DevotionList", bundle: nil)
        let model = DevotionListModel(devotions: devotions)
        let viewModel = DevotionListViewModel(model: model)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DevotionList") as! DevotionListViewController
        destinationVC.viewModel = viewModel
        fromVC.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

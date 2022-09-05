//
//  DetailViewCoordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import Foundation
import UIKit

protocol Detail {
    func pushDetail()
}

class DetailViewCoordinator : ViewCoordinator, Buy {
    var childs: [ViewCoordinator] = [ViewCoordinator]()
    var nv: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.nv = navigationController
    }
    
    func start() {
        let vc = DetailViewController()
        vc.coordinator = self
        nv.pushViewController(vc, animated: true)
    }
    
    func pushBuy() {
        let buy = BuyViewCoordinator(navigation: nv)
        buy.start()
    }
    
}

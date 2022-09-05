//
//  BuyViewCoordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import UIKit

protocol Buy {
    func pushBuy()
}

class BuyViewCoordinator: ViewCoordinator {
    var childs: [ViewCoordinator] = [ViewCoordinator]()
    
    var nv: UINavigationController
    
    init(navigation:UINavigationController) {
        self.nv = navigation
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        nv.pushViewController(vc, animated: true)
    }
}

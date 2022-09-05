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

class BuyCoordinator: Coordinator {
    var parents:Coordinator?
    var childs: [Coordinator] = [Coordinator]()
    
    var nv: UINavigationController
    
    init(navigation:UINavigationController, parents:Coordinator?) {
        self.nv = navigation
        self.parents = parents
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        nv.pushViewController(vc, animated: true)
    }
    
    func didFinishingBuying() {
        parents?.didChildFinish(self)
    }
    
    func didChildFinish(_ finishedChild: Coordinator) {
        for (i, coordinator) in childs.enumerated() {
            if coordinator === finishedChild {
                childs.remove(at: i)
                break
            }
        }
    }
}

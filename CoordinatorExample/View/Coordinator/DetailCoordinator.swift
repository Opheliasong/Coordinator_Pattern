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

class DetailCoordinator : NSObject, Coordinator, Buy{
    weak var parents:Coordinator?
    var childs: [Coordinator] = [Coordinator]()
    var nv: UINavigationController
    
    init(navigationController:UINavigationController, parents:Coordinator?) {
        self.nv = navigationController
        self.parents = parents
    }
    
    func start() {
        let vc = DetailViewController()
        vc.coordinator = self
        nv.pushViewController(vc, animated: true)
    }
    
    func pushBuy() {
        let buy = BuyCoordinator(navigation: nv, parents: self)
        childs.append(buy)
        buy.start()
    }

}

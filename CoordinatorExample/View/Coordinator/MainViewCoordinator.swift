//
//  MainViewCoordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import Foundation
import UIKit

class MainViewCoordinator : ViewCoordinator, Detail, Buy, Events {
    var childs: [ViewCoordinator] = [ViewCoordinator]()
    var nv: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.nv = navigationController
    }
    
    func start() {
        let vc  = ViewController()
        vc.coordinator = self
        nv.pushViewController(vc, animated: false)
    }
    
    func pushDetail() {
        let detail = DetailViewCoordinator(navigationController: nv)
        detail.start()
    }
    
    func pushBuy() {
        let buy = BuyViewCoordinator(navigation: nv)
        buy.start()
    }
    
    func pushEvents() {
        let events = EventsViewCoordinator(navigation: nv)
        events.start()
    }
}

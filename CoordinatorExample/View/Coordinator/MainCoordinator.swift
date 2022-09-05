//
//  MainViewCoordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import Foundation
import UIKit

class MainCoordinator : NSObject, Coordinator, Detail, Buy, Events {
    var childs: [Coordinator] = [Coordinator]()
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
        let detail = DetailCoordinator(navigationController: nv, parents: self)
        childs.append(detail)
        detail.start()
    }
    
    func pushBuy() {
        let buy = BuyCoordinator(navigation: nv, parents: self)
        childs.append(buy)
        buy.start()
    }
    
    func pushEvents() {
        let events = EventsCoordinator(navigation: nv, parents: self)
        childs.append(events)
        events.start()
    }
}

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
        nv.delegate = self
        nv.pushViewController(vc, animated: false)
    }
    
    func didChildFinish(_ finishedChild:Coordinator) {
        // disapear되었을 경우 childs에서 remove
        for (i, coordinator) in childs.enumerated() {
            if coordinator === finishedChild {
                childs.remove(at: i)
                break
            }
        }
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

extension MainCoordinator:UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let coordinatedView = fromViewController as? ViewCoordinating {
            didChildFinish(coordinatedView.coordinator!)
        }
    }
}

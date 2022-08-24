//
//  MainViewCoordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import Foundation
import UIKit

class MainViewCoordinator : ViewCoordinator {
    var childs: [ViewCoordinator] = [ViewCoordinator]()
    var nv: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.nv = navigationController
    }
    
    func start() {
        let vc  = ViewController()
        nv.pushViewController(vc, animated: false)
    }
}

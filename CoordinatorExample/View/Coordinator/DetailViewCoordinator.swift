//
//  DetailViewCoordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import Foundation
import UIKit

class DetailViewCoordinator : ViewCoordinator {
    var childs: [ViewCoordinator] = [ViewCoordinator]()
    var nv: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.nv = navigationController
    }
    
    func start() {
        let vc = DetailViewController()
        nv.pushViewController(vc, animated: false)
    }
}

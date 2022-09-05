//
//  BuyViewController.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import UIKit

/*
 정해진 하나의 Product를 구매하기 위한 Role을 가진 View
 */
class BuyViewController: UIViewController {
    var coordinator: (ViewCoordinator & BuyViewCoordinator)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemMint
        self.title = "Buy"
    }
}

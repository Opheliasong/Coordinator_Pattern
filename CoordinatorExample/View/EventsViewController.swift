//
//  EventsViewController.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import UIKit

/*
 현재 진행중인 Event들에 관해서 나열하는 Role을 가진 View
 */
class EventsViewController: UIViewController {
    var coordinator: ViewCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBrown
        self.title = "Events"
    }

}

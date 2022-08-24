//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/23.
//

import UIKit

class ViewController: UIViewController, ViewCoordinating {
    var coordinator: ViewCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .gray
        
        self.title = "Main"
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Move Detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didMovieToDetail), for: .touchUpInside)
    }

    @objc func didMovieToDetail() {
        
    }
}


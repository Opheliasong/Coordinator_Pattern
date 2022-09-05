//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/23.
//

import UIKit

/*
 Main View Controller, 앱 실행시 가장 먼저 보게 되는 View의 role을 가진 view
 */
class ViewController: UIViewController, ViewCoordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .gray
        
        self.title = "Main"
        
        let button = UIButton(frame: CGRect(x: 0, y: 150, width: 220, height: 55))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Move Detail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didMovieToDetail), for: .touchUpInside)
        
        let eventButton = UIButton(frame: CGRect(x: 0, y: 205, width: 220, height: 55))
        view.addSubview(eventButton)
        eventButton.backgroundColor = .systemMint
        eventButton.setTitle("Move Event", for: .normal)
        eventButton.setTitleColor(.white, for: .normal)
        eventButton.addTarget(self, action: #selector(didMovieToEvents), for: .touchUpInside)
        
        let buyButton = UIButton(frame: CGRect(x: 0, y: 270, width: 220, height: 55))
        view.addSubview(buyButton)
        buyButton.backgroundColor = .systemBrown
        buyButton.setTitle("Move Buy", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.addTarget(self, action: #selector(didMovieToBuy), for: .touchUpInside)
    }

    @objc func didMovieToDetail() {
        guard let mainCoordinator = coordinator as? MainCoordinator else {
            return
        }
        
        mainCoordinator.pushDetail()
    }
    
    @objc func didMovieToEvents() {
        guard let mainCoordinator = coordinator as? MainCoordinator else {
            return
        }
        
        mainCoordinator.pushEvents()
    }
    
    @objc func didMovieToBuy() {
        guard let mainCoordinator = coordinator as? MainCoordinator else {
            return
        }
        
        mainCoordinator.pushBuy()
    }
}


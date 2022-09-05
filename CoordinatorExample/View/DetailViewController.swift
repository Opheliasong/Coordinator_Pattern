//
//  DetailViewController.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import UIKit

/**
 상품의 상세적인 화면을 보여주는 Role을 가진 View
 */
class DetailViewController: UIViewController, ViewCoordinating {
    var coordinator: ViewCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .cyan
        self.title = "Detail"
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Move Main", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didMovieToDetail), for: .touchUpInside)
    }
    
    @objc func didMovieToDetail(){
        guard let detailCoordinator = coordinator as? DetailViewCoordinator else {
            return
        }
        detailCoordinator.pushBuy()
    }
}

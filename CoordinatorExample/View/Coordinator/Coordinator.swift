//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Sung Min Park on 2022/08/24.
//

import Foundation
import UIKit

/*
 ViewChnage를 할때 사용되는 정보를 전달하기 위한 데이터 모델
 
 */
struct ViewChangeObject {
    var productId:String
    var tag:String
    var beforeId:String
    
    init() {
        self.beforeId = ""
        self.tag = ""
        self.productId = ""
    }
    
    init(productId:String, tag:String, beforeId:String) {
        self.productId = productId
        self.tag = tag
        self.beforeId = beforeId
    }
}

/*
 Coordinator들의 규격화된 protocol
 */
protocol Coordinator: AnyObject {
    var childs: [Coordinator] {get set}
    var nv: UINavigationController {get set}
    
    func start()
    func didChildFinish(_ finishedChild:Coordinator)
}

/*
 
 모든 UIVIewController에 해당 프로토콜을 적용하여 Coordinator가 항시 적용되도록 규격화 하기 위한 protocol
 */
protocol ViewCoordinating : AnyObject {
    var coordinator:Coordinator? { get set }
}

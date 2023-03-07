//
//  MainCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator]? = nil

    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTap:
            var vc: UIViewController & Coordinating = PreparationVC()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = PreparationVC()
        vc.coordinator = self
        
        navigationController?.setViewControllers([vc], animated: false)
    }
}

//
//  Coordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import Foundation
import UIKit

enum Event {
    case buttonTap
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator]? { get set }
    
    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

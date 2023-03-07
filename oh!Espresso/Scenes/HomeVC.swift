//
//  HomeVC.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import UIKit

class HomeVC: UIViewController, Coordinating {
    var coordinator: Coordinator?

    
    // MARK: - Subviews

    // MARK: - Actions
    let toPrepareBtn = UIButton(frame: CGRect(x: 50, y: 50, width: 200, height: 50))

    // MARK: - Containers
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Subviews
        view.addSubview(toPrepareBtn)
        
        // Setup
        title = "Home"
        view.backgroundColor = .darkGray

        toPrepareBtn.center = view.center
        toPrepareBtn.backgroundColor = .magenta
        toPrepareBtn.setTitle("To Prepare", for: .normal)
        toPrepareBtn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
    }
    
    @objc func didTapBtn() {
        let vc = PreparationVC()
        coordinator?.eventOccurred(with: .buttonTap)
    }


}


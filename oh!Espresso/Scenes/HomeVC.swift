//
//  HomeVC.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import UIKit
import Stevia

class HomeVC: UIViewController, Coordinating {
    var coordinator: Coordinator?

    // MARK: - Subviews
    private var titleLabel = UILabel()
    
    // MARK: - Actions
    private let toPrepareButton = UIButton()

    // MARK: - Containers
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Subviews
        view.subviews {
            titleLabel
            toPrepareButton
        }
        
        // Layout
        titleLabel.centerHorizontally()
        titleLabel.top(30%)
        
        toPrepareButton.centerHorizontally()
        toPrepareButton.centerVertically(offset: 15)
        toPrepareButton.top(70%)
        
        // Setup
        title = "Home"
        view.backgroundColor = UIColor(red:0/255.0, green:28/255.0, blue:45/255.0, alpha:1.6)
        titleLabel.text = "Oh!Espresso"
        titleLabel.textColor = .lightText
        titleLabel.font = UIFont.systemFont(ofSize: 30.0)
        
        
        toPrepareButton.setTitle("Go to Prepare", for: .normal)
        toPrepareButton.backgroundColor = .brown
        toPrepareButton.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        toPrepareButton.layer.cornerRadius = 10
    }
    
    
    @objc func didTapBtn() {
        let vc = PreparationVC()
        coordinator?.eventOccurred(with: .buttonTap)
    }
}


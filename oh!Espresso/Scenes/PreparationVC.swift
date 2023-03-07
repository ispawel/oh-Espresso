//
//  PreparationVC.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 07.03.2023.
//

import UIKit
import Stevia

class PreparationVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    // MARK: - Subviews
    private var contentView = UIView()
    private var titleLabel = UILabel()
    
    private var valueCoffeLabel = UILabel()
    private var valueCoffeTF = UITextField()
    private var timeOfExtractionLabel = UILabel()
    private var valueEspressoOutLabel = UILabel()
    private var valueMilkOutLabel = UILabel()
    
    // MARK: - Actions
    private var ratioMilkSwitch = UISwitch()

    // MARK: - Containers
    private var mainVStackView = UIStackView()
    private var topHStackView = UIStackView()
    private var middleHStackView = UIStackView()
    private var bottomHStackView = UIStackView()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Subviews
        view.subviews {
            contentView.subviews {
                titleLabel
                mainVStackView
            }
        }
        mainVStackView.addArrangedSubview(topHStackView)
        topHStackView.addArrangedSubview(valueCoffeLabel)
        topHStackView.addArrangedSubview(valueCoffeTF)
        
        mainVStackView.addArrangedSubview(middleHStackView)
        middleHStackView.addArrangedSubview(ratioMilkSwitch)
        
        mainVStackView.addArrangedSubview(bottomHStackView)
        bottomHStackView.addArrangedSubview(timeOfExtractionLabel)
        bottomHStackView.addArrangedSubview(valueMilkOutLabel)
        
        // Layout
        contentView.fillContainer(padding: 20)
        mainVStackView.left(10%)
            .right(10%)
            .top(10%)
            .bottom(10%)
                
        // Setup
        title = "Enter Values"
        view.backgroundColor = UIColor(red:0/255.0, green:28/255.0, blue:45/255.0, alpha:1.6)
        titleLabel.text = "Oh!Espresso"
        titleLabel.textColor = .lightText
        titleLabel.font = UIFont.systemFont(ofSize: 30.0)
        
        valueCoffeLabel.text = "Enter coffe gram"
        valueCoffeTF.text = "g"
        
        valueMilkOutLabel.text = "volume"
        timeOfExtractionLabel.text = "25 second"
        
        contentView.backgroundColor = .green
        
        mainVStackView.backgroundColor = .brown
        mainVStackView.axis = .vertical
        mainVStackView.distribution = .fillEqually
        
        topHStackView.backgroundColor = .magenta
        topHStackView.axis = .horizontal
        topHStackView.distribution = .fillEqually
        
        middleHStackView.backgroundColor = .orange
        middleHStackView.axis = .horizontal
        middleHStackView.distribution = .fillEqually
        
        bottomHStackView.backgroundColor = .purple
        bottomHStackView.axis = .horizontal
        bottomHStackView.distribution = .fillEqually
    }
       
}

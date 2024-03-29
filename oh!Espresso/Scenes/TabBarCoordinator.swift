//
//  TabBarCoordinator.swift
//  oh!Espresso
//
//  Created by Pavel Isakov on 10.04.2023.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {

    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    
    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.raf, .latte, .espresso]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = TabBarPage.espresso.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())
        
        
        switch page {
        case .espresso:
            // If needed: Each tab bar flow can have it's own Coordinator.
            let espressoVC = EspressoViewController()
            espressoVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .espresso:
                    self?.selectPage(.latte)
                }
            }
            navController.pushViewController(espressoVC, animated: true)

        case .latte:
            let latteVC = LatteViewController()
            latteVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .latte:
                    self?.selectPage(.raf)
                }
            }
            navController.pushViewController(latteVC, animated: true)

        case .raf:
            let rafVC = RafViewController()
            rafVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .raf:
                    self?.finish()
                }
            }
            navController.pushViewController(rafVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}

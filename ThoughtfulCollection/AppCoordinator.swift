//
//  AppCoordinator.swift
//  ThoughtfulCollection
//
//  Created by Daria Cheremina on 27/11/2024.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.navigationBar.prefersLargeTitles = true

        let viewController = ThoughtfulCollectionViewController()

        navigationController.pushViewController(viewController, animated: false)

    }
}

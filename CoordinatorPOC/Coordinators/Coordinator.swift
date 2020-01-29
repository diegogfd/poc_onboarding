//
//  Coordinator.swift
//  CoordinatorPOC
//
//  Created by Ezequiel Gutierrez on 07/08/2019.
//  Copyright © 2019 Ezequiel Gutierrez. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    // var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

// MARK: - Onboarding

protocol OnboardingCoordinatorProtocol {
    func start()
    func handleNextButtonTapped()
}

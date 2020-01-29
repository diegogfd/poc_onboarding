//
//  Undefined.swift
//  CoordinatorPOC
//
//  Created by Julian Bruno on 23/01/2020.
//  Copyright © 2020 Ezequiel Gutierrez. All rights reserved.
//

import UIKit
class UndefinedVC:  UIViewController, OnboardingVCProtocol {
 var onboardingCoordinator: OnboardingCoordinatorProtocol?
    @IBAction func nextButtonDidTapped(_: Any) {
        onboardingCoordinator?.handleNextButtonTapped()
    }
    
}

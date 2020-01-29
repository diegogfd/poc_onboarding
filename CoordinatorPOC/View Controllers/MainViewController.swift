//
//  MainViewController.swift
//  CoordinatorPOC
//
//  Created by Ezequiel Gutierrez on 07/08/2019.
//  Copyright © 2019 Ezequiel Gutierrez. All rights reserved.
//

import UIKit

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
    )
}

class MainViewController: UIViewController {
    @IBOutlet var listOfStepsView: UITextView!
    var onboardingCoordinator: OnboardingCoordinatorProtocol?

    @IBAction func segmentedControlDidChangeValue(_ sender: UISegmentedControl) {
        //

        let stores = initStoreFravega()
        var stepList: [StepProtocol] = []
        switch sender.selectedSegmentIndex {
        case 0:
            stepList.append(StepWelcome(stores: stores))
            stepList.append(StepInfo(stores: stores))
            stepList.append(StepRate(stores: stores))
            stepList.append(StepUndefined(status: false))
            stepList.append(StepSMBShowTAC())
        case 1:
            stepList.append(StepWelcome(stores: stores))
            stepList.append(StepRate(stores: stores))
            stepList.append(StepUndefined(status: true))
            stepList.append(StepSMBShowTAC())
        default:
            stepList.append(StepWelcome(stores: stores))
            stepList.append(StepUndefined(status: false))
            stepList.append(StepSMBShowTAC())
        }

        listOfStepsView.text = stepList.description
        delay(2, closure: {
            if let nav = self.navigationController {
                // Coordinator necesita la nav,los datos iniciales y la lista de pasos
                self.onboardingCoordinator = OnboardingCoordinator(navigationController: nav, stepList: stepList)
                self.onboardingCoordinator?.start()
            }
                   })
    }

    private func initStoreFravega() -> StoresEntity { // TODO: REEMPLAZAR !!
        let storeA = StoreEntity(name: "ALCORTA", location: "ARGENTINA", number: 2, hasPlace: true)
        let storeB = StoreEntity(name: "DOT", location: "ARGENTINA", number: 3, hasPlace: true)
        let storeC = StoreEntity(name: "ALTO PALERMO", location: "ARGENTINA", number: 4, hasPlace: true)
        let storeD = StoreEntity(name: "PACIFICO", location: "ARGENTINA", number: 5, hasPlace: true)
        let fravega = StoresEntity(stores: [storeA, storeB, storeC, storeD])
        return fravega
    }
}

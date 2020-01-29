
import UIKit

class OnboardingCoordinator: Coordinator {
    var navigationController: UINavigationController


    let stepManag: StepManager
    let stepList: [StepProtocol]

    init(navigationController: UINavigationController, stepList: [StepProtocol]) {
        
        self.navigationController = navigationController
        self.stepList = stepList.reversed()
        // TODO: SE PUEDE SACAR LAS VARIABLES DE LA CLASE
        self.stepManag = StepManager(stepList: stepList)
    }
    
    private init(navigationController: UINavigationController, stepManager:StepManager) {
        self.navigationController = navigationController
        self.stepManag = stepManager
        self.stepList = stepManag.remainingSteps()
        
    }

    private func showNextVC() {
        if let name = stepManag.nextStep(), let vc = stepManag.nextStepVC() {
            print("view controller to show: \(name)")
            let newCoordinator = OnboardingCoordinator(navigationController: self.navigationController,stepManager: StepManager(stepList: self.stepManag.remainingSteps()))
            
            navigationController.pushViewController(vc, animated: true)
            var casted = vc as? OnboardingVCProtocol
            casted?.onboardingCoordinator = newCoordinator
            print(casted)
            
           // RouterByName.showVcFromStoryBoard(className: name, navigationController: navigationController, coordinator: newCoordinator)
        } else {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

extension OnboardingCoordinator: OnboardingCoordinatorProtocol {
    func start() {
        showNextVC()
    }

    func handleNextButtonTapped() {
        print("NEXT")
        showNextVC()
    }
}

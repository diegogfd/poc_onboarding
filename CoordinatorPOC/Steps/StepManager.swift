//
//  StepManager.swift
//  CoordinatorPOC
//
//  Created by Julian Bruno on 22/01/2020.
//  Copyright © 2020 Ezequiel Gutierrez. All rights reserved.
//

import Foundation
import UIKit

class StepManager {
    
    private var stepsCanBeDisplayed: [StepProtocol] = []
    init(stepList: [StepProtocol]) {
        
        print ("Step List ****")
        stepsCanBeDisplayed = stepList.filter { $0.canBeDisplayed }
//        stepsCanBeDisplayed.map {
//            print ("Step:\($0.name)")
//            stepStack.push($0) }
        
        printListOfSteps()
        
    }
    
    private func printListOfSteps() {
        print ("Step List stepsCanBeDisplayed ---- ")
        for step in  self.stepsCanBeDisplayed {
            print ("step\(step)")
        }
        print ("Step List stepsCanBeDisplayed ---- ")
    }
    
    
//    init (stepStack:Stack<StepProtocol>) {
//        self.stepStack = stepStack
//    }
    
    func remainingSteps() -> [StepProtocol] {
        let remaingSteps: [StepProtocol]  = Array(self.stepsCanBeDisplayed.dropFirst()) //TODO IMPROVE MERGE
        return remaingSteps
    }
    
//    func actualStep() -> String? {
//        stepStack.peek()?.name
//    }

    func nextStep() -> String? {
        self.stepsCanBeDisplayed.first?.name
    }
    
    
    func nextStepVC() -> UIViewController? {
        return self.stepsCanBeDisplayed.first?.getVC()
     }
    
}

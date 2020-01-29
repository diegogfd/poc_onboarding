//
//  StepProtocol.swift
//  CoordinatorPOC
//
//  Created by Julian Bruno on 22/01/2020.
//  Copyright © 2020 Ezequiel Gutierrez. All rights reserved.
//

//import Foundation
import UIKit

protocol StepProtocol {
    var name: String { get }
    var showRules: [RuleProtocol] { get }
    var canBeDisplayed: Bool { get }
    func getVC() -> UIViewController 
}

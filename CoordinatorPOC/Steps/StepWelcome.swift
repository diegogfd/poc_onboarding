//
//  StepWelcome.swift
//  CoordinatorPOC
//
import UIKit
class StepBase: StepProtocol {
    func getVC() -> UIViewController {
        return UIViewController()
    }
    
    internal var name: String
    internal var showRules: [RuleProtocol]
    internal var canBeDisplayed: Bool
    init(name: String, showRules: [RuleProtocol]) {
        self.name = name
        self.showRules = showRules
        canBeDisplayed = showRules.map { $0.execute() }.filter { $0 == false }.count == 0
        print("Step:\(name) initiated")
        // print(showRules.map { $0.execute() })
    }
    
    
}

extension StepBase: CustomDebugStringConvertible {
  var debugDescription: String {
    return "Step: \(name),"
      + " displayed: \(canBeDisplayed)) \n"
  }
}

class StepWelcome: StepBase {
    init(stores: StoresEntity) {
        var rules: [RuleProtocol] = []
        rules.append(RuleNameA(stores: stores))
        rules.append(RuleHasLocal(stores: stores))
        super.init(name: "WelcomeVC", showRules: rules)
    }
    override func getVC() -> UIViewController {
        let vc = WelcomeVC()
        return vc
    }
}

class StepInfo: StepBase {
    init(stores: StoresEntity) {
        var rules: [RuleProtocol] = []
        rules.append(RuleLocationArgentina(stores: stores))
        super.init(name: "InfoVC", showRules: rules)
    }
    override func getVC() -> UIViewController {
        let vc = InfoVC()
        return vc
    }
}

class StepUndefined: StepBase {
    init(status: Bool) {
        var rules: [RuleProtocol] = []
        rules.append(RuleBool(status: status)) // status según regla
        super.init(name: "UndefinedVC", showRules: rules)
    }
    override func getVC() -> UIViewController {
        let vc = UndefinedVC()
        return vc
    }
}

class StepRate: StepBase {
    init(stores _: StoresEntity) {
        var rules: [RuleProtocol] = []
        rules.append(RuleBool(status: true)) // Status fixed
        super.init(name: "RateVC", showRules: rules)
    }
    override func getVC() -> UIViewController {
        let vc = RateVC()
        return vc
    }
}

class StepSMBShowTAC: StepBase {
    init() {
        var rules: [RuleProtocol] = []
        rules.append(RuleSMB())
        super.init(name: "SMBShowTACVC", showRules: rules)
    }
    override func getVC() -> UIViewController {
        let vc = SMBShowTACVC()
        return vc
    }
}

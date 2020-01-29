////
////  RouterByName.swift
////  CoordinatorPOC
////
////  Created by Julian Bruno on 22/01/2020.
//
//import UIKit
//class RouterByName {
//    static func returnVC(name: String) -> UIViewController? {
//        var instance: AnyObject!
//        if let classInst = stringClassFromString(name) as? NSObject.Type {
//            instance = classInst.init()
//        }
//        return instance as? UIViewController
//    }
//
//    private static func stringClassFromString(_ className: String) -> AnyObject.Type {
//        let namespace = (Bundle.main.infoDictionary!["CFBundleExecutable"] as! String).replacingOccurrences(of: " ", with: "_")
//        let cls = NSClassFromString("\(namespace).\(className)")!
//        return cls
//    }
//
//    static func showVcFromStoryBoard(className: String, navigationController: UINavigationController, coordinator: OnboardingCoordinatorProtocol) {
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        // instantiate a view controller with that identifier, and force cast as the type that was requested
//        let vc = storyboard.instantiateViewController(withIdentifier: className)
//        navigationController.pushViewController(vc, animated: true)
//        var casted = vc as? OnboardingVCProtocol
//        casted?.onboardingCoordinator = coordinator
//        print(casted)
//    }
//}

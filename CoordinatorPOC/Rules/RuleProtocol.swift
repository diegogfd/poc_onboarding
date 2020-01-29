//
//  RuleProtocol.swift
//  CoordinatorPOC
//
//  Created by Julian Bruno on 22/01/2020.
//  Copyright © 2020 Ezequiel Gutierrez. All rights reserved.
//

import Foundation

protocol RuleProtocol {
    // init(stores: StoresEntity)
    func execute() -> Bool
}

class RuleHasLocal: RuleProtocol {
    let stores: StoresEntity
    required init(stores: StoresEntity) {
        self.stores = stores
    }

    func execute() -> Bool {
        let hasPlace = stores.stores.filter { $0.hasPlace }.count > 0
        return hasPlace
    }
}

class RuleNameA: RuleProtocol {
    let stores: StoresEntity
    required init(stores: StoresEntity) {
        self.stores = stores
    }

    func execute() -> Bool {
        let hasA = stores.stores.filter { $0.name.starts(with: "A") }.count > 0
        return hasA
    }
}

class RuleLocationArgentina: RuleProtocol {
    let stores: StoresEntity
    required init(stores: StoresEntity) {
        self.stores = stores
    }

    func execute() -> Bool {
        let hasA = stores.stores.filter { $0.location == "Argentina" }.count > 0
        return hasA
    }
}

class RuleSMB: RuleProtocol {
    func execute() -> Bool {
        true
    }
}

class RuleBool: RuleProtocol {
    let status: Bool
    required init(status: Bool) {
        self.status = status
    }

    func execute() -> Bool {
        return status
    }
}

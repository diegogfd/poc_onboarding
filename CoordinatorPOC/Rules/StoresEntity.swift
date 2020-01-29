//
//  StoresEntity.swift
//  CoordinatorPOC
//
//  Created by Julian Bruno on 22/01/2020.
//  Copyright © 2020 Ezequiel Gutierrez. All rights reserved.
//

import Foundation

struct StoreEntity {
    let name: String
    let location: String
    let number: Int
    let hasPlace: Bool
}

struct StoresEntity {
    let stores: [StoreEntity]
}

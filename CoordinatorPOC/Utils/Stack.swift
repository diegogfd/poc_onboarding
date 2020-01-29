//
//  Stack.swift
//  CoordinatorPOC
//
//  Created by Julian Bruno on 23/01/2020.
//  Copyright © 2020 Ezequiel Gutierrez. All rights reserved.
//

import Foundation
// https://docs.swift.org/swift-book/LanguageGuide/Generics.html
struct Stack<Element> {
    fileprivate var array: [Element] = []

    mutating func push(_ element: Element) {
        array.append(element)
    }

    mutating func pop() -> Element? {
        return array.popLast()
    }

    func peek() -> Element? {
        return array.last
    }
}

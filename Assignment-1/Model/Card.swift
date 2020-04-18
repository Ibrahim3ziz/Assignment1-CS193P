//
//  Card.swift
//  Assignment-1
//
//  Created by Ibrahim Abdul Aziz on 4/11/20.
//  Copyright © 2020 Ibrahim Abdul Aziz. All rights reserved.
//

import Foundation

struct Card: Hashable, Equatable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    private var id: Int
    var isMatched = false
    var isFacedUp = false
    
    private static var idFactory = 0
    
    
    private static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}

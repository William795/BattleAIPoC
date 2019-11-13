//
//  AllyModel.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 11/13/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Ally {
    var health: Int
    var attackDamage: Int
    var attackSpeed: Int
    var stance: Bool
    
    init(health: Int, attackDamage: Int, attackSpeed: Int, stance: Bool) {
        self.health = health
        self.attackDamage = attackDamage
        self.attackSpeed = attackSpeed
        self.stance = stance
    }
}

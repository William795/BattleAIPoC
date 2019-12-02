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
    var attackSpeed: Double
    var attackCoolDown: Double
    var attackCooldownResetValue: Double
    var stance: Bool
    
    init(health: Int, attackDamage: Int, attackSpeed: Double, attackCoolDown: Double, attackCooldownResetValue: Double, stance: Bool) {
        self.health = health
        self.attackDamage = attackDamage
        self.attackSpeed = attackSpeed
        self.attackCoolDown = attackCoolDown
        self.attackCooldownResetValue = attackCooldownResetValue
        self.stance = stance
    }
}

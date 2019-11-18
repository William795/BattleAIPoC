//
//  EnemyModel.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 11/13/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class Enemy {
    var health: Int
    var attackDamage: Int
    var attackSpeed: Int
    var phase: Int
    
    init(health: Int, attackDamage: Int, attackSpeed: Int, phase: Int) {
        self.health = health
        self.attackDamage = attackDamage
        self.attackSpeed = attackSpeed
        self.phase = phase
    }
}

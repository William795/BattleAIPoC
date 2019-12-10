//
//  EnemyController.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 11/13/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class EnemyController {
    
    static let shared = EnemyController()
    
    //CRUD
   
    var enemy = Enemy(health: 10, attackDamage: 1, attackSpeed: 1, phase: 1)
    
    
    func nextPhase() {
        enemy.phase += 1
    }
    
    func takeDamage(amount: Int) {
        enemy.health -= amount
    }
    
    func enemyDefeatedCheck() -> Bool {
        if enemy.health < 1 {
            return true
        }
        return false
    }
}

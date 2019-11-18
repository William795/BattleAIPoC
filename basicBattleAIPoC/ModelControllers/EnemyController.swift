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
    
    //create enemy
    
    var enemy = Enemy(health: 50, attackDamage: 1, attackSpeed: 1, phase: 1)
    
    
    func nextPhase() {
        
    }
    
    func takeDamage() {
        
    }
    
    func enemyDefeatedCheck() {
        
    }
}

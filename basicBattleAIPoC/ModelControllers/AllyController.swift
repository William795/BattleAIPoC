//
//  AllyController.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 11/13/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation

class AllyController {
    
    static let shared = AllyController()
    
    //information for each ally and player
    
    var tank = Ally(health: 5, maxHealth: 5, attackDamage: 1, attackSpeed: 1, attackCoolDown: 5, attackCooldownResetValue: 5, stance: false)
    var mage = Ally(health: 3, maxHealth: 3, attackDamage: 1, attackSpeed: 1, attackCoolDown: 4, attackCooldownResetValue: 4, stance: false)
    var ranger = Ally(health: 3, maxHealth: 3, attackDamage: 1, attackSpeed: 2, attackCoolDown: 6, attackCooldownResetValue: 6, stance: false)
    var player = Ally(health: 2, maxHealth: 2, attackDamage: 1, attackSpeed: 1, attackCoolDown: 5, attackCooldownResetValue: 5, stance: false)
    
    var tankShield = Ally(health: 3, maxHealth: 3, attackDamage: 0, attackSpeed: 0, attackCoolDown: 0, attackCooldownResetValue: 0, stance: false)
    
    
    
    //CRUD
    
    //create allys
    
    func swapFormation() {
        
    }
    
    func takeDamage() {
        
    }
    
    func heal() {
        let healValue = mage.attackDamage
        tank.health += healValue
        mage.health += healValue
        ranger.health += healValue
        player.health += healValue
        
        let allyArray: [Ally] = [tank, mage, ranger, player]
        for ally in allyArray {
            if ally.maxHealth < ally.health {
                ally.health = ally.maxHealth
            }
        }
    }
    
    //delete
}

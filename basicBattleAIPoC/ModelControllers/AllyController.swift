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
    
    var player = Ally(health: 2, attackDamage: 1, attackSpeed: 1, stance: false)
    var tank = Ally(health: 5, attackDamage: 1, attackSpeed: 1, stance: false)
    var ranger = Ally(health: 3, attackDamage: 1, attackSpeed: 4, stance: false)
    var mage = Ally(health: 3, attackDamage: 1, attackSpeed: 1, stance: false)
    
    var tankShield = Ally(health: 3, attackDamage: 0, attackSpeed: 0, stance: false)
    
    //CRUD
    
    //create allys
    
    func swapFormation() {
        
    }
    
    func takeDamage() {
        
    }
    
    func heal() {
        
    }
    
    //delete
}

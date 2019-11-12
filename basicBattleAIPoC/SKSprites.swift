//
//  SKSprites.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 10/24/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation
import SpriteKit

let screenSize: CGRect = UIScreen.main.bounds
var baseSize = CGSize(width: 50, height: 50)
extension SKSpriteNode {
    
    func makeTank() -> SKSpriteNode {
        let tank = SKSpriteNode()
        tank.name = "tank"
        tank.color = .white
        tank.size = baseSize
        tank.position = CGPoint(x: screenSize.midX / 2, y: screenSize.midY)
        tank.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        
        return tank
    }
    
    func makeMage() -> SKSpriteNode {
        let mage = SKSpriteNode()
        mage.name = "mage"
        mage.color = .blue
        mage.size = baseSize
        mage.position = CGPoint(x: screenSize.midX / 3, y: screenSize.midY * 1.5)
        mage.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        
        return mage
    }
    
    func makeRanger() -> SKSpriteNode {
        let ranger = SKSpriteNode()
        ranger.name = "ranger"
        ranger.color = .green
        ranger.size = baseSize
        ranger.position = CGPoint(x: screenSize.midX / 3, y: screenSize.midY / 2)
        ranger.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        
        return ranger
    }
    
    func makePlayer() -> SKSpriteNode {
        let player = SKSpriteNode()
        player.color = .gray
        player.size = baseSize
        player.position = CGPoint(x: screenSize.midX / 4, y: screenSize.midY)
        player.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        
        return player
    }
    
    func makeEnemy() -> SKSpriteNode {
        let enemy = SKSpriteNode()
        enemy.name = "enemy"
        enemy.color = .red
        enemy.size = CGSize(width: baseSize.width * 2, height: baseSize.height * 2)
        enemy.position = CGPoint(x: screenSize.midX * 1.5, y: screenSize.midY)
        enemy.physicsBody?.categoryBitMask = PhysicsCategorys.enemy
        
        return enemy
    }
    
    func makeEnemyAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.color = .darkGray
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 4)
        attack.position = atLocation
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.enemyAttack
        attack.physicsBody?.contactTestBitMask = PhysicsCategorys.ally
        
        return attack
    }
    
    func makeAllyAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.color = .cyan
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 4)
        attack.position = atLocation
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.enemyAttack
        attack.physicsBody?.contactTestBitMask = PhysicsCategorys.enemy
        attack.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return attack
    }
    
    func makeButtonOne() -> SKSpriteNode {
        let button = SKSpriteNode()
        button.name = "button1"
        button.color = .orange
        button.size = baseSize
        button.position = CGPoint(x: screenSize.maxX - button.size.width, y: screenSize.midY * 1.5)
        
        return button
    }
    
    func makeButtonTwo() -> SKSpriteNode {
        let button = SKSpriteNode()
        button.name = "button2"
        button.color = .orange
        button.size = baseSize
        button.position = CGPoint(x: screenSize.maxX - button.size.width, y: screenSize.midY)
        
        return button
    }
    
    func makeButtonThree() -> SKSpriteNode {
        let button = SKSpriteNode()
        button.name = "button3"
        button.color = .orange
        button.size = baseSize
        button.position = CGPoint(x: screenSize.maxX - button.size.width, y: screenSize.midY * 0.5)
        
        return button
    }
}

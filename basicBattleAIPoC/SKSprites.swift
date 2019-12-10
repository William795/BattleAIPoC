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
        tank.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        tank.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        tank.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return tank
    }
    
    func makeMage() -> SKSpriteNode {
        let mage = SKSpriteNode()
        mage.name = "mage"
        mage.color = .blue
        mage.size = baseSize
        mage.position = CGPoint(x: screenSize.midX / 3, y: screenSize.midY * 1.5)
        mage.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        mage.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        mage.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return mage
    }
    
    func makeRanger() -> SKSpriteNode {
        let ranger = SKSpriteNode()
        ranger.name = "ranger"
        ranger.color = .green
        ranger.size = baseSize
        ranger.position = CGPoint(x: screenSize.midX / 3, y: screenSize.midY / 2)
        ranger.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        ranger.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        ranger.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return ranger
    }
    
    func makePlayer() -> SKSpriteNode {
        let player = SKSpriteNode()
        player.name = "player"
        player.color = .gray
        player.size = baseSize
        player.position = CGPoint(x: screenSize.midX / 4, y: screenSize.midY)
        player.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        player.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        player.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return player
    }
    
    func makeEnemy() -> SKSpriteNode {
        let enemy = SKSpriteNode()
        enemy.name = "enemy"
        enemy.color = .red
        enemy.size = CGSize(width: baseSize.width * 2, height: baseSize.height * 2)
        enemy.position = CGPoint(x: screenSize.midX * 1.5, y: screenSize.midY)
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        enemy.physicsBody?.categoryBitMask = PhysicsCategorys.enemy
        enemy.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return enemy
    }
    
    func makeEnemyAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.name = "enemyAttack"
        attack.color = .darkGray
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 4)
        attack.position = atLocation
        attack.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 8)
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.enemyAttack
        attack.physicsBody?.contactTestBitMask = PhysicsCategorys.ally
        attack.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return attack
    }
    
    func makeTankAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.name = "allyAttack"
        attack.color = .orange
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 8)
        attack.position = atLocation
        attack.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        attack.physicsBody?.affectedByGravity = false
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.tankAttack
        attack.physicsBody?.contactTestBitMask = PhysicsCategorys.enemy
        attack.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return attack
    }
    
    func makeMageAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.name = "allyAttack"
        attack.color = .cyan
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 8)
        attack.position = atLocation
        attack.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        attack.physicsBody?.affectedByGravity = false
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.mageAttack
        attack.physicsBody?.contactTestBitMask = PhysicsCategorys.enemy
        attack.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return attack
    }
    
    func makeRangerAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.name = "allyAttack"
        attack.color = .green
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 8)
        attack.position = atLocation
        attack.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        attack.physicsBody?.affectedByGravity = false
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.rangerAttack
        attack.physicsBody?.contactTestBitMask = PhysicsCategorys.enemy
        attack.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return attack
    }
    
    func makePlayerAttack(atLocation: CGPoint) -> SKSpriteNode {
        let attack = SKSpriteNode()
        attack.name = "allyAttack"
        attack.color = .white
        attack.size = CGSize(width: baseSize.width / 4, height: baseSize.height / 8)
        attack.position = atLocation
        attack.physicsBody = SKPhysicsBody(circleOfRadius: baseSize.width / 2)
        attack.physicsBody?.affectedByGravity = false
        attack.physicsBody?.categoryBitMask = PhysicsCategorys.playerAttack
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
    
    func makeTankShield(atTank: CGPoint) -> SKSpriteNode {
        let shield = SKSpriteNode()
        shield.name = "shield"
        shield.color = .white
        shield.size = CGSize(width: baseSize.width / 3, height: baseSize.height * 2)
        shield.position = CGPoint(x: atTank.x + baseSize.width, y: atTank.y)
        shield.physicsBody = SKPhysicsBody(rectangleOf: shield.size)
        shield.physicsBody?.affectedByGravity = false
        shield.physicsBody?.categoryBitMask = PhysicsCategorys.ally
        shield.physicsBody?.collisionBitMask = PhysicsCategorys.none
        
        return shield
    }
    
    func makeHealEffect(atAlly: CGPoint) -> SKSpriteNode {
        let effect = SKSpriteNode()
        effect.color = .systemGreen
        effect.size = baseSize
        effect.position = atAlly
        
        return effect
    }
}

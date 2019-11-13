//
//  GameScene.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 10/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var enemy: SKSpriteNode!
    var player: SKSpriteNode!
    var tank: SKSpriteNode!
    var shield: SKSpriteNode!
    var mage: SKSpriteNode!
    var ranger: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        setUpScene()
        
    }
    
    func setUpScene() {
        physicsSetUp()
        setUpAllys()
        createEnemy()
        makeButtons()
    }
    
    func makeButtons() {
        let buttonOne = SKSpriteNode.makeButtonOne(SKSpriteNode())
        let buttonTwo = SKSpriteNode.makeButtonTwo(SKSpriteNode())
        let buttonThree = SKSpriteNode.makeButtonThree(SKSpriteNode())
        addChild(buttonOne())
        addChild(buttonTwo())
        addChild(buttonThree())
    }
    
    func physicsSetUp() {
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    func setUpAllys() {
        createMage()
        createTank()
        createRanger()
        createPlayer()
    }
    
    func createTank() {
        let tankBlueprint = SKSpriteNode.makeTank(SKSpriteNode())
        tank = tankBlueprint()
        addChild(tank)
    }
    
    func createMage() {
        let mageBlueprint = SKSpriteNode.makeMage(SKSpriteNode())
        mage = mageBlueprint()
        addChild(mage)
    }
    
    func createRanger() {
        let rangerBlueprint = SKSpriteNode.makeRanger(SKSpriteNode())
        ranger = rangerBlueprint()
        addChild(ranger)
    }
    
    func createPlayer() {
        let playerBlueprint = SKSpriteNode.makePlayer(SKSpriteNode())
        player = playerBlueprint()
        addChild(player)
    }
    
    func createEnemy() {
        let enemyBlueprint = SKSpriteNode.makeEnemy(SKSpriteNode())
        enemy = enemyBlueprint()
        addChild(enemy)
    }
    
    func createEnemyAttack(at enemyPosition: CGPoint) {
        let attack = SKSpriteNode().makeEnemyAttack(atLocation: enemyPosition)
        attack.physicsBody?.velocity = CGVector(dx: tank.position.x - enemyPosition.x, dy: tank.position.y - enemyPosition.y)
        addChild(attack)
    }
    
    func createAllyAtack(at AllyPosition: CGPoint) {
        let attack = SKSpriteNode().makeAllyAttack(atLocation: AllyPosition)
        attack.physicsBody?.velocity = CGVector(dx: enemy.position.x - AllyPosition.x, dy: enemy.position.y - AllyPosition.y)
        
        addChild(attack)
    }
    
    func createShield() {
        let shieldBlueprint = SKSpriteNode().makeTankShield(atTank: tank.position)
        shield = shieldBlueprint
        
        addChild(shield)
    }
    
    func swapTankFormation() {
        if shield != nil {
            if shield.parent == self {
                shield.removeFromParent()
                //tank goes to attack
                return
            }
        }
        createShield()
    }
    
    func swapRangerFormation() {
        //formations be dmg/stealth
    }
    
    func swapMageFormation() {
        //formations be dmg/healing
    }
    
    func enemyDamaged() {
        //stuff and things
    }
    
    func allyDamaged(whoGotHit: SKSpriteNode) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var pos: CGPoint!
        for touch in touches {
            pos = touch.location(in: self)
        }
        for node in nodes(at: pos) {
            switch node.name {
            case "button1":
                //tank swap
                print("button1T")
                swapTankFormation()
            case "button2":
                //mage swap
                print("button2M")
            case "button3":
                //rangerswap
                print("button3R")
            case "tank":
                //speed up
                print("tank")
                createAllyAtack(at: tank.position)
            case "ranger":
                //speed up
                print("ranger")
                createAllyAtack(at: ranger.position)
            case "mage":
                //speed up
                print("mage")
                createAllyAtack(at: mage.position)
            case "enemy":
                //slow down
                print("enemy")
                createEnemyAttack(at: enemy.position)
            default:
                print("Nothing")
            }
        }
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case PhysicsCategorys.ally | PhysicsCategorys.enemyAttack:
            if let attack = contact.bodyA.node?.name == "enemyAttack" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                attack.run(SKAction.fadeOut(withDuration: 0.5))
                attack.removeFromParent()
            }
            print("Ally hit")
        case PhysicsCategorys.allyAttack | PhysicsCategorys.enemy:
            print("enemy hit")
            if let attack = contact.bodyA.node?.name == "allyAttack" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                enemyDamaged()
                attack.run(SKAction.fadeOut(withDuration: 0.5))
                attack.removeFromParent()
            }
        default:
            print("unspecified contact made")
        }
    }
}

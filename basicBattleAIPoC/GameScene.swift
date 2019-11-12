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
    var mage: SKSpriteNode!
    var ranger: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        setUpScene()
        
    }
    
    func setUpScene() {
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
//        physicsWorld.gravity = CGVector(dx: 1, dy: 1)
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
    
    func createEnemyAttack(that shootAlly: CGPoint) {
        
    }
    
    func createAllyAtack(at AllyPosition: CGPoint) {
        let attack = SKSpriteNode().makeAllyAttack(atLocation: AllyPosition)
        attack.physicsBody?.velocity = CGVector(dx: enemy.position.x - AllyPosition.x, dy: enemy.position.y - AllyPosition.y)
        
        addChild(attack)
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
                createAllyAtack(at: tank.position)
            case "button2":
                //mage swap
                print("button2M")
                createAllyAtack(at: mage.position)
            case "button3":
                //rangerswap
                print("button3R")
                createAllyAtack(at: ranger.position)
            case "tank":
                //speed up
                print("tank")
            case "ranger":
                //speed up
                print("ranger")
            case "mage":
                //speed up
                print("mage")
            case "enemy":
                //slow down
                print("enemy")
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
            return
        case PhysicsCategorys.allyAttack | PhysicsCategorys.enemy:
            return
        default:
            return
        }
    }
}

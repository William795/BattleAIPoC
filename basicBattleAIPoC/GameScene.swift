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
    }
    
    func physicsSetUp() {
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
    
}

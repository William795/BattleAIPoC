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
        startGlobalTimer()
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
    
    func startGlobalTimer() {
        let timer = SKAction.wait(forDuration: 1)
        let timerTick = SKAction.run {
            self.tankAttack()
            self.mageAttack()
            self.rangerAttack()
        }
        let sequence = SKAction.sequence([timer, timerTick])
        run(SKAction.repeatForever(sequence))
    }
    
    func setUpAllys() {
        createTank()
        createMage()
        createRanger()
        createPlayer()
        
    }
    
    func createTank() {
        let tankBlueprint = SKSpriteNode.makeTank(SKSpriteNode())
        tank = tankBlueprint()
        addChild(tank)
        swapTankFormation()
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
    
    func createAllyAtack(for ally: SKSpriteNode) {
        var attack = SKSpriteNode()
        
        switch ally.name {
        case "tank":
            attack = SKSpriteNode().makeTankAttack(atLocation: ally.position)
            attack.physicsBody?.velocity = CGVector(dx: enemy.position.x - ally.position.x, dy: enemy.position.y - ally.position.y)
        case "mage":
            attack = SKSpriteNode().makeMageAttack(atLocation: ally.position)
            attack.physicsBody?.velocity = CGVector(dx: enemy.position.x - ally.position.x, dy: enemy.position.y - ally.position.y)
        case "ranger":
            attack = SKSpriteNode().makeRangerAttack(atLocation: ally.position)
            attack.physicsBody?.velocity = CGVector(dx: enemy.position.x - ally.position.x, dy: enemy.position.y - ally.position.y)
        case "player":
            attack = SKSpriteNode().makePlayerAttack(atLocation: ally.position)
            attack.physicsBody?.velocity = CGVector(dx: enemy.position.x - ally.position.x, dy: enemy.position.y - ally.position.y)
        default:
            print("create ally attack default hit")
            return
        }
        
        addChild(attack)
    }
    
    func createShield() {
        let shieldBlueprint = SKSpriteNode().makeTankShield(atTank: tank.position)
        shield = shieldBlueprint
        
        addChild(shield)
    }
    
    func makeHealEffect() {
        let allyArray: [SKSpriteNode] = [tank, mage, ranger, player]
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        let floatUp = SKAction.moveBy(x: 0, y: 50, duration: 1)
        
        let group = SKAction.group([floatUp, fadeOut])
        
        for ally in allyArray {
            let effect = SKSpriteNode().makeHealEffect(atAlly: ally.position)
            effect.run(group)
            
            addChild(effect)
        }
    }
    
    func swapTankFormation() {
        if shield != nil {
            if shield.parent == self {
                shield.removeFromParent()
                tank.run(SKAction.moveTo(x: 500, duration: 2))
                AllyController.shared.tank.attackSpeed = 1
                return
            }
        }
        AllyController.shared.tank.attackSpeed = 0
        createShield()
        tank.run(SKAction.moveTo(x: 220, duration: 2))
        shield.run(SKAction.moveTo(x: 280, duration: 2))
        AllyController.shared.tankShield.health = 3
    }
    
    func swapRangerFormation() {
        //formations be passive attacks / rapid attaks
        if AllyController.shared.ranger.stance == true {
            AllyController.shared.ranger.attackSpeed -= 1
            AllyController.shared.ranger.stance = false
            ranger.run(SKAction.moveBy(x: -50, y: 50, duration: 1))
        } else {
            AllyController.shared.ranger.attackSpeed += 1
            AllyController.shared.ranger.stance = true
            ranger.run(SKAction.moveBy(x: 50, y: -50, duration: 1))
        }
    }
    
    func swapMageFormation() {
        if AllyController.shared.mage.stance == false {
            AllyController.shared.mage.stance = true
            mage.run(SKAction.moveBy(x: -30, y: -40, duration: 1))
        } else {
            AllyController.shared.mage.stance = false
            mage.run(SKAction.moveBy(x: 30, y: 40, duration: 1))
        }
    }
    
    func tankAttack() {
        if AllyController.shared.tank.attackCoolDown < 1 {
            createAllyAtack(for: tank)
            AllyController.shared.tank.attackCoolDown = AllyController.shared.tank.attackCooldownResetValue
        } else {
            AllyController.shared.tank.attackCoolDown -= AllyController.shared.tank.attackSpeed
        }
    }
    
    func mageAttack() {
        let isHealing = AllyController.shared.mage.stance
        
        if AllyController.shared.mage.attackCoolDown < 1 {
            if isHealing {
                makeHealEffect()
                AllyController.shared.heal()
            } else {
                createAllyAtack(for: mage)
            }
            AllyController.shared.mage.attackCoolDown = AllyController.shared.mage.attackCooldownResetValue
        } else {
            AllyController.shared.mage.attackCoolDown -= AllyController.shared.mage.attackSpeed
        }
    }
    
    func rangerAttack() {
        if AllyController.shared.ranger.attackCoolDown < 1 {
            createAllyAtack(for: ranger)
            AllyController.shared.ranger.attackCoolDown = AllyController.shared.ranger.attackCooldownResetValue
        } else {
            AllyController.shared.ranger.attackCoolDown -= AllyController.shared.ranger.attackSpeed
        }
    }
    
    func enemyDamaged(from ally: Ally) {
        EnemyController.shared.takeDamage(amount: ally.attackDamage)
        gameOverCheck()
    }
    
    func gameOverCheck() {
        // check for health of player and enemy and go from there
        if EnemyController.shared.enemyDefeatedCheck() {
            print("game over enemy dead")
        }
    }
    
    func allyDamaged(ally: SKSpriteNode) {
        switch ally.name {
        case "tank":
            print("tank hit")
            AllyController.shared.tank.health -= 1
        case "ranger":
            print("ranger hit")
            AllyController.shared.ranger.health -= 1
        case "mage":
            print("mage hit")
            AllyController.shared.mage.health -= 1
        case "player":
            print("player hit")
            AllyController.shared.player.health -= 1
        case "shield":
            print("shield hit")
            AllyController.shared.tankShield.health -= 1
            if AllyController.shared.tankShield.health < 1 {
                shield.removeFromParent()
                //TODO - tank is stunned
            }
        default:
            print("allydamaged func hit default")
            return
        }
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
                swapMageFormation()
            case "button3":
                //rangerswap
                print("button3R")
                swapRangerFormation()
            case "tank":
                //speed up
                print("tank")
                createAllyAtack(for: tank)
            case "ranger":
                //speed up
                print("ranger")
                createAllyAtack(for: ranger)
                rangerAttack()
            case "mage":
                //speed up
                print("mage")
                createAllyAtack(for: mage)
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
            if let ally = contact.bodyA.node?.name == "enemyAttack" ? contact.bodyB.node as? SKSpriteNode : contact.bodyA.node as? SKSpriteNode {
                allyDamaged(ally: ally)
                gameOverCheck()
            }
            
            print("Ally hit")
        case PhysicsCategorys.tankAttack | PhysicsCategorys.enemy:
            print("enemy hit by tank")
            if let attack = contact.bodyA.node?.name == "allyAttack" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                enemyDamaged(from: AllyController.shared.tank)
                attack.run(SKAction.fadeOut(withDuration: 0.5))
                attack.removeFromParent()
            }
        case PhysicsCategorys.mageAttack | PhysicsCategorys.enemy:
            print("enemy hit by mage")
            if let attack = contact.bodyA.node?.name == "allyAttack" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                enemyDamaged(from: AllyController.shared.mage)
                attack.run(SKAction.fadeOut(withDuration: 0.5))
                attack.removeFromParent()
            }
            case PhysicsCategorys.rangerAttack | PhysicsCategorys.enemy:
            print("enemy hit by ranger")
            if let attack = contact.bodyA.node?.name == "allyAttack" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                enemyDamaged(from: AllyController.shared.ranger)
                attack.run(SKAction.fadeOut(withDuration: 0.5))
                attack.removeFromParent()
            }
            case PhysicsCategorys.playerAttack | PhysicsCategorys.enemy:
            print("enemy hit by player")
            if let attack = contact.bodyA.node?.name == "allyAttack" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                enemyDamaged(from: AllyController.shared.player)
                attack.run(SKAction.fadeOut(withDuration: 0.5))
                attack.removeFromParent()
            }
        default:
            print("unspecified contact made")
        }
    }
}

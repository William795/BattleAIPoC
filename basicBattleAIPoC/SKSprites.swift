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
        tank.color = .white
        tank.size = baseSize
        tank.position = CGPoint(x: screenSize.midX / 2, y: screenSize.midY)
        
        return tank
    }
    
    func makeMage() -> SKSpriteNode {
        let mage = SKSpriteNode()
        mage.color = .blue
        mage.size = baseSize
        mage.position = CGPoint(x: screenSize.midX / 3, y: screenSize.midY * 1.5)

        return mage
    }
    
    func makeRanger() -> SKSpriteNode {
        let ranger = SKSpriteNode()
        ranger.color = .green
        ranger.size = baseSize
        ranger.position = CGPoint(x: screenSize.midX / 3, y: screenSize.midY / 2)
        
        return ranger
    }
    
    func makePlayer() -> SKSpriteNode {
        let player = SKSpriteNode()
        player.color = .gray
        player.size = baseSize
        player.position = CGPoint(x: screenSize.midX / 4, y: screenSize.midY)
        
        return player
    }
    
    func makeEnemy() -> SKSpriteNode {
        let enemy = SKSpriteNode()
        enemy.color = .red
        enemy.size = CGSize(width: baseSize.width * 2, height: baseSize.height * 2)
        enemy.position = CGPoint(x: screenSize.midX * 1.5, y: screenSize.midY)
        
        return enemy
    }
}

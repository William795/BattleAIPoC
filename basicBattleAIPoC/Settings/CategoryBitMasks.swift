//
//  CategoryBitMasks.swift
//  basicBattleAIPoC
//
//  Created by William Moody on 11/11/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import Foundation
import SpriteKit

enum PhysicsCategorys {
    static let none: UInt32 = 0
    static let ally: UInt32 = 0x1
    static let tankAttack: UInt32 = 0x1 << 1
    static let mageAttack: UInt32 = 0x1 << 2
    static let rangerAttack: UInt32 = 0x1 << 3
    static let playerAttack: UInt32 = 0x1 << 4
    static let enemy: UInt32 = 0x1 << 5
    static let enemyAttack: UInt32 = 0x1 << 6
}

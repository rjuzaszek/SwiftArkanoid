//
//  DeathNode.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import Foundation
import SpriteKit

class DeathNode: SKNode {

	init(width: CGFloat) {
		super.init()

		physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -width * 0.5, y: 0), to: CGPoint(x: width * 0.5, y: 0))
		physicsBody?.categoryBitMask = BodyType.Death.rawValue
		physicsBody?.collisionBitMask = BodyType.Ball.rawValue
		physicsBody?.affectedByGravity = false
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

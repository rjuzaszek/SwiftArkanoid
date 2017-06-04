//
//  BallNode.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import Foundation
import SpriteKit

class BallNode: SKSpriteNode {

	private let baseSpeed: CGFloat

	init(baseSpeed: CGFloat) {
		self.baseSpeed = baseSpeed
		super.init(texture: nil, color: SKColor.clear, size: CGSize(width: 40, height: 40))

		let circle = SKShapeNode(circleOfRadius: 20)
		circle.strokeColor = SKColor.black
		circle.fillColor = SKColor.blue
		addChild(circle)


		physicsBody = SKPhysicsBody(circleOfRadius: 20)
		physicsBody?.affectedByGravity = false
		physicsBody?.usesPreciseCollisionDetection = true
		physicsBody?.friction = 0
		physicsBody?.restitution = 1
		physicsBody?.linearDamping = 0
		physicsBody?.angularDamping = 0
		physicsBody?.categoryBitMask = BodyType.Ball.rawValue
		physicsBody?.contactTestBitMask = BallCollisionSum.All.rawValue
	}

	func startRunning() {
		physicsBody?.applyImpulse(CGVector(dx: 0, dy: baseSpeed))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

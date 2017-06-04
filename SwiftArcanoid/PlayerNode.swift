//
//  PlayerNode.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import Foundation
import SpriteKit

class PlayerNode: SKSpriteNode {

	init() {
		super.init(texture: nil, color: SKColor.clear, size: CGSize(width: 100, height: 20))

		let body = SKShapeNode(ellipseOf: CGSize(width: 100, height: 20))
		body.fillColor = SKColor.blue
		body.strokeColor = SKColor.black
		addChild(body)

		physicsBody = SKPhysicsBody(edgeLoopFrom: body.path!)
		physicsBody?.affectedByGravity = false
		physicsBody?.isDynamic = false
		physicsBody?.categoryBitMask = BodyType.Player.rawValue
		physicsBody?.contactTestBitMask = BodyType.Ball.rawValue
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

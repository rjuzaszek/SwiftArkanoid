//
//  Tile.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import Foundation
import SpriteKit

class TileNode: SKSpriteNode {

	private let destroyEffect: SKEmitterNode = SKEmitterNode(fileNamed: "DestroyEffect")!

	init(size: CGSize) {
		super.init(texture: nil, color: UIColor.red, size: size)

		physicsBody = SKPhysicsBody(rectangleOf: size)
		physicsBody?.affectedByGravity = false
		physicsBody?.isDynamic = false
		physicsBody?.categoryBitMask = BodyType.Tile.rawValue
		physicsBody?.contactTestBitMask = BodyType.Ball.rawValue
	}

	func destroy() {
		color = SKColor.clear
		physicsBody = nil
		addChild(SKEmitterNode(fileNamed: "DestroyEffect")!)
		run(SKAction.sequence([
			SKAction.wait(forDuration: 0.3),
			SKAction.removeFromParent()
			]))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

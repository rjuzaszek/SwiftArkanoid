//
//  Scene.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import SpriteKit
import GameplayKit

enum BodyType: UInt32 {
	case Ball =		0b1
	case Player =	0b10
	case Tile =		0b100
	case Death =	0b1000
}

enum BallCollisionSum: UInt32 {
	case Player =	0b11
	case Tile =		0b101
	case Death =	0b1001
	case All =		0b1111
}

class Scene: SKScene, SKPhysicsContactDelegate {

	let player: PlayerNode = PlayerNode()
	let ball: BallNode = BallNode(baseSpeed: 10)
	let tiles: TilesNode
	let death: DeathNode

	var firstUpdate: Bool = true
	var previousTime: TimeInterval = 0

	override init(size: CGSize) {
		tiles = TilesNode(size: CGSize(width: size.width, height: size.height * 0.5), hCount: 7, hSpacing: 10, vCount: 10, vSpacing: 10)
		death = DeathNode(width: size.width)
		super.init(size: size)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func didMove(to view: SKView) {
		backgroundColor = UIColor.white

		physicsWorld.gravity = CGVector.zero
		physicsWorld.contactDelegate = self
		physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

		death.position = CGPoint(x: size.width * 0.5, y: 5)
		addChild(death)

		player.position = CGPoint(x: size.width * 0.5 , y: 50)
		addChild(player)

		tiles.position = CGPoint(x: 0, y: size.height - tiles.calculateAccumulatedFrame().size.height - 20)
		addChild(tiles)

		resetBall()
	}

	override func update(_ currentTime: TimeInterval) {
		super.update(currentTime)
		let deltaTime = currentTime - previousTime
		previousTime = currentTime
		if (firstUpdate) {
			firstUpdate = false
			return
		}
		tiles.position.y -= CGFloat(5.0 * deltaTime)
	}

	func resetBall() {
		resetPlayer()
		ball.removeFromParent()

		ball.position = CGPoint(x: player.position.x, y: player.position.y + player.size.height * 0.5 + ball.size.height)
		addChild(ball)

		run(SKAction.sequence([
			SKAction.wait(forDuration: 0.5),
			SKAction.run({ [weak self] in
				self?.ball.startRunning()
			})
			]))
	}

	func resetPlayer() {
		player.run(SKAction.moveTo(x: size.width * 0.5, duration: 0.1))
	}

	func didBegin(_ contact: SKPhysicsContact) {
		switch (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) {
		case BallCollisionSum.Player.rawValue:
			ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0.5))
		case BallCollisionSum.Tile.rawValue:
			if contact.bodyA.node is TileNode {
				(contact.bodyA.node! as! TileNode).destroy()
			} else if contact.bodyB.node is TileNode {
				(contact.bodyB.node! as! TileNode).destroy()
			}
		case BallCollisionSum.Death.rawValue:
			resetBall()
		default:
			break
		}
	}

}
extension Scene {
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		player.run(SKAction.moveTo(x: touches.first!.location(in: self).x, duration: 0.1))
	}

	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		player.run(SKAction.moveTo(x: touches.first!.location(in: self).x, duration: 0.01))
	}

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		resetPlayer()
	}
}

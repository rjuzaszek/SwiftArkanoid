//
//  TilesNode.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import Foundation
import SpriteKit

class TilesNode: SKNode {

	init(size: CGSize, hCount: Int, hSpacing: CGFloat, vCount: Int, vSpacing: CGFloat) {
		super.init()

		let tileSize: CGSize = CGSize(width: (size.width - hSpacing * CGFloat(hCount + 1)) / CGFloat(hCount),
		                              height: (size.height - vSpacing * CGFloat(vCount + 1)) / CGFloat(vCount))

		for hIndex in 0..<hCount {
			for vIndex in 0..<vCount {
				let tile = TileNode(size: tileSize)
				tile.position = CGPoint(x: hSpacing + tileSize.width * 0.5 + CGFloat(hIndex) * (tileSize.width + hSpacing),
				                        y: vSpacing + tileSize.height * 0.5 + CGFloat(vIndex) * (tileSize.height + vSpacing))
				tile.run(SKAction.sequence([
					SKAction.wait(forDuration: TimeInterval((hIndex+1)*(vIndex+1) + vIndex) * 0.1),
					SKAction.repeatForever(
						SKAction.sequence([
							SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 0.2),
							SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 0.2),
							SKAction.wait(forDuration: 1)
							]))
					]))

				addChild(tile)
			}
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

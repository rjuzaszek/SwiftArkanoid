//
//  MenuScene.swift
//  SwiftArcanoid
//
//  Created by Robert on 23/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import SpriteKit

protocol MenuSceneDelegate: class {
    func playGameButtonTapped()
}

class MenuScene: SKScene, ButtonNodeDelegate {
    weak var gameDelegate: MenuSceneDelegate?
    
    let playLabel = SKLabelNode()
    let button = ButtonNode(size: CGSize(width: 100, height: 40))
    
    override init(size: CGSize) {
        super.init(size: size)
        playLabel.fontName = "Chalkduster"
        playLabel.fontSize = 80
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
        playLabel.text = "Play"
        addChild(playLabel)
        
        button.position = CGPoint(x: size.width/2, y: size.height/2)
        button.delegate = self
        addChild(button)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        print(playLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleTap() {
        gameDelegate?.playGameButtonTapped()
    }
}

//
//  ButtonNode.swift
//  SwiftArcanoid
//
//  Created by Robert on 23/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import Foundation
import SpriteKit

protocol ButtonNodeDelegate: class {
    func handleTap()
}

class ButtonNode: SKSpriteNode {
    weak var delegate: ButtonNodeDelegate?
    
    init(size: CGSize) {
        super.init(texture: nil, color: UIColor.blue, size: size)
        self.isUserInteractionEnabled = true
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.handleTap()
    }
}

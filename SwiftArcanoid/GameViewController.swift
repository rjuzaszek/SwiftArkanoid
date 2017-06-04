//
//  GameViewController.swift
//  SwiftArcanoid
//
//  Created by Robert on 16/05/2017.
//  Copyright © 2017 Robert. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, MenuSceneDelegate
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
			view.showsPhysics = true

            showMenu()
        }
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func showMenu() {
        if let view = self.view as! SKView? {
            let scene = MenuScene(size: view.frame.size)
            scene.scaleMode = .aspectFill
            scene.gameDelegate = self
            view.presentScene(scene)
        }
    }
    
    func showGame() {
        if let view = self.view as! SKView? {
            let scene = Scene(size: view.frame.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene, transition: .doorsOpenHorizontal(withDuration: 1))
        }
    }
    
    func playGameButtonTapped() {
        showGame()
    }
}

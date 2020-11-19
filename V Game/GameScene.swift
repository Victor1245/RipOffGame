//
//  GameScene.swift
//  V Game
//
//  Created by Максим Грицков on 18.11.2020.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player : SKSpriteNode?
    var gameCamera : SKCameraNode?
    
    let screen = NSScreen.main?.frame
    
    override func didMove(to view: SKView) {
        //self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        self.player = self.childNode(withName: "player") as? SKSpriteNode
        self.gameCamera = self.childNode(withName: "gameCamera") as? SKCameraNode
        }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 49:
            let jump = SKAction.moveTo(y: (player?.position.y)! + 350, duration: 0.5)
            player?.run(jump)
            
            player?.physicsBody?.velocity.dx += 100
        case 123:
            player?.physicsBody?.velocity.dx -= 500
        case 124:
            player?.physicsBody?.velocity.dx += 500
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        gameCamera?.position.x = player!.position.x
    }
}

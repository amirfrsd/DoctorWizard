// WinScene
//  DoctorWizard
//
//  Created by Brian Ledbetter on 1/28/15.
//  Copyright (c) 2015 codefellows. All rights reserved.
//

import SpriteKit

class WinScene: SKScene {
    
    var isDefaultSong = false

    var mainMenuDelegate : MainMenuDelegate?
    
    let retryButton = SKLabelNode(fontNamed:"GALACTICVANGUARDIANNCV")  //aka OLD
    let repickButton = SKLabelNode(fontNamed:"GALACTICVANGUARDIANNCV") //aka NEW
    var touchLocation :CGPoint = CGPointZero
    
    override func didMoveToView(view: SKView) {
        let background = SKSpriteNode(imageNamed: "youWon")
    
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = -1
        addChild(background)
        
        retryButton.text = "RETRY"
        retryButton.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        retryButton.setScale(4.0)
        retryButton.name = "retry"
        retryButton.zPosition = 2
        addChild(retryButton)
        
        repickButton.text = "REPICK"
        repickButton.position = CGPoint(x: self.size.width*0.8, y: self.size.height/2)
        repickButton.setScale(4.0)
        repickButton.name = "repick"
        repickButton.zPosition = 2
        addChild(repickButton)
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        self.touchLocation = touch.locationInNode(self)
        
        enumerateChildNodesWithName("retry", usingBlock: { (node, _) -> Void in
            let button = node as SKLabelNode
            
            
            if CGRectIntersectsRect(button.frame, CGRect(origin: self.touchLocation, size: CGSize(width: 50, height: 50))) {
                if self.isDefaultSong {
                    self.mainMenuDelegate?.restartWithSameSong(true)
                }else{
                    self.mainMenuDelegate?.restartWithSameSong(false)
                }
            }
        })
        
        enumerateChildNodesWithName("repick", usingBlock: { (node, _) -> Void in
            let button = node as SKLabelNode
            if CGRectIntersectsRect(button.frame, CGRect(origin: self.touchLocation, size: CGSize(width: 50, height: 50))) {
                self.mainMenuDelegate?.restartWithDifferentSong()
            }
        })
        
        
    }
}

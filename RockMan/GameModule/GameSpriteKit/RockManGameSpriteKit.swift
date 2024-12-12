import SwiftUI
import SpriteKit

class RockManGameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: RockManGameData?
    var itemTimer: Timer!
    var positionTimer: Timer!
    var firstItem: FlyingItem!
    var secondItem: FlyingItem!
    var thirdItem: FlyingItem!
    var fourthItem: FlyingItem!
    var rectangle: SKSpriteNode!
    var firstButton:  SKSpriteNode!
    var secondButton: SKSpriteNode!
    var thirdButton:  SKSpriteNode!
    var fourthButton: SKSpriteNode!
    var heart2:  SKSpriteNode!
    var heart3: SKSpriteNode!
    var initialTouchPosition: CGPoint?
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        itemTimer = .scheduledTimer(timeInterval: 6, target: self, selector: #selector(blockGoToBottom), userInfo: nil, repeats: true)
        positionTimer = .scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(removeItems), userInfo: nil, repeats: true)
        gameScore()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            initialTouchPosition = touchLocation
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode {
                if tappedNode.name == "firstButton"  {
                    tapWith(item: firstItem, button: firstButton)
                } else if tappedNode.name == "secondButton" {
                    tapWith(item: secondItem, button: secondButton)
                } else if tappedNode.name == "thirdButton" {
                    tapWith(item: thirdItem, button: thirdButton)
                } else if tappedNode.name == "fourthButton" {
                    tapWith(item: fourthItem, button: fourthButton)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode {
                if tappedNode.name == "firstButton"  {
                    swipeWith(item: firstItem, button: firstButton, touches: touches)
                } else if tappedNode.name == "secondButton" {
                    swipeWith(item: secondItem, button: secondButton, touches: touches)
                } else if tappedNode.name == "thirdButton" {
                    swipeWith(item: thirdItem, button: thirdButton, touches: touches)
                } else if tappedNode.name == "fourthButton" {
                    swipeWith(item: fourthItem, button: fourthButton, touches: touches)
                }
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
    }
}


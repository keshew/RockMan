import SpriteKit
import SwiftUI

extension RockManGameSpriteKit {
    func startTimer() {
        let waitAction = SKAction.wait(forDuration: 1.0)
        let updateAction = SKAction.run { [weak self] in
            self?.updateTimer()
        }
        let sequence = SKAction.sequence([waitAction, updateAction])
        run(SKAction.repeatForever(sequence))
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0 {
            game?.timeLeft -= 1
         } else {
             game?.isWin = true
         }
     }
    
    @objc func removeItems() {
        guard firstItem != nil else { return }
        guard secondItem != nil else { return }
        guard thirdItem != nil else { return }
        guard fourthItem != nil else { return }
        
        if firstItem.position.y < size.height / 4 {
            checkForLosesNote(item: firstItem)
            firstItem.removeFromParent()
        }
        
        if secondItem.position.y < size.height / 4 {
            checkForLosesNote(item: secondItem)
            secondItem.removeFromParent()
        }
        
        if thirdItem.position.y < size.height / 4 {
            checkForLosesNote(item: thirdItem)
            thirdItem.removeFromParent()
        }
        
        if fourthItem.position.y < size.height / 4 {
            checkForLosesNote(item: fourthItem)
            fourthItem.removeFromParent()
        }
    }
    
    @objc func blockGoToBottom() {
        var randomItem = getRandomFlyingItem().randomElement() ?? ""
        var randomMethod = getRandomMethodToCatch().randomElement() ?? ""
        
        firstItem = FlyingItem(texture: SKTexture(imageNamed: randomItem),
                               position: CGPoint(x: size.width / 7,
                                                 y: size.height),
                               categoryBitMask: 3,
                               contactTestBitMask: 3,
                               size: 50)
        firstItem.physicsBody?.collisionBitMask =  0
        firstItem.zPosition = 5
        addChild(firstItem)
        let moveAction = SKAction.moveTo(y: -1000, duration: 10)
        firstItem.run(moveAction)
        
        firstButton = SKSpriteNode(texture: SKTexture(imageNamed: randomMethod))
        firstButton.name = "firstButton"
        firstButton.zPosition = 15
        firstButton.size = CGSize(width: 50, height: 50)
        firstButton.position = CGPoint(x: size.width / 7, y: size.height / 4)
        addChild(firstButton)
        
        randomItem = getRandomFlyingItem().randomElement() ?? ""
        secondItem = FlyingItem(texture: SKTexture(imageNamed: randomItem),
                                position: CGPoint(x: size.width / 2.6,
                                                  y: size.height),
                                categoryBitMask: 3,
                                contactTestBitMask: 3,
                                size: 50)
        secondItem.physicsBody?.collisionBitMask =  0
        secondItem.zPosition = 5
        addChild(secondItem)
        let moveMoneyAction = SKAction.moveTo(y: -1000, duration: 15)
        secondItem.run(moveMoneyAction)
        
        randomMethod = getRandomMethodToCatch().randomElement() ?? ""
        secondButton = SKSpriteNode(texture: SKTexture(imageNamed: randomMethod))
        secondButton.zPosition = 15
        secondButton.name = "secondButton"
        secondButton.size = CGSize(width: 50, height: 50)
        secondButton.position = CGPoint(x: size.width / 2.6, y: size.height / 4)
        addChild(secondButton)
        
        randomItem = getRandomFlyingItem().randomElement() ?? ""
        thirdItem = FlyingItem(texture: SKTexture(imageNamed: randomItem),
                               position: CGPoint(x: size.width / 1.6,
                                                 y: size.height),
                               categoryBitMask: 3,
                               contactTestBitMask: 3,
                               size: 50)
        thirdItem.physicsBody?.collisionBitMask =  0
        thirdItem.zPosition = 5
        addChild(thirdItem)
        let moveBlueNoteMoneyAction = SKAction.moveTo(y: -1000, duration: 8)
        thirdItem.run(moveBlueNoteMoneyAction)
        
        randomMethod = getRandomMethodToCatch().randomElement() ?? ""
        thirdButton = SKSpriteNode(texture: SKTexture(imageNamed: randomMethod))
        thirdButton.zPosition = 15
        thirdButton.name = "thirdButton"
        thirdButton.size = CGSize(width: 50, height: 50)
        thirdButton.position = CGPoint(x: size.width / 1.6, y: size.height / 4)
        addChild(thirdButton)
        
        randomItem = getRandomFlyingItem().randomElement() ?? ""
        fourthItem = FlyingItem(texture: SKTexture(imageNamed: randomItem),
                                position: CGPoint(x: size.width / 1.2,
                                                  y: size.height),
                                categoryBitMask: 3,
                                contactTestBitMask: 3,
                                size: 50)
        fourthItem.physicsBody?.collisionBitMask =  0
        fourthItem.zPosition = 5
        addChild(fourthItem)
        let moveEggeMoneyAction = SKAction.moveTo(y: -1000, duration: 12)
        fourthItem.run(moveEggeMoneyAction)
        
        randomMethod = getRandomMethodToCatch().randomElement() ?? ""
        fourthButton = SKSpriteNode(texture: SKTexture(imageNamed: randomMethod))
        fourthButton.zPosition = 15
        fourthButton.name = "fourthButton"
        fourthButton.size = CGSize(width: 50, height: 50)
        fourthButton.position = CGPoint(x: size.width / 1.2, y: size.height / 4)
        addChild(fourthButton)
    }
    
    func swipeWith(item: FlyingItem, button: SKSpriteNode, touches: Set<UITouch>) {
        let arrowTopTexture = String(describing: SKTexture(imageNamed: ImageName.arrowTop.rawValue))
        let arrowButtomTexture = String(describing: SKTexture(imageNamed: ImageName.arrowBottom.rawValue))
        let arrowLeftTexture = String(describing: SKTexture(imageNamed: ImageName.arrowLeft.rawValue))
        let arrowRightTexture = String(describing: SKTexture(imageNamed: ImageName.arrowRight.rawValue))
        
        if let touch = touches.first, let initialPosition = initialTouchPosition {
            let finalPosition = touch.location(in: self)
            let swipeVector = CGVector(dx: finalPosition.x - initialPosition.x, dy: finalPosition.y - initialPosition.y)
            
            if abs(swipeVector.dx) > abs(swipeVector.dy) {
                if swipeVector.dx > 0 {
                    changeImage(item: item,
                                tapTexture: arrowRightTexture,
                                button: button,
                                idealImage: ImageName.arrowRightGreen.rawValue,
                                avverageImage: ImageName.arrowRightOrange.rawValue,
                                badImage: ImageName.arrowRightRed.rawValue)
                } else {
                    changeImage(item: item,
                                tapTexture: arrowLeftTexture,
                                button: button,
                                idealImage: ImageName.arrowLeftGreen.rawValue,
                                avverageImage: ImageName.arrowLeftOrange.rawValue,
                                badImage: ImageName.arrowLeftRed.rawValue)
                }
            } else {
                if swipeVector.dy > 0 {
                    changeImage(item: item,
                                tapTexture: arrowTopTexture,
                                button: button,
                                idealImage: ImageName.arrowTopGreen.rawValue,
                                avverageImage: ImageName.arrowTopOrange.rawValue,
                                badImage: ImageName.arrowTopRed.rawValue)
                } else {
                    changeImage(item: item,
                                tapTexture: arrowButtomTexture,
                                button: button,
                                idealImage: ImageName.arrowBottomGreen.rawValue,
                                avverageImage: ImageName.arrowBottomOrange.rawValue,
                                badImage: ImageName.arrowBottomRed.rawValue)
                }
            }
        }
        initialTouchPosition = nil
    }
    
    func changeImage(item: FlyingItem, tapTexture: String, button: SKSpriteNode, idealImage: String, avverageImage: String, badImage: String) {
        let buttonTexture = String(describing: button.texture!)
        if tapTexture == buttonTexture {
            if item.position.y > size.height / 2.6 {
                button.texture = SKTexture(imageNamed: badImage)
                checkForBrokeItem(item: item)
                item.removeFromParent()
            } else if rectangle.intersects(item) {
                button.texture = SKTexture(imageNamed: idealImage)
                checkForBrokeItem(item: item)
                item.removeFromParent()
            } else {
                button.texture = SKTexture(imageNamed: avverageImage)
                checkForBrokeItem(item: item)
                item.removeFromParent()
            }
        }
    }
    
    func tapWith(item: FlyingItem, button: SKSpriteNode) {
        let tapTexture = String(describing: SKTexture(imageNamed: ImageName.tapButton.rawValue))
        changeImage(item: item,
                    tapTexture: tapTexture,
                    button: button,
                    idealImage: ImageName.greenTapButton.rawValue,
                    avverageImage: ImageName.orangeTapButton.rawValue,
                    badImage: ImageName.redTapButton.rawValue)
    }
    
    func gameLose() {
        if game?.countOfLives ?? 0 <= 0 {
            game?.isLose = true
        }
    }
    
    func checkForLosesNote(item: FlyingItem) {
        let itemTexture = String(describing: item.texture!)
        let blueNote = String(describing: SKTexture(imageNamed: ImageName.blueNote.rawValue))
        let redNote = String(describing: SKTexture(imageNamed: ImageName.redNote.rawValue))
        let pinkNote = String(describing: SKTexture(imageNamed: ImageName.pinkNote.rawValue))
        let greenNote = String(describing: SKTexture(imageNamed: ImageName.greenNote.rawValue))
        
        if itemTexture == blueNote || itemTexture == redNote || itemTexture == pinkNote || itemTexture == greenNote {
            game?.countOfLives -= 0.15
            gameScore()
            gameLose()
        }
    }
    
    func checkForBrokeItem(item: FlyingItem) {
        let eggTexture = String(describing: SKTexture(imageNamed: ImageName.egg.rawValue))
        let egg1Texture = String(describing: SKTexture(imageNamed: ImageName.egg1.rawValue))
        let tomatoTexture = String(describing: SKTexture(imageNamed: ImageName.tomato.rawValue))
        let itemTexture = String(describing: item.texture!)
        
        if itemTexture == eggTexture {
            game?.countOfLives -= 0.15
            gameScore()
            let brokenEgg = SKSpriteNode(imageNamed: ImageName.eggBroken.rawValue)
            brokenEgg.size = CGSize(width: size.width / 3.5, height: size.height / 8)
            brokenEgg.zPosition = 10
            brokenEgg.position = (CGPoint(x: size.width / 2, y: size.height / 8))
            addChild(brokenEgg)
            let fadeOutAction = SKAction.fadeOut(withDuration: 1)
            let removeAction = SKAction.removeFromParent()
            let sequence = SKAction.sequence([fadeOutAction, removeAction])
                
            brokenEgg.run(sequence)
        }
        
        if itemTexture == egg1Texture {
            game?.countOfLives -= 0.15
            gameScore()
            let brokenEgg = SKSpriteNode(imageNamed: ImageName.eggBroken.rawValue)
            brokenEgg.size = CGSize(width: size.width / 3.5, height: size.height / 8)
            brokenEgg.zPosition = 10
            brokenEgg.position = (CGPoint(x: size.width / 2, y: size.height / 8))
            addChild(brokenEgg)
            let fadeOutAction = SKAction.fadeOut(withDuration: 1)
            let removeAction = SKAction.removeFromParent()
            let sequence = SKAction.sequence([fadeOutAction, removeAction])
            brokenEgg.run(sequence)
        }
        
        if itemTexture == tomatoTexture {
            game?.countOfLives -= 0.15
            gameScore()
            let tomatoBroken = SKSpriteNode(imageNamed: ImageName.tomatoBroken.rawValue)
            tomatoBroken.size = CGSize(width: size.width / 3, height: size.height / 8)
            tomatoBroken.zPosition = 10
            tomatoBroken.position = (CGPoint(x: size.width / 2, y: size.height / 8))
            addChild(tomatoBroken)
            let fadeOutAction = SKAction.fadeOut(withDuration: 1)
            let removeAction = SKAction.removeFromParent()
            let sequence = SKAction.sequence([fadeOutAction, removeAction])
            tomatoBroken.run(sequence)
        }
        gameLose()
    }
    
    func getRandomFlyingItem() -> [String] {
        let allItems: [String] = [ImageName.money.rawValue,
                                          ImageName.blueNote.rawValue,
                                          ImageName.redNote.rawValue,
                                          ImageName.pinkNote.rawValue,
                                          ImageName.egg.rawValue,
                                          ImageName.egg1.rawValue,
                                          ImageName.tomato.rawValue]
        return allItems
    }
    
    func getRandomBack() -> [String] {
        let allItems: [String] = [ImageName.gameBackground.rawValue,
                                  ImageName.gameBackground2.rawValue,
                                  ImageName.gameBackground3.rawValue,
                                  ImageName.gameBackground4.rawValue,
                                  ImageName.gameBackground5.rawValue]
        return allItems
    }
    
    func getRandomMethodToCatch() -> [String] {
        let allItems: [String] = [ImageName.arrowTop.rawValue,
                                  ImageName.arrowLeft.rawValue,
                                  ImageName.arrowRight.rawValue,
                                  ImageName.arrowBottom.rawValue,
                                  ImageName.tapButton.rawValue]
        return allItems
    }
    
    func setupView() {
        let background = SKSpriteNode(imageNamed: getRandomBack().randomElement() ?? "")
        background.size = CGSize(width: size.width, height: size.height)
        background.xScale = 2
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        let menuBackground = SKSpriteNode(imageNamed: ImageName.smallButtonBackground.rawValue)
        menuBackground.size = CGSize(width: size.width / 5, height: size.height / 12)
        menuBackground.zPosition = 10
        menuBackground.position = CGPoint(x: size.width / 7.1, y: size.height / 1.15)
        addChild(menuBackground)
        
        let menu = SKSpriteNode(imageNamed: ImageName.menu.rawValue)
        menu.size = CGSize(width: size.width / 10, height: size.height / 25)
        menu.zPosition = 10
        menu.position = (CGPoint(x: size.width / 7.1, y: size.height / 1.15))
        addChild(menu)
        
        let moneyBackground = SKSpriteNode(imageNamed: ImageName.buttonBackground.rawValue)
        moneyBackground.size = CGSize(width: size.width / 3, height: size.height / 12)
        moneyBackground.zPosition = 10
        moneyBackground.position = CGPoint(x: size.width / 1.25, y: size.height / 1.15)
        addChild(moneyBackground)
        
        let money = SKSpriteNode(imageNamed: ImageName.money.rawValue)
        money.size = CGSize(width: size.width / 14, height: size.height / 25)
        money.zPosition = 10
        money.position = CGPoint(x: size.width / 1.15, y: size.height / 1.15)
        addChild(money)
        
        let moneyLabel = SKLabelNode(fontNamed: "Jomhuria-Regular")
        moneyLabel.text = "2000"
        moneyLabel.fontSize = 35
        moneyLabel.zPosition = 10
        moneyLabel.position = CGPoint(x: size.width / 1.34, y: size.height / 1.16)
        moneyLabel.fontColor = .white
        addChild(moneyLabel)
        
        rectangle = SKSpriteNode(imageNamed: ImageName.rectangle.rawValue)
        rectangle.size = CGSize(width: size.width / 1.1, height: size.height / 10)
        rectangle.zPosition = 10
        rectangle.position = CGPoint(x: size.width / 2, y: size.height / 4)
        addChild(rectangle)
        
        let line1 = SKSpriteNode(imageNamed: ImageName.seperateLine.rawValue)
        line1.size = CGSize(width: size.width / 120, height: size.height / 14)
        line1.position = CGPoint(x: size.width / 3.8, y: size.height / 4)
        addChild(line1)
        
        let line2 = SKSpriteNode(imageNamed: ImageName.seperateLine.rawValue)
        line2.size = CGSize(width: size.width / 120, height: size.height / 14)
        line2.position = CGPoint(x: size.width / 2, y: size.height / 4)
        addChild(line2)
        
        let line3 = SKSpriteNode(imageNamed: ImageName.seperateLine.rawValue)
        line3.size = CGSize(width: size.width / 120, height: size.height / 14)
        line3.position = CGPoint(x: size.width / 1.35, y: size.height / 4)
        addChild(line3)
        
        let lifeBuy = SKSpriteNode(imageNamed: ImageName.lifeBuy.rawValue)
        lifeBuy.size = CGSize(width: size.width / 5.5, height: size.height / 11.5)
        lifeBuy.zPosition = 10
        lifeBuy.position = CGPoint(x: size.width / 7.2, y: size.height / 7)
        addChild(lifeBuy)
        
        let rockMan = SKSpriteNode(imageNamed: ImageName.rockMan.rawValue)
        rockMan.size = CGSize(width: size.width / 4, height: size.height / 6)
        rockMan.zPosition = 10
        rockMan.position = CGPoint(x: size.width / 2, y: size.height / 10.5)
        addChild(rockMan)
        
        let heart1 = SKSpriteNode(imageNamed: ImageName.heart.rawValue)
        heart1.size = CGSize(width: size.width / 12, height: size.height / 25)
        heart1.zPosition = 10
        heart1.position = CGPoint(x: size.width / 1.42, y: size.height / 6)
        addChild(heart1)
        
        heart2 = SKSpriteNode(imageNamed: ImageName.heart.rawValue)
        heart2.size = CGSize(width: size.width / 12, height: size.height / 25)
        heart2.zPosition = 10
        heart2.position = CGPoint(x: size.width / 1.25, y: size.height / 6)
        addChild(heart2)
        
        heart3 = SKSpriteNode(imageNamed: ImageName.heart.rawValue)
        heart3.size = CGSize(width: size.width / 12, height: size.height / 25)
        heart3.zPosition = 10
        heart3.position = CGPoint(x: size.width / 1.11, y: size.height / 6)
        addChild(heart3)
    }
    
    func gameScore() {
        if game!.countOfLives < 3.0 {
            heart3.texture = SKTexture(imageNamed: ImageName.grayHeart.rawValue)
        }
        
        if game!.countOfLives < 2.0 {
            heart2.texture = SKTexture(imageNamed: ImageName.grayHeart.rawValue)
        }
    }
}


import SpriteKit
import SwiftUI

class FlyingItem: SKSpriteNode {
    init(texture: SKTexture,
         position: CGPoint,
         categoryBitMask: UInt32,
         contactTestBitMask: UInt32,
         size: CGFloat) {
        let texture = texture
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.size = CGSize(width: size, height: size)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size, height: size))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = categoryBitMask
        self.physicsBody?.contactTestBitMask = contactTestBitMask
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

struct SmallButton: View {
    var foregroundImage: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(RockImageName.smallButtonBackground.rawValue)
                    .resizable()
                    .frame(width: 60, height: 50)
                
                Image(foregroundImage)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
    }
}

struct WideButton: View {
    var text: String
    var action: () -> Void
    var sizeWButton: CGFloat
    var sizeHButton: CGFloat
    var sizeText: CGFloat
    var offsetY: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(RockImageName.buttonBackground.rawValue)
                    .resizable()
                    .frame(minWidth: sizeWButton, maxWidth: sizeWButton, minHeight: sizeHButton - 20, maxHeight: sizeHButton)
                
                Text(text)
                    .Jomhuria(size: sizeText, color: .yellow)
                    .offset(y: offsetY)
                    .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
            }
        }
    }
}

struct DifficultButton: View {
    var text: String
    var image: String
    var action: () -> Void
    var sizeWButton: CGFloat
    var sizeHButton: CGFloat
    var sizeText: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(minWidth: sizeWButton,
                           maxWidth: sizeWButton,
                           minHeight: sizeHButton - 20,
                           maxHeight: sizeHButton)
                
                Text(text)
                    .Jersey(size: sizeText, color: .white)
                    .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
            }
        }
    }
}

struct LevelPin: View {
    var image: String
    var text: String
    var offsetX: CGFloat
    var offsetY: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                if image == RockImageName.emptyPin.rawValue {
                    Text(text)
                        .Jomhuria(size: 28, color: .white)
                        .offset(x: -0.5, y: 2)
                }
            }
        }
        .disabled(image != RockImageName.lockedPin.rawValue ? false : true)
        .offset(x: offsetX, y: offsetY)
    }
}


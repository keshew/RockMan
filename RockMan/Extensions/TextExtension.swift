import SwiftUI

extension Text {
    func Jelly(size: CGFloat, color: Color = Color(#colorLiteral(red: 255/255, green: 144/255, blue: 0/255, alpha: 1))) -> some View {
        self.font(.custom("JollyJack", size: size))
            .bold()
            .foregroundColor(color)
    }
    
    func Jomhuria(size: CGFloat, color: Color = Color(#colorLiteral(red: 255/255, green: 144/255, blue: 0/255, alpha: 1))) -> some View {
        self.font(.custom("Jomhuria-Regular", size: size))
            .bold()
            .foregroundColor(color)
    }
    
    func Jersey(size: CGFloat, color: Color = Color(#colorLiteral(red: 255/255, green: 144/255, blue: 0/255, alpha: 1))) -> some View {
        self.font(.custom("Jersey10-Regular", size: size))
            .bold()
            .foregroundColor(color)
    }
}





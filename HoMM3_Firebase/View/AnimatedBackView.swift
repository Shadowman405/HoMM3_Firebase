//
//  AnimatedBackView.swift
//  HoMM3_SwiftUI
//
//  Created by Maxim Mitin on 5.09.22.
//

import SwiftUI

struct AnimatedBackView: View {
    var body: some View {
        AnimatedBack()
            .edgesIgnoringSafeArea(.all)
            .blur(radius: 50)
    }
}

struct AnimatedBack: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.red, Color.purple, Color.indigo, Color.yellow, Color.orange]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6)
                .repeatForever())
            .onReceive(timer) { _ in
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: -2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            }
    }
}

struct AnimatedBackView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackView()
    }
}

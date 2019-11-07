//
//  ContentView.swift
//  Bullseye
//
//  Created by Dave Stanton on 11/6/19.
//  Copyright © 2019 Dave Stanton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisibile: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to")
                Text("\(self.target)")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            // Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisibile = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisibile) { () -> Alert in
                let roundedValue = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n You scored \(self.pointsForCurrentRound()) points."), dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {}) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        .padding(.all, 20)
    }
    
    func pointsForCurrentRound() -> Int {
    
        let roundedValue: Int = Int(self.sliderValue.rounded())
        let difference: Int = abs(roundedValue - self.target)
        let awardedPoints: Int = 100 - difference
        return awardedPoints
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

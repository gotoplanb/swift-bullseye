//
//  ContentView.swift
//  Bullseye
//
//  Created by Dave Stanton on 11/6/19.
//  Copyright © 2019 Dave Stanton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisibile = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to")
                Text("\(target)")
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
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
                return Alert(title: Text("\(alertTitle())"), message: Text("The slider's value is \(sliderValueRounded()).\n You scored \(pointsForCurrentRound()) points."), dismissButton: .default(Text("Awesome!")) {
                    self.score += self.pointsForCurrentRound()
                    self.round += 1
                    self.target = Int.random(in: 1...100)
                    })
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        .padding(.all, 20)
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference < 5 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let title: String
        if amountOff() == 0 {
            title = "Perfect!"
        } else if amountOff() < 5 {
            title = "Almost!"
        } else if amountOff() < 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

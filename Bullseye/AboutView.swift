//
//  AboutView.swift
//  Bullseye
//
//  Created by Dave Stanton on 11/11/19.
//  Copyright © 2019 Dave Stanton. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let paleOrange = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0/255.0)
    
    struct HeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct TextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Bullseye").modifier(HeadingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dradding a slider. This is Bullseye, the game where you can win points and earn fame by dradding a slider.").modifier(TextStyle()).lineLimit(nil)
                Text("Third line.").modifier(TextStyle())
                Text("Fourth line.").modifier(TextStyle())
            }
            .background(paleOrange)
            .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

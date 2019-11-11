//
//  AboutView.swift
//  Bullseye
//
//  Created by Dave Stanton on 11/11/19.
//  Copyright © 2019 Dave Stanton. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Bullseye")
            Text("This is Bullseye, the game where you can win points and earn fame by dradding a slider.")
            Text("Third line.")
            Text("Fourth line.")
        }
        .navigationBarTitle("About Bullseye")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

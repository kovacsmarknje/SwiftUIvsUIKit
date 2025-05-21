//
//  ContentView.swift
//  ImageDemoSwiftUI
//
//  Created by Kovács Márk on 2025. 02. 02..
//

import SwiftUI

struct ContentView: View {
    let images:[String] = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20"]
    var body: some View {
        List(images, id: \.self) { img in
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
        }
    }
}

#Preview {
    ContentView()
}



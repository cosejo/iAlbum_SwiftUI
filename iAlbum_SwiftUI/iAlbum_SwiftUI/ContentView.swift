//
//  ContentView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct ContentView: View {
    
    let gridGuides = [
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridGuides, content: {
                PhotoGridCell(imageName: "mail")
                PhotoGridCell(imageName: "car")
                PhotoGridCell(imageName: "wifi")
                PhotoGridCell(imageName: "house")
                PhotoGridCell(imageName: "pc")
                PhotoGridCell(imageName: "smoke")
                PhotoGridCell(imageName: "trash")
            })
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

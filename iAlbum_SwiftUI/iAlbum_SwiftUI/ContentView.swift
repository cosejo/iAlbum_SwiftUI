//
//  ContentView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: ApplicationData
    
    let gridGuides = [
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridGuides, content: {
                ForEach(appData.userData, id: \.self.photo.id) { photo in
                    PhotoGridCell(imageName: photo.photo.title)
                }
            })
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .environmentObject(ApplicationData())
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro"))
            .environmentObject(ApplicationData())
    }
}

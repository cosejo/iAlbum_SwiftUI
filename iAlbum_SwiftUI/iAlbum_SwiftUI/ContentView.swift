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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridGuides, content: {
                    ForEach(appData.userData, id: \.self.photo.id) { photoViewModel in
                        NavigationLink(
                            destination: PhotoDetailView(imageName: photoViewModel.photo.title),
                            label: {
                                PhotoGridCell(imageName: photoViewModel.photo.title)
                            })
                    }
                    .foregroundColor(.black)
                })
                .padding()
            }
        }
        .navigationTitle("Images")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .environmentObject(ApplicationData())
        ContentView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
            .previewDevice(PreviewDevice(rawValue: "iPad Pro"))
            .environmentObject(ApplicationData())
    }
}

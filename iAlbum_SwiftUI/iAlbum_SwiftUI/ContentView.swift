//
//  ContentView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var photosListViewModel = PhotosListViewModel()
    
    init() {
        photosListViewModel.loadPhotos()
    }
    
    let gridGuides = [
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top)
    ]
    
    var body: some View {
//        List {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: gridGuides, content: {
                        ForEach(photosListViewModel.photos, id: \.self.id) { photoViewModel in
                            NavigationLink(
                                destination: PhotoDetailView(urlString: photoViewModel.thumbnailUrl),
                                label: {
                                    PhotoGridCell(urlString: photoViewModel.imageURL)
                                })
                                .onAppear(perform: {
                                    if photosListViewModel.photos.last?.id == photoViewModel.id {
                                        photosListViewModel.loadPhotos()
                                    }
                                })
                        }
                        .foregroundColor(.black)
                    })
                    .padding()
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
//        }
//        .listStyle(.plain)
//        .refreshable {
//            onRefresh()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//            .environmentObject(ApplicationData())
        //        ContentView()
        //            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        //            .previewDevice(PreviewDevice(rawValue: "iPad Pro"))
        //            .environmentObject(ApplicationData())
    }
}


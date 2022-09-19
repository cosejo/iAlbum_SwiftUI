//
//  ContentView.swift
//  iAlbum_SwiftUI
//
//  Created by Carlos Osejo on 14/9/22.
//

import SwiftUI

struct PhotoListView: View {
    @ObservedObject private var photosListViewModel = PhotosListViewModel()
    @State var showErrorAlert = false
    
    let errorAlertTitle = "shared.error.alert.title"
    
    init() {
        photosListViewModel.loadPhotos()
    }
    
    let gridGuides = [
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top),
        GridItem(.flexible(minimum: 100), alignment: .top)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                RefreshControl(coordinateSpace: .named("RefreshControl")) {
                    photosListViewModel.reloadPhotos()
                }
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
            .coordinateSpace(name: "RefreshControl")
            .navigationBarHidden(true)
            .animation(.linear)
            .alert(isPresented: $photosListViewModel.error, content: {
                Alert(title: Text(PhotosListUIStringConstants.errorAlertTitle.localized), message: Text(PhotosListUIStringConstants.errorAlertMessage.localized), dismissButton: nil)
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle("")
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView()
    }
}


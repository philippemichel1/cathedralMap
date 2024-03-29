//
//  LoockAround.swift
//  CathedraleMap
//
//  Created by Philippe MICHEL on 25/03/2024.
//

import SwiftUI
import MapKit

struct LookAroundView: View {
    @State var lookAroundScene:MKLookAroundScene?
    var selectedLocation:CathedralModel
    
    var body: some View {
        
        LookAroundPreview(initialScene: lookAroundScene)
            .overlay(alignment:.bottomTrailing) {
                HStack {
                    Text("\(selectedLocation.name)")
                        
                }
                .font(.caption)
                .foregroundStyle(.white)
                .padding(18)
            }
            .onAppear {
                getlookAroundScene()
                
            }
        // en cas de changement de selection de position 
            .onChange(of: selectedLocation) {
                getlookAroundScene()
            }
    }
    // optenir une position
    func getlookAroundScene() {
        // pas de selection
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(coordinate: CLLocationCoordinate2D(latitude: selectedLocation.around_lat,longitude: selectedLocation.around_lon))
            // essai d'afficher la requete
            lookAroundScene = try? await request.scene
        }
    }
}


#Preview {
    LookAroundView(selectedLocation: CathedralModel(name: "Notre Dame de Strasbourg", longitude: 7.7510521, latitude: 48.5818885,around_lon: 7.7510521,around_lat:                 48.5818885))
}


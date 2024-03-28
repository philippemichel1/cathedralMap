//
//  ContentView.swift
//  CathedraleMap
//
//  Created by Philippe MICHEL on 25/03/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var cathedralList:[CathedralModel] =
    [CathedralModel(name: "Notre-Dame de Paris", longitude: 2.3500501, latitude: 48.85293,around_lon: 2.350675,around_lat: 48.853127),
     CathedralModel(name: "Chartres, Cloître Notre-Dame,", longitude: 1.487618, latitude: 48.4470284,around_lon: 1.4878371 ,around_lat:48.4478026),
     CathedralModel(name: "Notre-Dame d’Amiens", longitude: 2.3020286, latitude: 49.894622,around_lon: 2.3009013,around_lat: 49.8972943),
     CathedralModel(name: "Saint-Étienne de Bourges", longitude: 2.398494, latitude: 47.081774,around_lon: 2.398224, around_lat: 47.082329),
     CathedralModel(name: "Saint-Pierre et Saint-Paul de Nantes", longitude: -1.550351, latitude: 47.217731,around_lon:-1.5512855 ,around_lat: 47.2181706),
     CathedralModel(name: "Notre Dame de Strasbourg", longitude: 7.7510521, latitude: 48.5818885,around_lon: 7.7510521,around_lat: 48.5818885),
     CathedralModel(name: "Notre-Dame de Reims", longitude: 4.033298, latitude: 49.2535616,around_lon: 4.0341872, around_lat: 49.2544331)]
    
    
    
    @State private var cameraPosition:MapCameraPosition = .automatic
    @State private var openView:Bool = false
    @State private var selectCathedral:UUID?
    
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectCathedral) {
            ForEach(cathedralList, id:\ .id ) { cathedral in
                Annotation(cathedral.name, coordinate: CLLocationCoordinate2D(latitude: cathedral.latitude, longitude: cathedral.longitude), anchor: .bottomLeading) {
                    PinAnnotation(masquerAnnotation: $openView)
                }
                .tag(cathedral.id)
            }
        }
        .mapControls{
            MapPitchToggle()
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .safeAreaInset(edge:.bottom){
            VStack {
                    if let selectCathedral {
                        if let item = cathedralList.first(where: {$0.id == selectCathedral})  {
                            LookAroundView(selectedLocation: item)
                                .frame(height: 128)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding([.top,.horizontal])
                        }
                    }
                    Button {
                        cameraPosition = .automatic
                    } label: {
                        Image(systemName: Ressources.image.Center.rawValue)
                            .frame(width:43,height: 43)
                            .background(.white)
                            .opacity(0.5)
                            .cornerRadius(10)
                            //.position(x:365,y: 80)
                        
                    }
                
            }
        }
        
        .onChange(of:selectCathedral) {
            guard let selectCathedral else {return}
            guard let  item = cathedralList.first(where: {$0.id == selectCathedral}) else {return}
        }
        .overlay(alignment:.topTrailing,content: {
            
        })
        .onAppear(perform: {
            print(cathedralList)
            Task {
            }
        })
    }
}



#Preview {
    ContentView()
}

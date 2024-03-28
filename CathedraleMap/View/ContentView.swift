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
     CathedralModel(name: "Cathédrale Saint-Maurice d'Angers", longitude: -0.55477, latitude: 47.47061,around_lon: -0.55477 ,around_lat:47.47061),
     CathedralModel(name: "Notre-Dame d’Amiens", longitude: 2.3020286, latitude: 49.894622,around_lon: 2.3009013,around_lat: 49.8972943),
     CathedralModel(name: "Saint-Étienne de Bourges", longitude: 2.398494, latitude: 47.081774,around_lon: 2.398224, around_lat: 47.082329),
     CathedralModel(name: "Saint-Pierre et Saint-Paul de Nantes", longitude: -1.550351, latitude: 47.217731,around_lon:-1.5512855 ,around_lat: 47.2181706),
     CathedralModel(name: "Notre Dame de Strasbourg", longitude: 7.7510521, latitude: 48.5818885,around_lon: 7.7510521,around_lat: 48.5818885),
     CathedralModel(name: "Notre-Dame de Reims", longitude: 4.033298, latitude: 49.2535616,around_lon: 4.0341872, around_lat: 49.2544331)]

    
    @State private var cameraPosition:MapCameraPosition = .automatic
    @State private var openView:Bool = false
    @State private var selectCathedral:UUID?
    
    
    var body: some View {
        // position de la caméra et numéro de selection
        Map(position: $cameraPosition, selection: $selectCathedral) {
            ForEach(cathedralList, id:\ .id ) { cathedral in
                Annotation(cathedral.name, coordinate: CLLocationCoordinate2D(latitude: cathedral.latitude, longitude: cathedral.longitude), anchor: .bottomLeading) {
                    PinAnnotation(masquerAnnotation: $openView)
                }
                //repere pour chaque id d'annotation
                .tag(cathedral.id)
            }
        }
        .mapControls{
            MapPitchToggle()
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .onMapCameraChange(frequency:.continuous) { context in
            print(context.region)
            
        }
        .safeAreaInset(edge:.bottom){
            
            VStack {
                // vérifie si la selection appartient bien à la liste des cathédrales
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
                    }
            }
        }
        // si l'utilisateur change de séléction met à jour la vue aronview
        .onChange(of:selectCathedral) {
            guard let selectCathedral else {return}
            guard let  item = cathedralList.first(where: {$0.id == selectCathedral}) else {return}
        }
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

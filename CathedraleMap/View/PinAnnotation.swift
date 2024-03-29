//
//  PinAnnotation.swift
//  CathedraleMap
//
//  Created by Philippe MICHEL on 25/03/2024.
//

import SwiftUI
struct PinAnnotation: View {
    let sizeTemplateCircle:CGFloat = 45
    let sizePicture:CGFloat = 22
    let sizeTriangle:CGFloat = 13
    @Binding var hideAnnotation:Bool
    
    
    // Marqueurs de carte personnalisée
    var body: some View {
        VStack(spacing: 0)  {
            ZStack{
                Circle()
                    .frame(width: sizeTemplateCircle, height:sizeTemplateCircle)
                    .foregroundColor(.red)
                    .opacity(hideAnnotation ? 0 : 1)
                Image(systemName: Ressources.image.Pacto.rawValue )
                    .resizable()
                    .scaledToFit()
                    .frame(width: sizePicture, height: sizePicture)
                    .font(.headline)
                    .foregroundColor(Color("MonVert"))
                    .padding(6)
                    .background()
                    .cornerRadius(36)
                    .opacity(hideAnnotation ? 0 : 1)
            }
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: sizeTriangle, height: sizeTriangle)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom, 40)
            // pas utilidé 
                .opacity(hideAnnotation ? 0 : 1)
        }
    }
}

#Preview {
    PinAnnotation(hideAnnotation: .constant(false))
}


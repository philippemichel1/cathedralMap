//
//  PinAnnotation.swift
//  CathedraleMap
//
//  Created by Philippe MICHEL on 25/03/2024.
//

import SwiftUI
struct PinAnnotation: View {
    let tailleTrameCercle:CGFloat = 45
    let tailleImage:CGFloat = 22
    let tailleTriangle:CGFloat = 13
    @Binding var masquerAnnotation:Bool
    
    var body: some View {
        VStack(spacing: 0)  {
            ZStack{
                Circle()
                    .frame(width: tailleTrameCercle, height:tailleTrameCercle)
                    .foregroundColor(.red)
                    .opacity(masquerAnnotation ? 0 : 1)
                Image(systemName: Ressources.image.Pacto.rawValue )
                    .resizable()
                    .scaledToFit()
                    .frame(width: tailleImage, height: tailleImage)
                    .font(.headline)
                    .foregroundColor(Color("MonVert"))
                    .padding(6)
                    .background()
                    .cornerRadius(36)
                    .opacity(masquerAnnotation ? 0 : 1)
            }
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: tailleTriangle, height: tailleTriangle)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom, 40)
                .opacity(masquerAnnotation ? 0 : 1)

        }
    }
        
}


#Preview {
    PinAnnotation(masquerAnnotation: .constant(false))
}


//
//  MapLinkView.swift
//  Portfolio
//
//  Created by Денис Андриевский on 17.05.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import SwiftUI

struct MapLinkView: View {
    
    var text: String
    var imageTitle: String
    
    var body: some View {
        ZStack {
            Color(.lightGray)
                .opacity(0.5)
            HStack {
                Image(imageTitle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 38, height: 38)
                NavigationLink(destination: MapView()) {
                    Text(text)
                    .font(.custom("Vidaloka-Regular", size: 18))
                    .foregroundColor(.white)
                }
            }
        }
        .cornerRadius(15)
    }
}

struct MapLinkView_Previews: PreviewProvider {
    static var previews: some View {
        MapLinkView(text: "Kyiv, Ukraine", imageTitle: "location")
    }
}

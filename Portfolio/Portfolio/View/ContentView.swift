//
//  ContentView.swift
//  Portfolio
//
//  Created by Денис Андриевский on 10.05.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemIndigo)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(0.0)
                        .frame(width: 120, height: 120)
                        .cornerRadius(60)
                    VStack(alignment: .leading) {
                        Text("Denys Andriievskyi")
                            .font(.custom("Vidaloka-Regular", size: 28))
                            .foregroundColor(.white)
                        Text("iOS Developer")
                            .font(.custom("Vidaloka-Regular", size: 28))
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 20.0) {
                            MapLinkView(text: "Kyiv, Ukraine", imageTitle: "location")
                            .frame(height: 44)
                            HyperLinkView(text: "GitHub", imageTitle: "github", url: "https://github.com/ho-ku")
                            .frame(height: 44)
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 20.0) {
                            HyperLinkView(text: "Telegram", imageTitle: "telegram", url: "https://t.me/justHoku")
                                .frame(height: 44)
                            PhoneView(text: "+380660365299", imageTitle: "phone")
                            .frame(height: 44)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

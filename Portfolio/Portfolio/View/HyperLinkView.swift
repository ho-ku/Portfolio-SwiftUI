//
//  HyperLinkView.swift
//  Portfolio
//
//  Created by Денис Андриевский on 17.05.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import SwiftUI

struct HyperLinkView: View {
    
    var text: String
    var imageTitle: String
    var url: String
    
    @State var showingAlert = false
    
    var body: some View {
        
        ZStack {
            Color(.lightGray)
                .opacity(0.5)
            HStack {
                Image(imageTitle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 38, height: 38)
                Button(text) {
                    guard let url = URL(string: self.url) else { self.showingAlert = true; return }
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
                .alert(isPresented: $showingAlert) { () -> Alert in
                    Alert(title: Text("Oops..."), message: Text("No data available on link"), dismissButton: Alert.Button.default(Text("OK")))
                }
                .font(.custom("Vidaloka-Regular", size: 18))
                .foregroundColor(.white)
            }
        }
    .cornerRadius(15)
        
    }
}

struct HyperLinkView_Previews: PreviewProvider {
    static var previews: some View {
        HyperLinkView(text: "GitHub", imageTitle: "github", url: "https://github.com/ho-ku")
    }
}

//
//  PhoneView.swift
//  Portfolio
//
//  Created by Денис Андриевский on 17.05.2020.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import SwiftUI

struct PhoneView: View {
    
    var text: String
    var imageTitle: String
    
    @State var showingErrorAlert = false
    @State var showingCallAlert = false
    @State var phoneURL: URL?
    private var phoneURLString: String {
        var temp = text
        temp.removeFirst()
        return temp
    }
    
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
                    guard let phoneURL = URL(string: "tel://" + self.phoneURLString) else { self.showingErrorAlert = true; return }
                    self.phoneURL = phoneURL
                    self.showingCallAlert = true
                }
                .alert(isPresented: $showingErrorAlert) { () -> Alert in
                    Alert(title: Text("Oops..."), message: Text("Can't make phone cell"), dismissButton: Alert.Button.default(Text("OK")))
                }
                .alert(isPresented: $showingCallAlert, content: { () -> Alert in
                    Alert(title: Text("Call \(text)?"), message: nil, primaryButton: .default(Text("Yes"), action: {
                        guard let phoneURL = self.phoneURL else { return }
                        UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                    }), secondaryButton: .cancel())
                })
                .font(.custom("Vidaloka-Regular", size: 16))
                .foregroundColor(.white)
            }
        }
    .cornerRadius(15)
    }
}

struct PhoneView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneView(text: "+380660365299", imageTitle: "phone")
    }
}

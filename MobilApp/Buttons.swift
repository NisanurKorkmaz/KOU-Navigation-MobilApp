//
//  Buttons.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 03/10/2022.
//

import SwiftUI

struct Buttons: View {
    @State private var selection : String? = nil
    @State private var selection1 : String? = nil
    @State private var selection2 : String? = nil
    var Locations: [Model] = load("locations.json")
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                HStack(spacing : 5){
                
                NavigationLink(destination: SearchingPageView() , tag : "Second", selection: $selection ){
                    EmptyView()
                }
                    Button("ARAMA YAPMAK IÇIN TIKLAYINIZ") {self.selection = "Second" }
                    .buttonStyle(PrimaryButtonStyle())
                    .multilineTextAlignment(.center)
            }.padding()

                HStack(spacing:5){

                    NavigationLink(destination: MapView(veri: "6"), tag : "a", selection: $selection ){
                        EmptyView()
                    }
                    Button("ILETISIM FAKÜLTESI"){self.selection = "a" }
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)


                    NavigationLink(destination: MapView(veri: "9"), tag : "b", selection: $selection ){
                        EmptyView()
                    }
                    Button("EGITIM FAKÜLTESI") { self.selection = "b" }
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)
                }

                HStack(spacing: 5) {
                    NavigationLink(destination : MapView(veri: "11"), tag : "c", selection: $selection){
                        EmptyView()
                    }
                    Button("MÜHENDISLIK FAKÜLTESI A BLOK"){ self.selection = "c"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)


                    NavigationLink(destination : MapView(veri: "10"), tag : "d", selection: $selection){
                        EmptyView()
                    }
                    Button("MÜHENDISLIK FAKÜLTESI B BLOK"){ self.selection = "d"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)
                }

                HStack(spacing: 5) {
                    NavigationLink(destination : MapView(veri: "15"), tag : "e", selection: $selection){
                        EmptyView()
                    }
                    Button("FEN EDEBIYAT FAKÜLTESI A BLOK"){ self.selection = "e"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)


                    NavigationLink(destination : MapView(veri: "19"), tag : "f", selection: $selection){
                        EmptyView()
                    }
                    Button("FEN EDEBIYAT FAKÜLTESI B BLOK"){ self.selection = "f"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)

                }

                HStack(spacing: 5) {
                    NavigationLink(destination : MapView(veri: "7"), tag : "g", selection: $selection){
                        EmptyView()
                    }
                    Button("IKTISADI VE IDARI BILIMLER FAKÜLTESI"){ self.selection = "g"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)



                    NavigationLink(destination : MapView(veri: "20"), tag : "h", selection: $selection){
                        EmptyView()
                    }
                    Button("HUKUK FAKÜLTESI"){ self.selection = "h"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)
                }

                HStack(spacing: 5) {
                    NavigationLink(destination : MapView(veri: "36"), tag : "i", selection: $selection){
                        EmptyView()
                    }
                    Button("ILAHIYAT FAKÜLTESI"){ self.selection = "i"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)


                    NavigationLink(destination : MapView(veri: "16"), tag : "j", selection: $selection){
                        EmptyView()
                    }
                    Button("TEKNOLOJI FAKÜLTESI"){ self.selection = "j"}
                        .buttonStyle(PrimaryButtonStyle())
                        .multilineTextAlignment(.center)
                }
            }
            }
            .padding(.top, -10)
        }
    }

    


struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}

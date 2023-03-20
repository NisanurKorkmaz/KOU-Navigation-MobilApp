//
//  SearchingPageView.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 05/10/2022.
//

import SwiftUI

struct SearchingPageView: View {
    var Locations: [Model] = load("locations.json")
    var body: some View {
        NavigationView{
            List{
            ForEach(Locations, id: \.self){veri in
                NavigationLink(destination : MapView(veri : veri.Id )){
                    VStack(alignment: .leading){
                        Text(veri.Name)
                            .bold()
                    }
                }.padding()
                .foregroundColor(.white)
                .background(Color.green.cornerRadius(10))
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            }
            .padding(6)
        }
    }
        .padding(.top, -100)

    }
}

struct SearchingPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPageView()
    }
}

//
//  SideBar.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 30/09/2022.
//

import Foundation

struct Item : Identifiable {
    var id = UUID()
    var text : String
    var imageName : String
    var url : URL

}
struct LinkList {
    static let MenuItem = [
        Item(text: "Website", imageName: "chrome", url: URL(string: "https://www.kocaeli.edu.tr")!),
        Item(text: "Facebook", imageName: "facebook", url: URL(string: "https://tr-tr.facebook.com/kou92official/")!),
        Item(text: "Instagram", imageName: "instagram", url: URL(string: "https://www.instagram.com/kou92official/")!),
        Item(text: "Twitter", imageName: "twitter", url: URL(string: "https://twitter.com/kou92official")!),
        Item(text: "Youtube", imageName: "youtube", url: URL(string: "https://www.youtube.com/watch?v=li9VPRkEk4Y")!)
        ]
}

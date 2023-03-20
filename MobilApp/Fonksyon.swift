//
//  Fonksyon.swift
//  MobilApp
//
//  Created by Nisanur Korkmaz on 26/08/2022.
//

import Foundation

//var Locations : [Model] = ayristirma(dosyaAdi: "locations", dosyaUzantisi: "json")
//
//func ayristirma(dosyaAdi: String, dosyaUzantisi: String) ->[Model]{
//    guard let dosyaYolu = Bundle.main.url(forResource: dosyaAdi, withExtension: dosyaUzantisi)else{
//        fatalError("dosya yolu bulunamadi")
//    }
//
//    guard let data = try?Data (contentsOf: dosyaYolu)else{
//        fatalError("veri alinamadi ")
//    }
//
//    let decoder = JSONDecoder()
//
//    guard let decodeEdilmisData = try? decoder.decode([Model].self, from: data)else{
//        fatalError("veri ayristirilamadi")
//    }
//
//    return decodeEdilmisData
//}

import Foundation

var Locations: [Model] = load("locations.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


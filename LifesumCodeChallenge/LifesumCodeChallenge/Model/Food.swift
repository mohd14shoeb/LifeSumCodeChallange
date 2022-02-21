//
//  Food.swift
//  LifesumCodeChallenge
//
//  Created by Mohammed1 Shoeb on 21/02/22.
//

import Foundation

struct FoodAPIResponse : Codable {
    let meta : Meta?
    let response : Food?

    enum CodingKeys: String, CodingKey {

        case meta = "meta"
        case response = "response"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
//        response = try values.decodeIfPresent(Response.self, forKey: .response)
//    }

}
struct Meta : Codable {
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case code = "code"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        code = try values.decodeIfPresent(Int.self, forKey: .code)
//    }

}
struct Food : Codable {
    let title : String?
    let calories : Int?
    let carbs : Double?
    let protein : Double?
    let fat : Double?
    let saturatedfat : Double?
    let unsaturatedfat : Double?
    let fiber : Double?
    let cholesterol : Double?
    let sugar : Double?
    let sodium : Double?
    let potassium : Double?
    let gramsperserving : Double?
    let pcstext : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case calories = "calories"
        case carbs = "carbs"
        case protein = "protein"
        case fat = "fat"
        case saturatedfat = "saturatedfat"
        case unsaturatedfat = "unsaturatedfat"
        case fiber = "fiber"
        case cholesterol = "cholesterol"
        case sugar = "sugar"
        case sodium = "sodium"
        case potassium = "potassium"
        case gramsperserving = "gramsperserving"
        case pcstext = "pcstext"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        calories = try values.decodeIfPresent(Int.self, forKey: .calories)
//        carbs = try values.decodeIfPresent(Double.self, forKey: .carbs)
//        protein = try values.decodeIfPresent(Double.self, forKey: .protein)
//        fat = try values.decodeIfPresent(Double.self, forKey: .fat)
//        saturatedfat = try values.decodeIfPresent(Double.self, forKey: .saturatedfat)
//        unsaturatedfat = try values.decodeIfPresent(Double.self, forKey: .unsaturatedfat)
//        fiber = try values.decodeIfPresent(Double.self, forKey: .fiber)
//        cholesterol = try values.decodeIfPresent(Double.self, forKey: .cholesterol)
//        sugar = try values.decodeIfPresent(Double.self, forKey: .sugar)
//        sodium = try values.decodeIfPresent(Double.self, forKey: .sodium)
//        potassium = try values.decodeIfPresent(Double.self, forKey: .potassium)
//        gramsperserving = try values.decodeIfPresent(Double.self, forKey: .gramsperserving)
//        pcstext = try values.decodeIfPresent(String.self, forKey: .pcstext)
//    }

}

//
//  CatDataModel.swift
//  CatBreeedsApp
//
//  Created by MacBook Pro on 10/05/23.
//

import Foundation

struct Cat: Codable {
    let id: String
    let name: String
    let temperament: String?
    let origin: String?
    let description: String?
    let lifeSpan: String?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let grooming: Int?
    let intelligence: Int?
    let healthIssues: Int?
    let socialNeeds: Int?
    let strangerFriendly: Int?
    let referenceImageId: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, temperament, origin, description, lifeSpan, adaptability, affectionLevel, childFriendly, grooming, intelligence, healthIssues, socialNeeds, strangerFriendly
        case referenceImageId = "reference_image_id"
    }
}

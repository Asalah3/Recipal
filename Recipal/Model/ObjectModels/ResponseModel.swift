//
//  ResponseModel.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 02/01/2022.
//

import Foundation

struct Meal: Codable {
    let country: String?
    let numServings: Int?
    let seoTitle: String?
    let totalTimeMinutes, updatedAt: Int?
    let description, seoPath, servingsNounPlural, slug: String?
    let isOneTop: Bool?
    let canonicalID: String?
    let aspectRatio: String?
    let createdAt: Int?
    let draftStatus: String?
    let instructions: [Instruction]?
    let nutritionVisibility: String?
    let id: Int?
    let isShoppable: Bool?
    let servingsNounSingular, thumbnailAltText: String?
    let prepTimeMinutes, videoID: Int?
    let videoURL: String?
    let sections: [Section]?
    let originalVideoURL: String?
    let language, name: String?
    let thumbnailURL: String?
    
    enum CodingKeys: String, CodingKey {
        case country
        case numServings = "num_servings"
        case seoTitle = "seo_title"
        case totalTimeMinutes = "total_time_minutes"
        case updatedAt = "updated_at"
        case description
        case seoPath = "seo_path"
        case servingsNounPlural = "servings_noun_plural"
        case slug
        case isOneTop = "is_one_top"
        case canonicalID = "canonical_id"
        case aspectRatio = "aspect_ratio"
        case createdAt = "created_at"
        case draftStatus = "draft_status"
        case instructions
        case nutritionVisibility = "nutrition_visibility"
        case id
        case isShoppable = "is_shoppable"
        case servingsNounSingular = "servings_noun_singular"
        case thumbnailAltText = "thumbnail_alt_text"
        case prepTimeMinutes = "prep_time_minutes"
        case videoID = "video_id"
        case videoURL = "video_url"
        case sections
        case originalVideoURL = "original_video_url"
        case language, name
        case thumbnailURL = "thumbnail_url"
    }
}
    
    // MARK: - Instruction
    struct Instruction: Codable , Identifiable{
        let endTime: Int?
        let id: Int?
        let displayText: String?
        let position, startTime: Int?
        
        enum CodingKeys: String, CodingKey {
            case endTime = "end_time"
            case id
            case displayText = "display_text"
            case position
            case startTime = "start_time"
        }
    }
    
    
    // MARK: - Section
    struct Section: Codable, Identifiable{
        let components: [Component]?
        let name: String?
        let id: Int?
        enum CodingKeys: String, CodingKey {
            case id = "position"
            case name, components
            
        }
    }
    
    // MARK: - Component
    struct Component: Codable , Identifiable{
        let rawText, extraComment: String?
        let position: Int?
        let measurements: [Measurement]?
        let ingredient: Ingredient?
        let id: Int?
        
        enum CodingKeys: String, CodingKey {
            case rawText = "raw_text"
            case extraComment = "extra_comment"
            case position, measurements, ingredient, id
        }
    }
    
    // MARK: - Ingredient
    struct Ingredient: Codable {
        let updatedAt, id: Int?
        let name, displaySingular, displayPlural: String?
        let createdAt: Int?
        
        enum CodingKeys: String, CodingKey {
            case updatedAt = "updated_at"
            case id, name
            case displaySingular = "display_singular"
            case displayPlural = "display_plural"
            case createdAt = "created_at"
        }
    }
    
    // MARK: - Measurement
    struct Measurement: Codable {
        let id: Int
        let quantity: String
        let unit: Unit
    }
    
    // MARK: - Unit
    struct Unit: Codable {
        let name, abbreviation, displaySingular, displayPlural: String
        let system: System
        
        enum CodingKeys: String, CodingKey {
            case name, abbreviation
            case displaySingular = "display_singular"
            case displayPlural = "display_plural"
            case system
        }
    }
    
    enum System: String, Codable {
        case imperial = "imperial"
        case metric = "metric"
        case none = "none"
    }
    struct Categories:Decodable {
        let count: Int?
        let results: [Result]?
    }
    
    // MARK: - Result
    struct Result :Decodable, Identifiable{
        let videoID: Int?
        let name: String?
        let originalVideoURL: String?
        let numServings: Int?
        let keywords: String?
        let showID: Int?
        let canonicalID: String?
        let inspiredByURL: String?
        let seoTitle: String?
        let isShoppable: Bool?
        let thumbnail_url: String?
        let videoURL: String?
        let updatedAt: Int?
        let yields: String?
        let isOneTop: Bool?
        let id: Int?
        let approvedAt: Int?
        let totalTimeMinutes: Int?
        let slug: String?
        let createdAt: Int?
        let description: String?
        let recipes: [Recipe]?
    }
    
    
    
    
    // MARK: - Recipe
    struct Recipe :Decodable{
        
        let prepTimeMinutes: Int?
        let numServings: Int?
        let thumbnailURL: String?
        let totalTimeMinutes: Int?
        let videoURL: String?
        let servingsNounPlural: String?
        let createdAt, approvedAt: Int?
        let beautyURL: String?
        let recipeID, id: Int?
        let isOneTop: Bool?
        let seoTitle: String?
        let yields: String?
        let tipsAndRatingsEnabled: Bool?
        let canonicalID: String?
        let videoID: Int?
        let slug: String?
        let showID: Int?
        let keywords: String?
        let isShoppable: Bool?
        let thumbnailAltText: String?
        let originalVideoURL: String?
        let name: String?
        let buzzID: Int?
        let inspiredByURL: String?
        let cookTimeMinutes: Int?
        let description: String?
        let servingsNounSingular: String?
    }
    
    struct SimilaritiesRecipe:Decodable {
        let count: Int?
        let results: [SimilaritiesRecipeResult]?
    }
    
    // MARK: - Result
    struct SimilaritiesRecipeResult :Decodable, Identifiable{
        let videoID: Int?
        let name: String?
        let originalVideoURL: String?
        let numServings: Int?
        let thumbnailURL: String?
        let videoURL: String?
        let id: Int?
        let slug : String?
        let description: String?
        enum CodingKeys: String, CodingKey {
            case numServings = "num_servings"
            case videoID = "video_id"
            case id
            case name
            case slug
            case description
            case thumbnailURL = "thumbnail_url"
            case videoURL = "video_url"
            case originalVideoURL = "original_video_url"
        }
    }
    


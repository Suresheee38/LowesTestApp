//
//  Movie.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/12/22.
//

import Foundation

/// MARK: - Movie
struct Movie: Codable {
    let page: Int
    let results: [MovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

/// MARK: - Result
struct MovieResult: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MovieAppRequestModels { }

extension MovieAppRequestModels {
    struct FetchMovie: Codable {
        private let apiKey: String
        private let keyword: String
        private let language: String
        private let page: Int
        private let includeAdult: String
        private let region: String?
        private let year: Int?
        private let primaryReleaseYear: String?
        
        enum CodingKeys: String, CodingKey {
            case apiKey = "api_key"
            case keyword = "query"
            case language = "language"
            case page = "page"
            case includeAdult = "include_adult"
            case region = "region"
            case year = "year"
            case primaryReleaseYear = "primary_release_year"
        }
        
        init(
            apiKey: String,
            keyword: String,
            language: String = "en-US",
            page: Int = 1,
            includeAdult: String = "false",
            region: String? = nil,
            year: Int? = nil,
            primaryReleaseYear: String? = nil
        ) {
            self.apiKey = apiKey
            self.keyword = keyword
            self.language = language
            self.page = page
            self.includeAdult = includeAdult
            self.region = region
            self.year = year
            self.primaryReleaseYear = primaryReleaseYear
        }
    }
    
    struct FetchConfig: Codable {
        private let apiKey: String
        
        enum CodingKeys: String, CodingKey {
            case apiKey = "api_key"
        }
        
        init(
            apiKey: String
        ) {
            self.apiKey = apiKey
        }
    }
}

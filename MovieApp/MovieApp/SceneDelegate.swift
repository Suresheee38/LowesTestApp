//
//  SceneDelegate.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var launchable: Launchable?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        launchable = LaunchInitialView(window: window)
        launchable?.launch()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let page: Int
//    let results: [Result]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case page, results
//        case totalPages
//        case totalResults
//    }
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage, originalTitle, overview: String
//    let popularity: Double
//    let posterPath, releaseDate, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath
//        case genreIDS
//        case id
//        case originalLanguage
//        case originalTitle
//        case overview, popularity
//        case posterPath
//        case releaseDate
//        case title, video
//        case voteAverage
//        case voteCount
//    }
//}
//{"page":1,"results":[{"adult":false,"backdrop_path":"/23P48poch9QvMbQNE1wPU9qhPjE.jpg","genre_ids":[35,878],"id":996129,"original_language":"es","original_title":"Starwars: Goretech","overview":"Star Wars Goretech is the magnanimous project of businessman Max Higgins, who managed to carry out the filming of that script, with all the sex, violence, apologies for drugs and prostitution that George Lucas always wanted to film but never got around to.","popularity":0.881,"poster_path":"/PGMenctbDw5tczg9sJ0QxDKQ1s.jpg","release_date":"2018-12-07","title":"Starwars: Goretech","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":"/aJCtkxLLzkk1pECehVjKHA2lBgw.jpg","genre_ids":[12,28,878],"id":1891,"original_language":"en","original_title":"The Empire Strikes Back","overview":"The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.","popularity":26.879,"poster_path":"/2l05cFWJacyIsTpsqSgH0wQXe4V.jpg","release_date":"1980-05-20","title":"The Empire Strikes Back","video":false,"vote_average":8.4,"vote_count":14434}],"total_pages":1,"total_results":2}

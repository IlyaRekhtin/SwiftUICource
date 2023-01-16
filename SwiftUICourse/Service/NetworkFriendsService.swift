//
//  NetworkFriendsService.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 13.01.2023.
//

import Foundation
import PromiseKit

final class FriendNetworkService {
    private let token = UserDefaults.standard.string(forKey: "vkToken")
    private let id = UserDefaults.standard.string(forKey: "userID")
    
    
    enum AppError: String, Error {
        case urlError = "url not found"
        case decodeError = "don't decode"
        case fetchError = "don't fetch"
    }
    
    func getURL() -> Promise<URL> {
        
        let params = ["user_id":id ?? "111",
                      "fields": "city, photo_50",
                      "access_token": token ?? "111",
                      "v": Api.shared.apiVersion
        ]
        return Promise { resolver in
            guard let url = URL.configureURL(method: .friendsGet, baseURL: .api, params: params) else {
                resolver.reject(AppError.urlError)
                return
            }
            resolver.fulfill(url)
        }
    }
    
   func fetchData(_ url: URL) -> Promise<Data> {
        return Promise { resolver in
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else {
                    resolver.reject(AppError.fetchError)
                    return
                }
                resolver.fulfill(data)
            }.resume()
        }
    }
    
    func parsedData(_ data: Data) -> Promise<[Friend]> {
        return Promise { resolver in
            do {
                let items = try JSONDecoder().decode(FriendsResponse.self, from: data).friends.items
                resolver.fulfill(items)
            }catch{
                resolver.reject(AppError.decodeError)
            }
        }
    }
}

extension URL {
    static func configureURL(method: Api.BaseURL.ApiMethod,
                             baseURL: Api.BaseURL,
                             params: [String: String]) -> URL? {
        var queryItems: [URLQueryItem] = []

        params.forEach { param, value in
            queryItems.append(URLQueryItem(name: param, value: value))
        }

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = baseURL.rawValue
        urlComponents.path = method.rawValue
        urlComponents.queryItems = queryItems

        let url = urlComponents.url
        return url
    }
    
}

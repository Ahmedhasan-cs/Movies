//
//  NetworkManager.swift
//  Movies
//
//  Created by Ahmed Aly on 09/07/2023.
//


import Foundation

protocol APIService {
    func executeQuery<T>(service :Services, data: [String:Any]?, method: APIMethod,  completion: @escaping (Result<T, Error>) -> Void) where T: Codable
}

enum Services {
    case moviesList
    case movie(Int)
    
    var api: String {
        switch self {
        case .moviesList:
            return "discover/movie"
        case .movie(let movieID):
            return "movie/\(movieID)"
        }
    }
}

enum APIMethod: String {
    case GET = "GET"
    case POST = "POST"
}

let API_KEY = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNGRkNzI3ZDI3OWRhOTJhMDdlMTdkMDI4OTRkZmUxOSIsInN1YiI6IjY0YWFkMWZiZDFhODkzMDBhZGJmODc2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iWSaTqmQiQwDrtEmhHWpugBkpttVytPPBLXEWsKrb3s"
let baseUrl :String! = "https://api.themoviedb.org/3/"

class NetworkManager: APIService {
    func executeQuery<T>(service :Services, data: [String:Any]?, method: APIMethod, completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer \(API_KEY)"
        ]
        
        let url = baseUrl + service.api

        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
             print(error as Any)
              completion(.failure(error!))
          } else {
              if (data != nil) {
                  do {
                      let str = String(decoding: data!, as: UTF8.self)
                      print(str)
                      completion(.success(try JSONDecoder().decode(T.self, from: data!)))
                  } catch let error {
                      print(String(data: data!, encoding: .utf8) ?? "nothing received")
                      completion(.failure(error))
                  }
              }
          }
        })

        dataTask.resume()
    }
}

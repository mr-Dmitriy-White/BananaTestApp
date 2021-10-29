//
//  NetworkService.swift
//  BananaFinderTestProgect
//
//  Created by Dima Biliy on 29.10.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getBananaWiki(completion: @escaping (Result<Int?, Error>) -> Void)
}

class NetworkService : NetworkServiceProtocol {
    func getBananaWiki(completion: @escaping (Result<Int?, Error>) -> Void) {
        let urlString = "https://en.wikipedia.org/wiki/Banana"
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }

            if let data = data {
                let str = String(decoding: data, as: UTF8.self)
                let bananasCount = self.matches(for: #"[^\/:\-_\\>#"=A-Za-z0-9+](B|b)anana"#, in: str)
                completion(.success(bananasCount))
            }
        }.resume()
    }
    
    func matches(for regex: String, in text: String) -> Int{
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.count
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return 0
        }
    }
}

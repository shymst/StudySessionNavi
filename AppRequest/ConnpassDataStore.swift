//
//  ConnpassDataStore.swift
//  AppRequest
//
//  Created by Shunya Yamashita on 2018/05/13.
//

import Moya

protocol ConnpassDataStore {
    func search(keyword: String, completion: @escaping (ConnpassResult) -> ())
}

struct ConnpassDataStoreImpl: ConnpassDataStore {
    func search(keyword: String, completion: @escaping (ConnpassResult) -> ()) {
        let provider = MoyaProvider<ConnpassAPI>()
        provider.request(.search(keyword: keyword)) { result in
            switch result {
            case .success(let response):
                do {
                    let connpassResult = try JSONDecoder().decode(ConnpassResult.self, from: response.data)
                    completion(connpassResult)
                } catch let error {
                    print("ERROR: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

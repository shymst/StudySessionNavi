//
//  ConnpassAPI.swift
//  AppRequest
//
//  Created by Shunya Yamashita on 2018/05/13.
//

import Moya

enum ConnpassAPI {
    case search(keyword: String)
}

extension ConnpassAPI: TargetType {
    var baseURL: URL { return URL(string: "https://connpass.com/api/v1")! }

    var path: String {
        switch self {
        case .search(let keyword):
            if keyword.isEmpty {
                return "/event/"
            }
            return "/event/?keyword=\(keyword)"
        }
    }

    var method: Moya.Method { return .get }
    var task: Task { return .requestPlain }
    var headers: [String : String]? { return ["Content-type": "application/json"] }

    var sampleData: Data {
        let path = Bundle.main.path(forResource: "sampleSearch", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

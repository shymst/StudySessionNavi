//
//  Session.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/19.
//

import Foundation

struct Session {
    let eventId: Int
    let title: String
    let `catch`: String
    let description: String
    let eventUrl: String
    let hashTag: String
    let startedAt: String
    let endedAt: String
    let limit: Int?
    let eventType: EventType
    let series: ConnpassSeries?
    let address: String?
    let place: String?
    let lat: String?
    let lon: String?
    let ownerId: Int
    let ownerNickname: String
    let ownerDisplayName: String
    let accepted: Int
    let waiting: Int
    let updatedAt: String

    enum EventType: String {
        case participation
        case advertisement
    }

    struct ConnpassSeries {
        let id: Int
        let title: String
        let url: String
    }
}

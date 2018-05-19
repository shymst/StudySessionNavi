//
//  ConnpassResult.swift
//  AppRequest
//
//  Created by Shunya Yamashita on 2018/05/13.
//

import Foundation

struct ConnpassResult: Codable {
    let resultsReturned: Int
    let resultsAvailable: Int
    let resultsStart: Int
    let events: [ConnpassEvent]

    private enum CodingKeys: String, CodingKey {
        case resultsReturned = "results_returned"
        case resultsAvailable  = "results_available"
        case resultsStart = "results_start"
        case events
    }

    struct ConnpassEvent: Codable {
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

        enum EventType: String, Codable {
            case participation = "participation"
            case advertisement = "advertisement"
        }

        struct ConnpassSeries: Codable {
            let id: Int
            let title: String
            let url: String
        }

        private enum CodingKeys: String, CodingKey {
            case eventId = "event_id"
            case title
            case `catch`
            case description
            case eventUrl = "event_url"
            case hashTag = "hash_tag"
            case startedAt = "started_at"
            case endedAt = "ended_at"
            case limit
            case eventType = "event_type"
            case series
            case address
            case place
            case lat
            case lon
            case ownerId = "owner_id"
            case ownerNickname = "owner_nickname"
            case ownerDisplayName = "owner_display_name"
            case accepted
            case waiting
            case updatedAt = "updated_at"
        }
    }
}

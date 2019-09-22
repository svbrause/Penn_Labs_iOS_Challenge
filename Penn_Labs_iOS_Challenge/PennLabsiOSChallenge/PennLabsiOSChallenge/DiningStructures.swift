//
//  DiningVenue.swift
//  PennLabsiOSChallenge
//
//  Created by Sam Brause on 9/20/19.
//  Copyright © 2019 Sam Brause. All rights reserved.
//
import UIKit
import Foundation

struct DiningDocument: Decodable {
    var document: DiningVenues
}
struct DiningVenues: Decodable {
    var venue: [Venue]
}
struct Venue: Decodable {
    var dailyMenuURL: String
    var dateHours: [DateHours]
    var facilityURL: String
    var id: Int
    var imageUrl: String?
    var name: String
    var venueType: String
    var weeklyMenuURL: String
}
struct DateHours: Decodable {
    var date: String
    var meal: [MealHours]
}
struct MealHours: Decodable {
    var close: String
    var open: String
    var type: String
}

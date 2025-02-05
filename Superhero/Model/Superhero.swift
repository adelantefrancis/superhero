//
//  Superhero.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

typealias Superheroes = [Superhero]

class Superhero: Codable {
    var Fullname: String
    var Alias: String
    var ProfilePicture: String
    var Qoute: String
    var Mobile: String
    var Email: String
}

struct GenericCodable<T: Codable>:Codable {
    var data: T
}

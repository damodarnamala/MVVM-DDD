//
//  User.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public struct User {
    public let id: String
    public let username: String
    public let password: String
    var roles: [Role]?
    public init(id: String, username: String, password: String, roles: [Role]? = nil) {
        self.id = id
        self.username = username
        self.password = password
        self.roles = roles
    }
}

public struct Role {
    public let id: String
    public let name: String
    public let permissions: [String]
    public init(id: String, name: String, permissions: [String]) {
        self.id = id
        self.name = name
        self.permissions = permissions
    }
}

public struct AuthenticationToken {
    let token: String
    let expirationDate: Date
    public init(token: String, expirationDate: Date) {
        self.token = token
        self.expirationDate = expirationDate
    }
}

//
//  IdentityRepository.swift
//  Core
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public protocol IdentityRepository {
    func authenticateUser(username: String, password: String) -> AuthenticationToken?
    func getUserRoles(for userId: String) -> [Role]
    func createUser(username: String, password: String) -> User
    func assignUserRole(_ role: Role, to user: User)
}

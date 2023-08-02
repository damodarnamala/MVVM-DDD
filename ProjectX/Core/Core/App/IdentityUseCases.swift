//
//  IdentityUseCases.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

public protocol IdentityUseCases {
    func authenticateUser(username: String, password: String) -> AuthenticationToken?
    func getUserRoles(for userId: String) -> [Role]
    func createUser(username: String, password: String) -> User
    func assignUserRole(_ role: Role, to user: User)
}
public class IdentityInteractor: IdentityUseCases {
    private let identityRepository: IdentityRepository
    
    public init(identityRepository: IdentityRepository) {
        self.identityRepository = identityRepository
    }
    
    public func authenticateUser(username: String, password: String) -> AuthenticationToken? {
        return identityRepository.authenticateUser(username: username, password: password)
    }
    
    public func getUserRoles(for userId: String) -> [Role] {
        return identityRepository.getUserRoles(for: userId)
    }
    
    public func createUser(username: String, password: String) -> User {
        return identityRepository.createUser(username: username, password: password)
    }
    
    public func assignUserRole(_ role: Role, to user: User) {
        identityRepository.assignUserRole(role, to: user)
    }
}

public class IdentityDataRepository: IdentityRepository {
    private var users: [User] = []
    
    private var authenticationTokens: [String: AuthenticationToken] = [:]
 
    public init() { }
    public func authenticateUser(username: String, password: String) -> AuthenticationToken? {
        // Implementation to authenticate user and generate authentication token.
        // For simplicity, we'll use an in-memory dictionary to store authentication tokens.
        // In a real-world app, you would use a secure authentication mechanism.
        return authenticationTokens[username]
    }
    
    public func getUserRoles(for userId: String) -> [Role] {
        // Implementation to fetch user roles from data storage.
        // For simplicity, we'll use an in-memory array of users and roles.
        return users.first(where: { $0.id == userId }).flatMap { $0.roles } ?? []
    }
    
    public func createUser(username: String, password: String) -> User {
        // Implementation to create a new user and store it in the data storage.
        // For simplicity, we'll use an in-memory array of users.
        let user = User(id: UUID().uuidString, username: username, password: password)
        users.append(user)
        return user
    }
    
    public func assignUserRole(_ role: Role, to user: User) {
        // Implementation to assign a role to a user and store it in the data storage.
        // For simplicity, we'll add roles to the User entity directly.
        if var existingUser = users.first(where: { $0.id == user.id }) {
            existingUser.roles?.append(role)
            if let index = users.firstIndex(where: { $0.id == user.id }) {
                users[index] = existingUser
            }
        }
    }
}

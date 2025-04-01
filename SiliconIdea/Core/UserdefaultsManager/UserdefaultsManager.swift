//
//  UserdefaultsManager.swift
//  SiliconIdea
//
//  Created by Егорио on 30.03.2025.
//

import Foundation

class UserdefaultsManager {
    
    static let shared = UserdefaultsManager()
    
    private enum Keys {
        static let username = "user_username"
        static let isLoggedIn = "user_is_logged_in"
        static let userId = "user_id"
        static let userPreferences = "user_preferences"
        static let appTheme = "app_theme"
        static let lastOpenedDate = "last_opened_date"
    }
    
    private let defaults = UserDefaults.standard
    
    init() {}
    
    // MARK: - Username Methods
    
    func saveUsername(_ username: String) {
        defaults.set(username, forKey: Keys.username)
    }
    
    func removeUsername() {
        defaults.removeObject(forKey: Keys.username)
    }
    
    func getUsername() -> String? {
        return defaults.string(forKey: Keys.username)
    }
    
    // MARK: - Login State Methods
    
    func setLoggedIn(_ isLoggedIn: Bool) {
        defaults.set(isLoggedIn, forKey: Keys.isLoggedIn)
    }
    
    func isUserLoggedIn() -> Bool {
        return defaults.bool(forKey: Keys.isLoggedIn)
    }
    
    // MARK: - User ID Methods
    
    func saveUserId(_ id: String) {
        defaults.set(id, forKey: Keys.userId)
    }
    
    func getUserId() -> String? {
        return defaults.string(forKey: Keys.userId)
    }
    
    func removeUserId() {
        defaults.removeObject(forKey: Keys.userId)
    }
    
    // MARK: - User Preferences Methods
    
    func saveUserPreferences(_ preferences: [String: Any]) {
        defaults.set(preferences, forKey: Keys.userPreferences)
    }
    
    func getUserPreferences() -> [String: Any]? {
        return defaults.dictionary(forKey: Keys.userPreferences)
    }
    
    // MARK: - App Theme Methods
    
    func saveAppTheme(_ theme: String) {
        defaults.set(theme, forKey: Keys.appTheme)
    }
    
    func getAppTheme() -> String? {
        return defaults.string(forKey: Keys.appTheme)
    }
    
    // MARK: - App Usage Methods
    
    func updateLastOpenedDate() {
        defaults.set(Date(), forKey: Keys.lastOpenedDate)
    }
    
    func getLastOpenedDate() -> Date? {
        return defaults.object(forKey: Keys.lastOpenedDate) as? Date
    }
    
    // MARK: - Clear All Data
    
    func clearAllUserData() {
        removeUsername()
        removeUserId()
        setLoggedIn(false)
        defaults.removeObject(forKey: Keys.userPreferences)
        defaults.removeObject(forKey: Keys.lastOpenedDate)
        // Keep app theme as it's a user preference not related to account
    }
}

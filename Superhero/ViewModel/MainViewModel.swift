//
//  MainViewModel.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

class MainViewModel: NSObject {

    let userDefaults = UserDefaults.standard
    
    func fetchPlistHeroes(name: String) -> Superheroes?{
        if let fileUrl = Bundle.main.url(forResource: name, withExtension: "json"),
           let data = try? Data(contentsOf: fileUrl) {
            guard let heroes = self.genericDecoder(type: Superheroes.self, from: data) else {
                return nil
            }
            return heroes
        }
        return nil
    }
    
    func fetchPlistMissions(name: String) -> Missions?{
        if let fileUrl = Bundle.main.url(forResource: name, withExtension: "json"),
           let data = try? Data(contentsOf: fileUrl) {
            guard let missions = self.genericDecoder(type: Missions.self, from: data) else {
                return nil
            }
            return missions
        }
        return nil
    }
    
    func genericDecoder<T: Decodable>(type: T.Type, from: Data) -> T? {
        do {
            return try JSONDecoder().decode(type.self, from: from)
        } catch {
            print("Failed to decode with error: \(error)")
            return nil
        }
    }
    
    func saveToUserDefaults<Value>(model: Value, key: UserDefaultsKey) where Value : Encodable{
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(model) {
            userDefaults.set(encoded, forKey: key.rawValue)
            userDefaults.synchronize()
        }
    }
   
    func saveToUserDefaults<T>(toSave: T, key: UserDefaultsKey){
        userDefaults.set(toSave, forKey: key.rawValue)
        userDefaults.synchronize()
    }
   
    func fetchFromUserDefaults<T>(key: UserDefaultsKey) -> T? {
        if let obj = userDefaults.object(forKey: key.rawValue) {
            return obj as? T
        }
        return nil
    }
    
    func fetchFromUserDefaults(key: UserDefaultsKey) -> Data? {
        if let obj = userDefaults.object(forKey: key.rawValue) as? Data {
            return obj
        }
        return nil
    }
    
    func fetchHeroInSession() -> Superhero? {
        if let userData = fetchFromUserDefaults(key: .heroInSession){
            let decoder = JSONDecoder()
            if let hero = try? decoder.decode(Superhero.self, from: userData) {
                   return hero
            }
            return nil
        }
        return nil
    }
    
    
    func logout(){
        let loginResponseKey = UserDefaultsKey.heroInSession
        self.userDefaults.removeObject(forKey: loginResponseKey.rawValue)
        self.userDefaults.synchronize()
    }
}

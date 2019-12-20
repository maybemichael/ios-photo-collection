//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Michael on 12/19/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit


class ThemeHelper {
    
    let themePreferenceKey: String = "themePreferenceKey"
    
    func setThemePreferenceToDark() {
        
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
        
    }
    
    func setThemePreferenceToYourColorHere() {
        
        
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
        
    }
    
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        let chosenTheme = userDefaults.string(forKey: themePreferenceKey)
        return chosenTheme
        
    }
    

    
    init() {
        guard themePreference == nil else { return }
            setThemePreferenceToDark()
    }
}

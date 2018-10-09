//
//  Camera.swift
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import Foundation

class Camera: NSObject {
    
    init(id: Int, name: String, roverId: Int, fullName: String) {
        self.id = id
        self.name = name
        self.roverId = roverId
        self.fullName = fullName
    }
    
    let id: Int
    let name: String
    let roverId: Int
    let fullName: String
}

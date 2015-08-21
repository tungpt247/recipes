//
//  Recipe.swift
//  Recipes
//
//  Created by tungphan on 8/19/15.
//  Copyright (c) 2015 tp. All rights reserved.
//

import Foundation
import RealmSwift

class Recipe: BaseModel {
  
  dynamic var name = ""

  convenience init(name: String) {
    self.init()
    self.name = name
  }
  
}
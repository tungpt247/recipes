//
//  BaseModel.swift
//  Recipes
//
//  Created by tungphan on 8/19/15.
//  Copyright (c) 2015 tp. All rights reserved.
//

import Foundation
import RealmSwift

class BaseModel: Object {

  dynamic var id = NSUUID().UUIDString
  dynamic var createdAt = NSDate()

  override class func primaryKey() -> String? {
    return "id"
  }
}

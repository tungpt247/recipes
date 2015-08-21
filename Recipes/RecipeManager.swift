//
//  RecipeManager.swift
//  Recipes
//
//  Created by tungphan on 8/19/15.
//  Copyright (c) 2015 tp. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import ReactiveCocoa

class RecipeManager: NSObject {
  var createRecipeCommand: RACCommand!
  var deleteRecipeCommand: RACCommand!
  
  let realm = Realm()

  override init() {
    super.init()

    createRecipeCommand = RACCommand(signalBlock: { (recipe: AnyObject!) -> RACSignal! in
      self.createRecipe(recipe as! Recipe)

      return RACSignal.empty()
    })

    deleteRecipeCommand = RACCommand(signalBlock: { (any: AnyObject!) -> RACSignal! in
      self.deleteAllRecipes()

      return RACSignal.empty()
    })
  }

  /**
  Create and save Recipe model to Realm storage

  :param: recipe a Recipe model
  */
  private func createRecipe(recipe: Recipe) {
    realm.write { () -> Void in
      self.realm.add(recipe, update: true)
    }
  }

  /**
  Delete All recipes

  */
  private func deleteAllRecipes() {
    realm.write { () -> Void in
      self.realm.deleteAll()
    }
  }

  /**
  Get list of recipes

  :returns: list all recipes from Realm storage
  */
  func getRecipes() -> Results<Recipe> {
    return realm.objects(Recipe)
  }
}
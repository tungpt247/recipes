//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by tungphan on 8/19/15.
//  Copyright (c) 2015 tp. All rights reserved.
//

import Foundation
import ReactiveCocoa
//import RealmSwift

class RecipeViewModel: NSObject {
  var recipManager: RecipeManager

  var addCommandSignal: RACCommand!
  var deleteCommandSignal: RACCommand!

  // list of recipes
  var recipes: ResultRecipes

  init(recipeManager: RecipeManager) {
    self.recipManager = recipeManager
    self.recipes = recipManager.getRecipes()

    super.init()

    addCommandSignal = RACCommand() {
      Void -> RACSignal in
      let recipe = Recipe(name: NSUUID().UUIDString)
      let createSignal = recipeManager.createRecipeCommand.execute(recipe)
      return createSignal
    }

    deleteCommandSignal = RACCommand() {
      Void -> RACSignal in
      let deleteSignal = recipeManager.deleteRecipeCommand.execute(nil)
      return deleteSignal
    }
  }
}

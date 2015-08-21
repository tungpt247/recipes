//
//  RecipeViewController.swift
//  Recipes
//
//  Created by tungphan on 8/19/15.
//  Copyright (c) 2015 tp. All rights reserved.
//

import UIKit
import ReactiveCocoa

class RecipeViewController: UIViewController {
  let recipeViewModel: RecipeViewModel

  @IBOutlet weak var addRecipeButton: UIButton!
  @IBOutlet weak var recipesTableView: UITableView!
  @IBOutlet weak var removeButton: UIButton!


  init(recipeViewModel: RecipeViewModel) {
    self.recipeViewModel = recipeViewModel
    super.init(nibName: "RecipeViewController", bundle: nil)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func viewDidLoad() {
    super.viewDidLoad()

    // Register RecipeCell
    let nib = UINib(nibName: "RecipeCell", bundle: nil)
    recipesTableView.registerNib(nib, forCellReuseIdentifier: "RecipeCell")

    // bind a button to create a new Recipe
    addRecipeButton.rac_command = recipeViewModel.addCommandSignal

    // execute
    recipeViewModel.addCommandSignal.executing.subscribeNext { (any:AnyObject!) -> Void in
      self.refresh()
    }

    // bin remove button to remove all recipes
    removeButton.rac_command = recipeViewModel.deleteCommandSignal
    recipeViewModel.deleteCommandSignal.executing.subscribeNext { (any: AnyObject!) -> Void in
      self.refresh()
    }

  }

  func refresh() {
    self.recipesTableView.reloadData()

    let numberOfSections = recipesTableView.numberOfSections()
    let numberOfRows = recipesTableView.numberOfRowsInSection(numberOfSections-1)

    if numberOfRows > 0 {
      let indexPath = NSIndexPath(forRow: numberOfRows-1, inSection: (numberOfSections-1))
      recipesTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: UITableViewDataSource

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.recipeViewModel.recipes.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell", forIndexPath: indexPath) as! RecipeCell
    cell.nameLabel.text = self.recipeViewModel.recipes[indexPath.row].name
    return cell
  }


}

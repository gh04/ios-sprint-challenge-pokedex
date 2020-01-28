//
//  PokedexTableViewController.swift
//  PodedexB
//
//  Created by Gerardo Hernandez on 1/26/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {

    // MARK: -  Properties
    
    let pokedexController = PokedexController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return pokedexController.pokemons.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        guard indexPath.row < pokedexController.pokemons.count else {
            return cell }
        let pokeIndex = pokedexController.pokemons[indexPath.row]
        cell.textLabel?.text = pokeIndex.name.capitalized
      
        
        return cell
    }
    
    // MARK: - Delete Pokemon
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pokedexController.delete(pokedexController.pokemons[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PokeDetailSegue" {
            guard let pokedexSearchVC = segue.destination as? PokedexSearchViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard indexPath.row < pokedexController.pokemons.count else { return }
            let pokemon = self.pokedexController.pokemons[indexPath.row]
            pokedexSearchVC.pokedexController = pokedexController
            pokedexSearchVC.pokemon = pokemon
            pokedexSearchVC.navigationItem.title = pokemon.name
        
        } else if segue.identifier == "SearchSegue" {
            guard let pokedexSearchVC = segue.destination as? PokedexSearchViewController else { return }
            pokedexSearchVC.pokedexController = pokedexController
                
                }
                
            }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
   


}

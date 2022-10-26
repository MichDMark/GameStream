//
//  ViewModel.swift
//  GameStream
//
//  Created by Mich DMark on 25/10/22.
//

import Foundation


//
//utilizamos una clase para utilizar la caracteristica de que es por referencia
//de esta manera los objetos instanciados tienen la misma informacion
// muy importante siempre notar que palabras reservadas usan
class ViewModel: ObservableObject
{
    //
    //para la comunicacion entre el modelo y el modelovista
    //esto es un arreglo de la instancia de elementos Game
    @Published var gamesInfo = [Game]()
    
//
//se crea este metodo para que cada que se inicialice la clase
//vaya al servidor y tome los datos que se estan pidiendo
// los almace en gamesInfo
//y como es Published, cualquier vista puede mostrar la info
    init()
    {
        //la url de la api, a la cual se hace la peticion y regresa los gets
        let urlPeticion = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        
        var request = URLRequest(url: urlPeticion)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            do
            {
                //si accedes a los datos haz esto
                if let jsonData = data
                {
                    print("tamano del Json \(jsonData)")
                    
                    //decodifica los datos que recibio jsondata y guardalos en los bloques de Game
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    //manda llamar otro hilo en cpu, para que no se congele el movil
                    //mientras que esta accediendo la info
                    DispatchQueue.main.async
                    {
                        //anade los datos que decodificaste y estan en decodedata
                        //anadelos a gamesInfo
                        //recordar que movimos esto a otro hilo del cpu
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
                
                
            }catch
            {
                //catch si no pudo acceder, que muestre los mensajes de error
                print("Error: \(error)")
            }
        }.resume() //esto significa manda la peticion
    }
}

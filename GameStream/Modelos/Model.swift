//
//  Model.swift
//  GameStream
//
//  Created by Mich DMark on 25/10/22.
//

import Foundation

//
//la estructuras codable permiten codificar y decodificar datos
struct Games:Codable
{
    //
    //aqui estamos diciendo la estructura Games (plural)
    //va a tener dentro un arreglo de varios Game, es decir cada uno de manera individual
    var games:[Game]
}
//
//es una buena practica dejar arreglada la estructura general, aunque utilicemos solo los elementos aislados, como Game y no Games


//
//este game es parte de Games, por eso es codable
//darle nombre a las variables igual al nombre que tienen en el json
struct Game:Codable
{
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:videoUrl
    var galleryImages:[String]
}


struct videoUrl:Codable
{
    var mobile:String
    var tablet:String
}

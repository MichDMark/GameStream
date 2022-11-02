//
//  GamesView.swift
//  GameStream
//
//  Created by Mich DMark on 25/10/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    //
    //con el observedobject accedemos a la informacion de gamesInfo
    // la clase gamesInfo ya tenia este protocolo
    @ObservedObject var todosLosVideojuegos = ViewModel()
    //
    //en la arquitectura MVVM las vistas se comunican con el viewModel
    
    
    //
    //variables para captar la informacion que ya recibimos y esta en la variable todoslosvideojuegos
    
    //
    //esta variable es para controlar cuando te vayas a la vista de games
    @State var gameviewIsActive: Bool = false
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    
    let formaGrid =
    [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View
    {
        //cuando se ejecuta el texto automatica lo que esta en el onappear se va a mostrar
        ZStack
        {
            Color("Marine").ignoresSafeArea()
            
            VStack
            {
                Text("Juegos").font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top:16, leading: 0, bottom: 64, trailing:  0))
                
                ScrollView
                {
                    LazyVGrid(columns: formaGrid, spacing: 8)
                    {
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self)
                        {
                            juego in
                            
                            Button(
                                action:
                                    {
                                        url = juego.videosUrls.mobile
                                        titulo = juego.title
                                        studio = juego.studio
                                        calificacion = juego.contentRaiting
                                        anoPublicacion = juego.publicationYear
                                        descripcion = juego.description
                                        tags = juego.tags
                                        imgsUrl = juego.galleryImages
                                        
                                        print("pulse el juego \(titulo)")
                                    },
                                label:
                                    {
                                        KFImage(URL(string: juego.galleryImages[0])!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                            .padding(.bottom, 12)
                                        
                                    })
                        }
                    }
                }
                
                
                
            }.padding(.horizontal, 6)
            
            
        }.navigationBarHidden(true)
         .navigationBarBackButtonHidden(true)
        
        
         /*
         .onAppear(
                
                perform: {
                    print("primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
                    
                    print("titulo del primer video \(todosLosVideojuegos.gamesInfo[0].title)")
                }
                    
            )
          */
         
         
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}

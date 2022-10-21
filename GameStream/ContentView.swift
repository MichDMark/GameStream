//
//  ContentView.swift
//  GameStream
//
//  Created by Mich DMark on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack
        {
            Spacer()
            Color("Marine").ignoresSafeArea()
            VStack
            {
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                
                InicioSesionYRegistro()
                
            }
        }
    }
}

struct InicioSesionYRegistro: View {
    
    @State var tipoInicioSesion: Bool = true
    var body: some View
    {
        VStack
        {
            HStack
            {
                Spacer()
                Button("INICIA SESIÓN")
                {tipoInicioSesion = true}
                    .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE")
                {tipoInicioSesion = false}
                    .foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true
            {
                InicioSesionView()
            }
            else
            {
                RegistroView()
            }
            
        }
    }
}

struct InicioSesionView: View
{
    @State var correo: String = ""
    @State var password: String = ""
    
    var body: some View
    {
        ScrollView
        {
            
            VStack(alignment: .leading)
            {
                Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading)
                {
                    if correo.isEmpty
                    {
                        Text(verbatim:"ejemplo@gmail.com").font(.caption)
                            .foregroundColor(Color("Light-Gray"))
                    }
                    
                    TextField("", text: $correo)
                    
                    
                }
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Password").foregroundColor(Color("Light-Gray"))
                
                ZStack(alignment: .leading)
                {
                    if password.isEmpty
                    {
                        Text("Escribe tu password").font(.caption)
                            .foregroundColor(Color("Light-Gray"))
                    }
                    
                    SecureField("", text: $password)
                    
                    
                }
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
                Text("Olvidaste tu password??")
                    .font(.footnote).frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom, 70)
                
                Button {IniciarSesion()}
                label:
                {
                    Text("INICIAR SESION").fontWeight(.bold)
                        .foregroundColor(Color("Light-Gray"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cian"), lineWidth: 2.0).shadow(color: .white, radius: 6.0))
                }
                
                Text("Iniciar Sesion con Redes Sociales")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Light-Gray"))
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                
                HStack
                {
                    Button {InicioSesionFacebook()}
                    label:
                    {
                        HStack
                        {
                            Image(systemName: "display")
                            Text("Facebook")
                        
                        }.fontWeight(.bold)
                            .foregroundColor(Color("Light-Gray"))
                            .frame(width: 150, height: 40, alignment: .center)
                            .background(Color("Blue-Gray"))
                        .cornerRadius(10.0)
                    }
                    
                    
                    Button {InicioSesionTwitter()}
                    label:
                    {
                        HStack
                        {
                            Image(systemName: "pc")
                            Text("Twitter")
                        
                        }.fontWeight(.bold)
                            .foregroundColor(Color("Light-Gray"))
                            .frame(width: 150, height: 40, alignment: .center)
                            .background(Color("Blue-Gray"))
                        .cornerRadius(10.0)
                        
                    }
                    
                }

                
                
            }.padding(.horizontal, 77)
        }
    }
}





struct RegistroView: View
{
    var body: some View
    {
        Text("soy la vista de registro").foregroundColor(Color.white)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Image("Pantalla1").resizable().ignoresSafeArea()
    }
}


func IniciarSesion()
{
    print("Estoy inciando sesion")
}

func InicioSesionFacebook()
{
    print("Estoy inciando sesion con facebook")
}

func InicioSesionTwitter()
{
    print("Estoy inciando sesion con twitter")
}

//
//  ContentView.swift
//  GameStream
//
//  Created by Mich DMark on 19/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        
        NavigationView
        {
            ZStack
            {
                Spacer()
                Color("Marine").ignoresSafeArea()
                VStack
                {
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    InicioSesionYRegistro()
                    
                }
            }.navigationBarHidden(true)
            
            
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
    @State var passwordVisible: Bool = false
    @State var isPantallaHomeActive: Bool = false
    
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
                    
                    TextField("", text: $correo).foregroundColor(Color("Light-Gray"))
                    
                    
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
                    
                    HStack
                    {
                        if !passwordVisible
                        {
                            SecureField("", text: $password).foregroundColor(Color("Light-Gray"))
                        }
                        else
                        {
                            TextField("", text: $password).foregroundColor(Color("Light-Gray"))
                        }
                        Button(
                            action: {passwordVisible.toggle()},
                            label:
                                {
                                    Image(systemName: "eye.fill")
                                    .foregroundColor(Color("Dark-Cian"))
                                })
                    }
                }
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                                
                Text("Olvidaste tu password??")
                    .font(.footnote).frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom, 70)
                
                Button {iniciarSesion() }
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
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    
                }

                
                
            }.padding(.horizontal, 77)
            
            NavigationLink(
                destination: Home(),
                isActive: $isPantallaHomeActive,
                label: {EmptyView()})
        }
    }
    
    
    func iniciarSesion(){isPantallaHomeActive = true}
}

struct RegistroView: View
{
    @State var correo: String = ""
    @State var password: String = ""
    @State var confirmaPassword: String = ""
    @State var passwordVisible: Bool = false
    
    var body: some View
    {
        ScrollView
        {
            VStack(alignment: .center)
            {
                VStack
                {
                    Text("Elije una foto de perfil")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Light-Gray"))
                    
                    
                    Text("Puedes cambiar o elegirla mas adelante")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                }
                
                    
                
                
                Button(action: tomarFoto, label:
                        {
                        ZStack
                            {
                                Image("perfilEjemplo").resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 100, alignment: .center)
                                
                                Image(systemName: "camera").resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 80, alignment: .center)
                                    .foregroundColor(Color("Light-Gray"))
                            }
                    
                        }).padding(.bottom, 1)
                        
                
                
            }
            
             VStack(alignment: .leading)
             {
                 Text("Correo Electrónico*").foregroundColor(Color("Dark-Cian"))
                     
                 
                 ZStack(alignment: .leading)
                 {
                     if correo.isEmpty
                     {
                         Text(verbatim:"ejemplo@gmail.com").font(.caption)
                             .foregroundColor(Color("Light-Gray"))
                     }
                     
                     TextField("", text: $correo).foregroundColor(Color("Light-Gray"))
                     
                     
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
                     
                     HStack
                     {
                         if !passwordVisible
                         {
                             SecureField("", text: $password).foregroundColor(Color("Light-Gray"))
                         }
                         else
                         {
                             TextField("", text: $password).foregroundColor(Color("Light-Gray"))
                         }
                         Button(
                             action: {passwordVisible.toggle()},
                             label:
                                 {
                                     Image(systemName: "eye.fill")
                                     .foregroundColor(Color("Dark-Cian"))
                                 })
                     }
                 }
                 
                 Divider().frame(height: 1)
                     .background(Color("Dark-Cian"))
                     .padding(.bottom)
                 
                 
                 Text("Confirmar Password").foregroundColor(Color("Light-Gray"))
                 
                 ZStack(alignment: .leading)
                 {
                     if confirmaPassword.isEmpty
                     {
                         Text("Vuelve a escribir tu password").font(.caption)
                             .foregroundColor(Color("Light-Gray"))
                     }
                     
                     HStack
                     {
                         if !passwordVisible
                         {
                             SecureField("", text: $confirmaPassword)
                                 .foregroundColor(Color("Light-Gray"))
                         }
                         else
                         {
                             TextField("", text: $confirmaPassword)
                                 .foregroundColor(Color("Light-Gray"))
                         }
                         Button(
                             action: {passwordVisible.toggle()},
                             label:
                                 {
                                     Image(systemName: "eye.fill")
                                     .foregroundColor(Color("Dark-Cian"))
                                 })
                     }
                 }
                 
                 Divider().frame(height: 1)
                     .background(Color("Dark-Cian"))
                     .padding(.bottom)

             }
             
             .padding(.horizontal, 77)
            
            VStack
            {
                Button {Registrate()}
                label:
                {
                    Text("REGISTRATE").fontWeight(.bold)
                        .foregroundColor(Color("Light-Gray"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cian"), lineWidth: 2.0).shadow(color: .white, radius: 6.0))
                }
                
                
                
                Text("Registrate con Redes Sociales")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Light-Gray"))
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                 
                
               
                HStack
                {
                    Button {RegistroConFacebook()}
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
                    
                    
                    Button {RegistroConTwitter()}
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
            }
            .padding(.horizontal, 77)
                  
             
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //Image("Pantalla1").resizable().ignoresSafeArea()
        Image("Pantalla2").resizable().ignoresSafeArea()
    }
}


//intento para sacar la funcion que manda a home fuera del struct inicio de sesion
func iniciarSesion2()
{ InicioSesionView().isPantallaHomeActive = true }
 


func InicioSesionFacebook(){
    print("Estoy inciando sesion con facebook")
}

func InicioSesionTwitter(){
    print("Estoy inciando sesion con twitter")
}

func tomarFoto(){
    print("Voy a tomar fotografia de perfil")
}

func Registrate(){
    print("Estoy Registrandome")
}

func RegistroConFacebook(){
    print("Estoy registrandome con facebook")
}

func RegistroConTwitter(){
    print("Estoy registrandome con twitter")
}



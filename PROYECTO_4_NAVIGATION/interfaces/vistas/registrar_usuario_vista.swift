//
//  registrar_usuario_vista.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 04/03/26.
//
import SwiftUI

enum CamposRegistrarUsuario: String {
    case nombre = "nombre"
    case apodo = "apodo"
    case edad = "edad"
    case instagram = "instagram"
    case nota = "nota"
}

struct RegistrarUsuario: View {
    @Environment(ControladorGeneral.self) var controlador
    @Environment(\.dismiss) var salir
    
    @State var nombre: String = ""
    @State var instagram: String = ""
    @State var edad: String = ""
    @State var apodo: String = ""
    @State var nota: String = ""
    
    @State var error: ErrorUI? = nil

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Text("Nuevo Usuario")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                
                if(error != nil){
                    Text("Hay un problema, por favor resuelve")
                        .foregroundStyle(.red)
                        .font(.footnote)
                }
                
                // Campos
                VStack(spacing: 15) {
                    CampoTexto(
                        entrada: $nombre,
                        placeholder: "Nombre",
                        error: error,
                        id: CamposRegistrarUsuario.nombre.rawValue
                    )
                    .padding()
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                
                    CampoTexto(
                        entrada: $apodo,
                        placeholder: "Apodo",
                        error: error,
                        id: CamposRegistrarUsuario.apodo.rawValue
                    )
                    .padding()
                    .background(Color(UIColor.darkGray))
                    .cornerRadius(10)
                    .foregroundStyle(.white)
                    
                    // No uso CampoTexto pq estos no tiene validaciones
                    TextField("Edad", text: $edad)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                    
                    TextField("Instagram (ej. @usuario)", text: $instagram)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                    
                    TextField("Nota (Opcional)", text: $nota)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Agregar
                Boton(
                    texto: "Agregar usuario",
                    icono: "person.fill.badge.plus",
                    accion: { validar_entradas() }
                )
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func validar_entradas(){
        if(nombre.isEmpty){
            error = ErrorUI(
                campo: CamposRegistrarUsuario.nombre.rawValue,
                error: "No tienes nombre, no seas webudo y ponte uno",
                nivel_de_error: .gravitsimo
            )
            return
        }
        
        if(apodo.isEmpty){
            error = ErrorUI(
                campo: CamposRegistrarUsuario.apodo.rawValue,
                error: "Apodo no valido, por favor selecciona otro",
                nivel_de_error: .gravitsimo
            )
            return
        }
        
        controlador.agregar_usuario(crear_usuario())
        salir()
        
        apodo = ""
        nombre = ""
        edad = ""
        instagram = ""
        nota = ""
    }
    
    func crear_usuario() -> Usuario{
        return Usuario(
            nombre: nombre,
            edad: Int(edad) ?? 16, // 16 default si se pone algo invalido
            apodo: apodo,
            instagram: instagram,
            nota: nota.isEmpty ? nil : nota, // nil si no ponen nota
            imagen: nil // sin imagen por default pq no hay carga de imagenes
        )
    }
}

#Preview {
    RegistrarUsuario()
        .environment(ControladorGeneral())
}

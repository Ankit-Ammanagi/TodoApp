//
//  NoTodosView.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import SwiftUI

struct NoTodosView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 20) {
                
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .fontWeight(.medium)
                    .padding(.bottom, 10)
                
                NavigationLink("Add Todo",
                               destination: AddTodoView())
                .font(.title2)
                .foregroundStyle(Color.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: Color.blue.opacity(0.7),
                    radius: animate ? 20 : 30,
                    x: 0,
                    y: animate ? 30 : 40
                )
                .padding(.horizontal, animate ? 30 : 50)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            
            Spacer()
            Spacer()
        }
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        Task {
                try? await Task.sleep(for: .seconds(1.5))
                
                withAnimation(
                    .easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)
                ) {
                    animate.toggle()
                }
            }
    }
}

#Preview {
    NavigationStack {
        NoTodosView()
    }
    .navigationTitle("Todo list")
}

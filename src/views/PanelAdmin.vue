<template>
    <div class="container">
      <Navegacion></Navegacion>
      <router-view></router-view>      
    </div>
    
  </template>
  <script>
    import Navegacion from "@/components/Navegacion";
    export default{
      name: 'App',
      components:{
        'Navegacion':Navegacion
      },
      methods:{
        saludar(){
          console.log("Hola");
        }
      }
    } 
  </script>
  
  
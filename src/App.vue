<template>
  <div class="container">
    <!--     <Navegacion></Navegacion>
    <b-message 
        title="Success with icon" 
        type="is-success" 
        has-icon 
        aria-close-label="Close message">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id fermentum quam. Proin sagittis, nibh id hendrerit imperdiet, elit sapien laoreet elit
    </b-message>
<Alumnos></Alumnos> -->
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


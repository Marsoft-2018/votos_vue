<template>
  <div class="card box mt-6">
    <div class="card-content">
      <figure class="image is-3by1">
        <img src="https://colegiosanrafael.com.co/sisvot/IMG/Sisvot_G.png">
      </figure>
      <p class="title">
        Formulario de ingreso
      </p>
      <form v-on:submit.prevent="iniciarSesion">
        
        <b-field label="Nombre de usuario"
            :type="tipo"
            :message="mensaje">
            <b-input v-model="ingreso.id" maxlength="30"></b-input>
        </b-field>

        <b-field label="Contraseña">
            <b-input type="password"
                v-model="ingreso.contrasena"
                password-reveal>
            </b-input>
        </b-field>

        <b-button type="is-primary" :loading="loading" @click="iniciarSesion()">Ingresar</b-button>
      </form>
      <b-notification v-if="error"
            :type="tipo_notificacion"
            aria-close-label="Close notification"
            role="alert">
            {{ mensaje }}
        </b-notification>
      <p class="subtitle is-7 mt-5">
        Copyright © 2022 | Ing. Jose Alfredo Tapia. Todos los derechos reservados.<br>cel: 3107358169<br>El Carmen de Bolívar -- Colombia
      </p>
    </div>
  </div>
    
</template>
<script>
  import axios from 'axios';
    export default{
      name: 'Login',
        data(){
          return {
            submited:false,
            ingreso:{
              id: '',
              contrasena: ''
            },
            error:false,
            mensaje:'Este nombre de usuario es aceptable',
            tipo: "is-success",
            tipo_notificacion:"",
            loading: false,
          }
        },
        methods: {
          iniciarSesion(){
            console.log(this.ingreso);
            try {
              axios.post('http://localhost:21896/api/Login',this.ingreso).then(result =>{              
                //this.mensaje = result.data[0].nombre;
                if (result.data[0].rol == "Estudiante"){
                  if(result.data[0].estado == "No ha votado"){
                    this.$buefy.toast.open({
                        duration: 10000,
                        message: `Bienvenid@:  `+result.data[0].nombre,
                        position: 'is-top',
                        type: 'is-primary',
                        pauseOnHover: true
                    });
                    this.$router.push("./tarjeton/"+result.data[0].id);
                  }else if(result.data[0].estado == "Ya Votó"){
                    // this.error = true;
                    // this.tipo_notificacion = "is-warning mt-4"
                    // this.mensaje = "Usted ya realizó el proceso de votación por ese motivo no puede entrar";
                    this.$buefy.toast.open({
                        duration: 5000,
                        message: `Usted ya realizó el proceso de votación por ese motivo no puede entrar`,
                        position: 'is-bottom-right',
                        type: 'is-warning',
                        pauseOnHover: true
                    });
                  }else{
                    this.error = true;
                    this.mensaje = "El usuario no existe";
                  }
                }else if(result.data[0].rol == "Administrador"){
                  this.$buefy.toast.open({
                        duration: 10000,
                        message: `Bienvenid@:  `+result.data[0].nombre,
                        position: 'is-top-right',
                        type: 'is-primary',
                        pauseOnHover: true
                    });
                  this.$router.push("./PanelAdmin");
                }
              });             
            } catch (error) {
              this.error = true;
              this.tipo_notificacion = "is-danger mt-4"
              this.mensaje = "El usuario no existe";
            }
            }
        }
    }
</script>
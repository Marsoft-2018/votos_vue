<template>
    <section class="container">
        <div class="box">
            <div class="resumen-votos">
                <h3>RESULTADOS DE LA VOTACIÓN</h3> 
            </div>
            <div class="contenedor-votos">
                <div class="tarjeta-candidato box"  v-for="candidato in candidatos" :key="candidato.Id" :style="candidato.color">
                    <div class="can-partido">
                        Partido:<br><strong>{{ candidato.partido }}</strong>                                
                    </div>
                    <div class="can-foto">
                        <!-- <img src='img/{{ candidato.FOTO }}' /> -->
                        foto
                        <div class="can-numero">
                            # 0{{candidato.Id}}
                        </div>
                    </div>
                    <div class="can-votos">
                        <span class="label-votos">Total Votos:</span>
                        <p v-for="votos in conteo" :key="votos.id" ><span v-if="candidato.Id == votos.id">{{ votos.Votos }}</span></p>
                    </div>
                    <div class="can-porcentaje">
                        {{ totalVotos }}
                        <div class="progreso" :style="{'width': '50%'}"></div><span>50%</span>
                    </div>
                    <div class="can-nombre"  style="color: $color_fuente;">{{candidato.nombre1 }} {{candidato.nombre2}}</div>
                    <div class="can-apellidos"  style="color: $color_fuente;">{{candidato.apellido1 }} {{candidato.apellido2}}</div>
                </div>
            </div>
            <div class="container resumen-votos">
                <div class="resultados">
                    componente para los resultados
                </div>
                <div class="abstencion">
                    <h3>Abstención</h3>                    
                </div>
            </div>
        </div>
    </section>
</template>
<script>
    import axios from 'axios'
    export default{
        data() {
            const candidatos = []
            const conteo = []
            return {
                candidatos,
                isBordered: false,
                selected: candidatos[0],
                totalVotos: 0,
                conteo            
            }
        },
        mounted(){
            axios.get("http://localhost:21896/api/Candidatos").then(response => (this.candidatos = response.data));            
            axios.get("http://localhost:21896/api/Registro_Votos").then(response => (this.conteo = response.data));
        },
        computed: {
            numeroVotos: function () {
                return this.conteo.filter(function (c) {
                    for(var i in this.conteo){
                        if(i.id == c){
                            return i.Votos
                        }else{
                            return null
                        }
                    }
                })
            }
        }
    }
</script>
<style scoped>
    .contenedor-votos{
        display: flex;
        flex-flow: row wrap;
        justify-content: center;
        padding: 70px 20px;
        margin: 0 auto;
        font-family: 'Roboto', sans-serif;
        border-top: 3px solid rgba(255,255,255,0.4);
        border-bottom: 3px solid rgba(255,255,255,0.4);
        background: linear-gradient(0deg, #141431, #4444b1, #ddddff, #4444b1, #141431);
    }
    
    .resumen-votos{
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-around;
        padding: 20px;
        margin: 0 auto;
        font-family: 'Roboto', sans-serif;
        background-color: #141431;        
        color: #fff;
    }
    
    .resumen-votos .abstencion{
        border-left: 1px solid #cecece;
        align-self: flex-end;
        padding: 0px 30px;
    }
    
    .tarjeta-candidato{
        display: flex;
        flex-flow: column nowrap;
        padding: 0px;
        margin: 10px;
        width: 240px;
        background-color: #fff;
        border: 2px solid #fff;        
    }
    
    .tarjeta-candidato .can-partido{
        width: 100%;
        color: #fff;
        font-size: 0.7em;
        padding: 10px 5px;
    }
    
    .tarjeta-candidato .can-foto{
        height: 250px;
        width:100%;
        display: flex;
        justify-content: space-around;
        position: relative;
    }
    
    .tarjeta-candidato .can-foto img{
        height: 100%;
        width:100%;
    }
    
    .tarjeta-candidato .can-foto .can-numero{
        padding: 5px;
        font-size: 3em;
        text-align: center;
        color: #fff;
        background-color: rgba(0,0,0,0.6);        
        position: absolute;
        bottom: 0px;
        right: 0px;
        border-radius: 20px 0px 0px 0px;
    }

    .tarjeta-candidato .can-votos{
        position: relative;
        padding: 0px;
        width:100%;
        display: flex;
        justify-content: center;
        background-color:  #000;
        color: #fff;
        font-size: 2em;
        
    }
    
    .label-votos{
        position: absolute;
        top: 0px;
        left: 0px;
        font-size: 0.3em;
        padding: 2px 5px;
        text-weigth: bold;        
    }
        
    .tarjeta-candidato .can-porcentaje{
        height: 15px;
        width:100%;
        display: flex;
        justify-content: flex-start;
        align-items:center;
        background-color:  #141431;
        font-size: 0.7em;
        color: #fff;
    }
    
    .tarjeta-candidato .can-porcentaje .progreso{
        height: 100%;
        display: flex;
        justify-content: flex-start;
        background: linear-gradient(90deg, #134d13, #23bd43, #23fd43, #93fda3);
        margin-right: 3px;
    }
    .tarjeta-candidato .can-nombre{
        text-transform: uppercase;
        font-size: 0.9em;
        padding: 0px 5px;
        width:100%;
    }
    
    .tarjeta-candidato .can-apellidos{
        text-transform: uppercase;
        font-size: 1.2em;
        padding: 0px 5px;
        width:100%;
    }
</style>
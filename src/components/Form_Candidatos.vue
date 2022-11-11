<template>
    <div class="container">
        <h3 class="title is-1 mt-4">LISTADO DE POSIBLES CANDIDATOS</h3>
        <section class="box mt-6">
            <b-table
                :data="datos"
                :checked-rows.sync="seleccionados"
                checkable
                :checkbox-position="checkboxPosition"
                :checkbox-type="checkboxType"
                focusable>
                <b-table-column field="id" label="Código" width="40" numeric v-slot="props">
                    {{ props.row.id }}
                </b-table-column>
                <b-table-column field="grado" label="Grado"  v-slot="props">
                    {{ props.row.grado }}
                </b-table-column>
                <b-table-column field="nombre_completo" label="Nombre completo"    v-slot="props">
                    {{ props.row.nombre_completo }}
                </b-table-column>
            </b-table>
            <b-button class="is-primary" type="button"  @click="isComponentModalActive = true">Guardar</b-button> 
        </section>
    </div>
</template>
<script>
    import axios from 'axios';
    export default {
        data() {
            const datos = []

            return {
                datos,
                isBordered: false,
                checkboxPosition: 'right',
                checkboxType: 'is-success',
                seleccionados: []                 
            }
        },
        mounted(){
            axios.get("http://localhost:21896/api/Candidatos/aspirantes").then(response => (this.datos = response.data))
        }
    }
</script>
<style scoped>

</style>